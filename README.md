# postgres_web3

[![ci-docker](https://github.com/Yen/postgres_web3/actions/workflows/ci-docker.yml/badge.svg)](https://github.com/Yen/postgres_web3/actions/workflows/ci-docker.yml)

A PostgreSQL extension implementing a collection of optimized data types for web3 applications, _and other applications with coinciding requirements_.

**WARNING:** postgres_web3 is not in a completed state despite the version number of the extension being 1.0, as such no explicit attempts to maintain backwards compatibility or upgradability are being made at this time.

- [Rationale](#rationale)
- [Data types](#data-types)
- [Compiling and installing](#compiling-and-installing)
- [Usage](#usage)

## Docker container images

Container images are available for `linux/386`, `linux/amd64`, and `linux/arm64`. The postgres_web3 image may build on other platforms.

- [Docker Hub](https://hub.docker.com/r/georgebott/postgres_web3)
- [Github Container Registry](https://ghcr.io/yen/postgres_web3)

# Rationale

Current mainstream databases do not contain data types capable of representing larger integers and binary types used in the web3 ecosystem without compromise. Certain domain specific databases do have better support, but they are often not useful as a general purpose database. In PostgreSQL, we can represent web3 domain specific data with either `text` or `numeric`, but these have downsides as they have considerably performance and storage implications as well as their lack of integer operators.

In order to address these issues, postgres_web3 adds fixed signed and unsigned integers as well as binary types with a full suite of operators and conversion functions in order to make using data more performant, efficient, and easier to implement.

# Data types

- `int128` A signed 128 bit integer
- ~~`int256` A signed 256 bit integer~~ (TODO)
- ~~`uint128` A unsigned 128 bit integer~~ (TODO)
- ~~`uint256` A unsigned 256 bit integer~~ (TODO)
- ~~`hex256` A 256 bit hex string (Such as ethereum block hashes)~~ (TODO)
- ~~`hex160` A 160 bit hex string (Such as ethereum addresses)~~ (TODO)

_More data types may be added in the future if they are seen to be prevelant throughout the web3 ecosystem. postgres_web3 is not tied to ethereum and may adopt types that are seen as beneficial to non-ethereum chains._

## Available operators

- add (`type + type`) -> `type` for `int128`
- sub (`type - type`) -> `type` for `int128`
- mul (`type * type`) -> `type` for `int128`
- div (`type / type`) -> `type` for `int128`
- mod (`type % type`) -> `type` for `int128`
- lt (`type < type`) -> `boolean` for `int128`
- gt (`type > type`) -> `boolean` for `int128`
- lteq (`type <= type`) -> `boolean` for `int128`
- gteq (`type >= type`) -> `boolean` for `int128`
- eq (`type = type`) -> `boolean` for `int128`
- neq (`type <> type`) -> `boolean` for `int128`
- uplus (`+type`) -> `type` for `int128`
- uminus (`-type`) -> `type` for `int128`
- abs (`@type`) -> `type` for `int128`
- bitand (`type & type`) -> `type` for `int128`
- bitor (`type | type`) -> `type` for `int128`
- bitxor (`type # type`) -> `type` for `int128`
- bitnot (`~type`) -> `type` for `int128`
- bitshiftleft (`type << integer`) -> `type` for `int128`
- bitshiftright (`type >> integer`) -> `type` for `int128`

## Available casts

Casts in PostgreSQL can by default require an explicit cast operator (`::type`). They can also be fully implicit or only implicit on assignment. [See the PostgreSQL documentation for more info.](https://www.postgresql.org/docs/15/sql-createcast.html)

|From          |As `smallint`|As `integer`|As `bigint`|As `int128`|
|---           |---          |---         |---        |---        |
|**`smallint`**|             |implicit    |implicit   |implicit   |
|**`integer`** |assignment   |            |implicit   |implicit   |
|**`bigint`**  |assignment   |assignment  |           |implicit   |
|**`int128`**  |assignment   |assignment  |assignment |           |

## Available aggregates

- `sum(type)` -> `type` for `int128`
- `min(type)` -> `type` for `int128`
- `max(type)` -> `type` for `int128`
- `avg(type)` -> `double precision` for `int128`

_The `avg(type)` family of aggregates are only implemented using a `double precision` return type and as such, are not accurate for larger sums._

# Compiling and installing

postgres_web3 is in a pre-1.0 state and precise building instructions have not been finalized.

**As of April 2023 (time of writing), compiling and installing postgres_web3 is more complicated than we would like due to a number of factors. We highly recommend using one of the pre-built docker container images listed at the top of this document rather than building postgres_web3 from source yourself.**

postgres_web3 uses the PostgreSQL PGXS extension tooling to build, as such, PGXS requires a full install of PostgreSQL to be present.

Although we do not intend to cover the details of building PostgreSQL itself, as it's currently required to be built in a non-conventional way for postgres_web3 to be able to build against it, we will outline the key points here. Most notably, PostgreSQL should be configured with `CC=clang16` `CXX=clang++16` flags. `--with-llvm` must not be set. The reason for this is that postgres_web3 requires C23 `_BitInt` which only has proper support in clang16, and PostgreSQL is unable to build with llvm>15. As such, the llvm bitcode generated by clang16 cannot be consumed by the llvm module of PostgreSQL. Disabling the llvm features in PostgreSQL fixes this issue and hopefully PostgreSQL will support a more modern version of llvm in the future making this change unnecessary.

postgres_web3 makes use of the non-standard `__builtin_[op]_overflow` family of functions to implement overflow checked mathematical operatons. These functions are available on modern GCC and Clang compilers but not MSVC. As we do not currently implement a fallback for this compiler-specific feature, compilers not supporting this feature are unable to compile the extension. C23 will bring `<stdckdint.h>` and a family of C23 standard checked mathematical functions, we will likely switch to these functions once widely supported.

Assuming a correctly configured PostgreSQL installation is present:

- `make && sudo make install`

# Usage

Once postgres_web3 is installed, execute `CREATE EXTENSION postgres_web3` to enable the extension.
