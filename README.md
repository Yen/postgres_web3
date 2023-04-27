# postgres_web3

[![ci-docker](https://github.com/Yen/postgres_web3/actions/workflows/ci-docker.yml/badge.svg)](https://github.com/Yen/postgres_web3/actions/workflows/ci-docker.yml)

A PostgreSQL extension implementing a collection of optimized data types for web3 applications, _and other applications with coinciding requirements_.

- [Rationale](#rationale)
- [Data types](#data-types)
- [Compiling and installing](#compiling-and-installing)
- [Usage](#usage)

## Docker container images

Container images are available for `linux/amd64`. The postgres_web3 image may build on other platforms.

_Currently only a modified version of the alpine linux postgres image is available and should support all functionality and features of the official postgres image. We hope to support a version of every tag supported by the dockerhub official postgres image, but at this time, building postgres with postgres_web3 makes this difficult to achieve. See the [compiling and installing](#compiling-and-installing) section for details._

- [Docker Hub](https://hub.docker.com/r/georgebott/postgres_web3)
- [Github Container Registry](https://ghcr.io/yen/postgres_web3)

# Rationale

Current mainstream databases do not contain data types capable of representing larger integers and binary types used in the web3 ecosystem without compromise. Certain domain specific databases do have better support, but they are often not useful as a general purpose database. In PostgreSQL, we can represent web3 domain specific data with either `text` or `numeric`, but these have downsides as they have considerably performance and storage implications as well as their lack of integer operators.

In order to address these issues, postgres_web3 adds fixed signed and unsigned integers as well as binary types with a full suite of operators and conversion functions in order to make using data more performant, efficient, and easier to implement.

# Data types

- `int128` A signed 128 bit integer
- `uint128` A unsigned 128 bit integer
- `int256` A signed 256 bit integer
- `uint256` A unsigned 256 bit integer
- `hex160` A 160 bit hex string (Such as ethereum addresses)
- `hex256` A 256 bit hex string (Such as ethereum block hashes)

Integer data types are constructable from a base-10 integer string (e.g. `'1000'::int128`). For compatibility, unsigned data types can be constructed with negative values but only if the negative integer string is `'-0'`.

Hex data types are constructed from a case-insensitive non-prefixed base-16 hex string following the PostgreSQL `decode(..., 'hex')` behavior (e.g. `'0123AbCd'::hex160`).

Hex data types are string serialized to a lower case hex string following the PostgreSQL `encode(..., 'hex')` behaviour (e.g. `'0123abcd'`). Common PostgreSQL functions can be used to generate formats that may be easier to accept as input directly from the query. (e.g. for an ethereum address format: `CONCAT('0x', LPAD('88FF'::hex160::text, 20, '0')))` -> `0x00000000000000000000000000000000000088ff`)

Hex data types do not preserve the case of input strings (e.g. `'FF'::hex160` is equivalent to `'ff'::hex160` for all operations, and vice versa).

_More data types may be added in the future if they are seen to be prevelant throughout the web3 ecosystem. postgres_web3 is not tied to ethereum and may adopt types that are seen as beneficial to non-ethereum chains._

## Available operators

_For easier compatibility with existing expressions, operators relating to the sign of numbers (`uplus`, `uminus`, `abs`) are implemented for signed and unsigned types. Where applicable, these may raise "out of range" errors. An example of this is calling `uminus` on a unsigned integer type with a value other than `0`._

- add (`type + type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`
- sub (`type - type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`
- mul (`type * type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`
- div (`type / type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`
- mod (`type % type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`
- lt (`type < type`) -> `boolean` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- gt (`type > type`) -> `boolean` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- lteq (`type <= type`) -> `boolean` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- gteq (`type >= type`) -> `boolean` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- eq (`type = type`) -> `boolean` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- neq (`type <> type`) -> `boolean` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- uplus (`+type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`
- uminus (`-type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`
- abs (`@type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`
- bitand (`type & type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- bitor (`type | type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- bitxor (`type # type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- bitnot (`~type`) -> `type` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- bitshiftleft (`type << integer`) -> `type` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`
- bitshiftright (`type >> integer`) -> `type` for `int128`, `uint128`, `int256`, `uint256`, `hex160`, `hex256`

## Available casts

Casts in PostgreSQL can by default require an explicit cast operator (`::type`). They can also be fully implicit or only implicit on assignment. [See the PostgreSQL documentation for more info.](https://www.postgresql.org/docs/15/sql-createcast.html)

_We follow the PostgreSQL pattern of only allowing implicit casts for types that will never fail to convert. As such, casting from any signed integer type to any unsigned integer type is not an implicit cast in postgres_web3._

|From          |As `smallint`|As `integer`|As `bigint`|As `int128`|As `uint128`|As `int256`|As `uint256`|As `hex160`|As `hex256`|
|---           |---          |---         |---        |---        |---         |---        |---         |---        |---        |
|**`smallint`**|             |implicit    |implicit   |implicit   |assignment  |implicit   |assignment  |explicit   |explicit   |
|**`integer`** |assignment   |            |implicit   |implicit   |assignment  |implicit   |assignment  |explicit   |explicit   |
|**`bigint`**  |assignment   |assignment  |           |implicit   |assignment  |implicit   |assignment  |explicit   |explicit   |
|**`int128`**  |assignment   |assignment  |assignment |           |assignment  |implicit   |assignment  |explicit   |explicit   |
|**`uint128`** |assignment   |assignment  |assignment |assignment |            |assignment |implicit    |explicit   |explicit   |
|**`int256`**  |assignment   |assignment  |assignment |assignment |assignment  |           |assignment  |explicit   |explicit   |
|**`uint256`** |assignment   |assignment  |assignment |assignment |assignment  |assignment |            |explicit   |explicit   |
|**`hex160`**  |explicit     |explicit    |explicit   |explicit   |explicit    |explicit   |explicit    |           |implicit   |
|**`hex256`**  |explicit     |explicit    |explicit   |explicit   |explicit    |explicit   |explicit    |assignment |           |

## Available aggregates

- `sum(type)` -> `type` for `int128`, `uint128`, `int256`, `uint256`
- `min(type)` -> `type` for `int128`, `uint128`, `int256`, `uint256`
- `max(type)` -> `type` for `int128`, `uint128`, `int256`, `uint256`
- `avg(type)` -> `numeric` for `int128`, `uint128`, `int256`, `uint256`

_The `avg(type)` family of aggregates are currently implemented using a `double precision` sum type internally and are not accurate for larger sums. We hope to address this in the future._

# Compiling and installing

**As of April 2023 (time of writing), compiling and installing postgres_web3 is more complicated than we would like due to a number of factors described below. We highly recommend using one of the pre-built [docker container images listed at the top of this document](#docker-container-images) rather than building postgres_web3 from source yourself.**

postgres_web3 uses the PostgreSQL PGXS extension tooling to build, as such, PGXS requires a full install of PostgreSQL to be present.

Although we do not intend to cover the details of building PostgreSQL itself, as it's currently required to be built in a non-conventional way for postgres_web3 to be able to build against it, we will outline the key points here. Most notably, PostgreSQL should be configured with `CC=clang16` `CXX=clang++16` flags. `--with-llvm` must not be set. The reason for this is that postgres_web3 requires C23 `_BitInt` which only has proper support in clang16, and PostgreSQL is unable to build with llvm>15. As such, the llvm bitcode generated by clang16 cannot be consumed by the llvm module of PostgreSQL. Disabling the llvm features in PostgreSQL fixes this issue and hopefully PostgreSQL will support a more modern version of llvm in the future making this change unnecessary.

postgres_web3 makes use of the non-standard `__builtin_[op]_overflow` family of functions to implement overflow checked mathematical operatons. These functions are available on modern GCC and Clang compilers but not MSVC. As we do not currently implement a fallback for this compiler-specific feature, compilers not supporting this feature are unable to compile the extension. C23 will bring `<stdckdint.h>` and a family of C23 standard checked mathematical functions, we will likely switch to these functions once widely supported.

Assuming a correctly configured PostgreSQL installation is present:

- `make && sudo make install`

# Usage

Once postgres_web3 is installed, execute `CREATE EXTENSION postgres_web3` to enable the extension.
