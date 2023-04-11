# postgres_web3

A PostgreSQL extension implementing a collection of optimized data types for web3 applications, _and other applications with coinciding requirements_.

**WARNING:** postgres_web3 is not in a completed state despite the version number of the extension being 1.0, as such no explicit attempts to maintain backwards compatibility or upgradability are being made at this time.

- [Rational](#rational)
- [Data types](#data-types)
- [Compiling and installing](#compiling-and-installing)
- [Usage](#usage)

# Rational

Current mainstream databases do not contain data types capable of representing larger integers and binary types used in the web3 ecosystem without compromise. Certain domain specific databases do have better support, but they are often not useful as a general purpose database. In postgres, we can represent web3 domain specific data with either `text` or `numeric`, but these have downsides as they have considerably performance and storage implications as well as their lack of integer operators.

In order to address these issues, postgres_web3 adds fixed signed and unsigned integers as well as binary types with a full suite of operators and conversion functions in order to make using data more performant, efficient, and easier to implement.

# Data types

- `int128` A signed 128 bit integer
- ~~`int256` A signed 256 bit integer~~ (TODO)
- ~~`uint128` A unsigned 128 bit integer~~ (TODO)
- ~~`uint256` A unsigned 256 bit integer~~ (TODO)
- ~~`hex256` A 256 bit hex string (Such as ethereum block hashes)~~ (TODO)
- ~~`hex160` A 160 bit hex string (Such as ethereum addresses)~~ (TODO)

_More data types may be added in the future if they are seen to be prevelant throughout the web3 ecosystem. postgres_web3 is not tied to ethereum and may adopt types that are seen as beneficial to non-ethereum chains._

# Compiling and installing

postgres_web3 is in a pre-1.0 state and precise building instructions have not been finalized.

postgres_web3 uses the C23 (awating finalization) bit precise integer type (`_BitInt`) to represent its integers types and to implement mathematical operations. As of April 2023 (time of writing), it is likely that trying to build against a default postgres installation will fail as PGXS will not use a compiler supporting this feature until C23 is widely supported. As such, building postgresql with a compiler supporting this feature (clang-16 for example), then building the extension is the recommended method.

postgres_web3 uses the `__builtin_[op]_overflow` family of functions to implement overflow checked mathematical operatons. These functions are available on modern GCC and Clang compilers but not MSVC. As we do not currently implement a fallback for this compiler-specific feature, compilers not supporting this feature are unable to compile the extension.

In order to compile, you must have `pg_config` present in your path and run `make`.

To install, run `make install` (this may require sudo access).

# Usage

Once postgres_web3 is installed, execute `CREATE EXTENSION postgres_web3` to enable the extension.
