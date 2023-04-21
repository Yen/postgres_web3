-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION postgres_web3" to load this file. \quit

-- #region int128 inout functions

CREATE FUNCTION int128_in(cstring)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_out(int128)
RETURNS cstring
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_send(int128)
RETURNS bytea
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_recv(internal)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region uint128 inout functions

CREATE FUNCTION uint128_in(cstring)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_out(uint128)
RETURNS cstring
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_send(uint128)
RETURNS bytea
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_recv(internal)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region int128 operator functions

CREATE FUNCTION int128_add(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_sub(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_mul(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_div(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_mod(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_lt(int128, int128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_gt(int128, int128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_lteq(int128, int128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_gteq(int128, int128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_eq(int128, int128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_neq(int128, int128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_uplus(int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_uminus(int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_abs(int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_bitand(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_bitor(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_bitxor(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_bitnot(int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_bitshiftleft(int128, integer)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_bitshiftright(int128, integer)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region uint128 operator functions

CREATE FUNCTION uint128_add(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_sub(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_mul(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_div(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_mod(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_lt(uint128, uint128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_gt(uint128, uint128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_lteq(uint128, uint128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_gteq(uint128, uint128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_eq(uint128, uint128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_neq(uint128, uint128)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_uplus(uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_uminus(uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_abs(uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_bitand(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_bitor(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_bitxor(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_bitnot(uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_bitshiftleft(uint128, integer)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_bitshiftright(uint128, integer)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region int128 aggregate functions

CREATE FUNCTION int128_min(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_max(int128, int128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_avg_accum(internal, int128)
RETURNS internal
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

CREATE FUNCTION int128_avg_combine(internal, internal)
RETURNS internal
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

CREATE FUNCTION int128_avg_final(internal)
RETURNS numeric
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

-- #endregion

-- #region uint128 aggregate functions

CREATE FUNCTION uint128_min(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_max(uint128, uint128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_avg_accum(internal, uint128)
RETURNS internal
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

CREATE FUNCTION uint128_avg_combine(internal, internal)
RETURNS internal
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

CREATE FUNCTION uint128_avg_final(internal)
RETURNS numeric
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

-- #endregion

-- #region int128 cast functions

CREATE FUNCTION int128_as_int2(int128)
RETURNS smallint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_as_int4(int128)
RETURNS integer
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_as_int8(int128)
RETURNS bigint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_as_uint128(int128)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int2_as_int128(smallint)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int4_as_int128(integer)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int8_as_int128(bigint)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region uint128 cast functions

CREATE FUNCTION uint128_as_int2(uint128)
RETURNS smallint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_as_int4(uint128)
RETURNS integer
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_as_int8(uint128)
RETURNS bigint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_as_int128(uint128)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int2_as_uint128(smallint)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int4_as_uint128(integer)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int8_as_uint128(bigint)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region int128

CREATE TYPE int128(
    INPUT = int128_in,
    OUTPUT = int128_out,
    SEND = int128_send,
    RECEIVE = int128_recv,
    INTERNALLENGTH = 16,
    STORAGE = PLAIN
);

-- #endregion

-- #region uint128

CREATE TYPE uint128(
    INPUT = uint128_in,
    OUTPUT = uint128_out,
    SEND = uint128_send,
    RECEIVE = uint128_recv,
    INTERNALLENGTH = 16,
    STORAGE = PLAIN
);

-- #endregion

-- #region int128 operators

CREATE OPERATOR +(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_add,
    COMMUTATOR = +
);

CREATE OPERATOR -(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_sub
);

CREATE OPERATOR *(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_mul,
    COMMUTATOR = *
);

CREATE OPERATOR /(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_div
);

CREATE OPERATOR %(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_mod
);

CREATE OPERATOR <(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_lt,
    NEGATOR = >=
);

CREATE OPERATOR >(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_gt,
    NEGATOR = <=
);

CREATE OPERATOR <=(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_lteq,
    NEGATOR = >
);

CREATE OPERATOR >=(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_gteq,
    NEGATOR = <
);

CREATE OPERATOR =(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_eq,
    COMMUTATOR = =,
    NEGATOR = <>
);

CREATE OPERATOR <>(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_neq,
    COMMUTATOR = <>,
    NEGATOR = =
);

CREATE OPERATOR +(
    RIGHTARG = int128,
    FUNCTION = int128_uplus
);

CREATE OPERATOR -(
    RIGHTARG = int128,
    FUNCTION = int128_uminus
);

CREATE OPERATOR @(
    RIGHTARG = int128,
    FUNCTION = int128_abs
);

CREATE OPERATOR &(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_bitand,
    COMMUTATOR = &
);

CREATE OPERATOR |(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_bitor,
    COMMUTATOR = |
);

CREATE OPERATOR #(
    LEFTARG = int128,
    RIGHTARG = int128,
    FUNCTION = int128_bitxor,
    COMMUTATOR = #
);

CREATE OPERATOR ~(
    RIGHTARG = int128,
    FUNCTION = int128_bitnot
);

CREATE OPERATOR <<(
    LEFTARG = int128,
    RIGHTARG = integer,
    FUNCTION = int128_bitshiftleft
);

CREATE OPERATOR >>(
    LEFTARG = int128,
    RIGHTARG = integer,
    FUNCTION = int128_bitshiftright
);

-- #endregion

-- #region uint128 operators

CREATE OPERATOR +(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_add,
    COMMUTATOR = +
);

CREATE OPERATOR -(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_sub
);

CREATE OPERATOR *(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_mul,
    COMMUTATOR = *
);

CREATE OPERATOR /(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_div
);

CREATE OPERATOR %(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_mod
);

CREATE OPERATOR <(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_lt,
    NEGATOR = >=
);

CREATE OPERATOR >(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_gt,
    NEGATOR = <=
);

CREATE OPERATOR <=(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_lteq,
    NEGATOR = >
);

CREATE OPERATOR >=(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_gteq,
    NEGATOR = <
);

CREATE OPERATOR =(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_eq,
    COMMUTATOR = =,
    NEGATOR = <>
);

CREATE OPERATOR <>(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_neq,
    COMMUTATOR = <>,
    NEGATOR = =
);

CREATE OPERATOR +(
    RIGHTARG = uint128,
    FUNCTION = uint128_uplus
);

CREATE OPERATOR -(
    RIGHTARG = uint128,
    FUNCTION = uint128_uminus
);

CREATE OPERATOR @(
    RIGHTARG = uint128,
    FUNCTION = uint128_abs
);

CREATE OPERATOR &(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_bitand,
    COMMUTATOR = &
);

CREATE OPERATOR |(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_bitor,
    COMMUTATOR = |
);

CREATE OPERATOR #(
    LEFTARG = uint128,
    RIGHTARG = uint128,
    FUNCTION = uint128_bitxor,
    COMMUTATOR = #
);

CREATE OPERATOR ~(
    RIGHTARG = uint128,
    FUNCTION = uint128_bitnot
);

CREATE OPERATOR <<(
    LEFTARG = uint128,
    RIGHTARG = integer,
    FUNCTION = uint128_bitshiftleft
);

CREATE OPERATOR >>(
    LEFTARG = uint128,
    RIGHTARG = integer,
    FUNCTION = uint128_bitshiftright
);

-- #endregion

-- #region int128 casts

CREATE CAST (int128 as smallint) WITH FUNCTION int128_as_int2 AS ASSIGNMENT;
CREATE CAST (int128 as integer) WITH FUNCTION int128_as_int4 AS ASSIGNMENT;
CREATE CAST (int128 as bigint) WITH FUNCTION int128_as_int8 AS ASSIGNMENT;
CREATE CAST (int128 as uint128) WITH FUNCTION int128_as_uint128 AS ASSIGNMENT;

CREATE CAST (smallint as int128) WITH FUNCTION int2_as_int128 AS IMPLICIT;
CREATE CAST (integer as int128) WITH FUNCTION int4_as_int128 AS IMPLICIT;
CREATE CAST (bigint as int128) WITH FUNCTION int8_as_int128 AS IMPLICIT;

-- #endregion

-- #region uint128 casts

CREATE CAST (uint128 as smallint) WITH FUNCTION uint128_as_int2 AS ASSIGNMENT;
CREATE CAST (uint128 as integer) WITH FUNCTION uint128_as_int4 AS ASSIGNMENT;
CREATE CAST (uint128 as bigint) WITH FUNCTION uint128_as_int8 AS ASSIGNMENT;
CREATE CAST (uint128 as int128) WITH FUNCTION uint128_as_int128 AS ASSIGNMENT;

CREATE CAST (smallint as uint128) WITH FUNCTION int2_as_uint128 AS ASSIGNMENT;
CREATE CAST (integer as uint128) WITH FUNCTION int4_as_uint128 AS ASSIGNMENT;
CREATE CAST (bigint as uint128) WITH FUNCTION int8_as_uint128 AS ASSIGNMENT;

-- #endregion

-- #region int128 aggregates

CREATE AGGREGATE sum(int128) (
    SFUNC = int128_add,
    STYPE = int128,
    COMBINEFUNC = int128_add,
    initcond = '0'
);

CREATE AGGREGATE min(int128) (
    SFUNC = int128_min,
    STYPE = int128,
    SORTOP = <,
    COMBINEFUNC = int128_min
);

CREATE AGGREGATE max(int128) (
    SFUNC = int128_max,
    STYPE = int128,
    SORTOP = >,
    COMBINEFUNC = int128_max
);

CREATE AGGREGATE avg(int128) (
    SFUNC = int128_avg_accum,
    STYPE = internal,
    SSPACE = 16,
    COMBINEFUNC = int128_avg_combine,
    FINALFUNC = int128_avg_final
);

-- #endregion

-- #region uint128 aggregates

CREATE AGGREGATE sum(uint128) (
    SFUNC = uint128_add,
    STYPE = uint128,
    COMBINEFUNC = uint128_add,
    initcond = '0'
);

CREATE AGGREGATE min(uint128) (
    SFUNC = uint128_min,
    STYPE = uint128,
    SORTOP = <,
    COMBINEFUNC = uint128_min
);

CREATE AGGREGATE max(uint128) (
    SFUNC = uint128_max,
    STYPE = uint128,
    SORTOP = >,
    COMBINEFUNC = uint128_max
);

CREATE AGGREGATE avg(uint128) (
    SFUNC = uint128_avg_accum,
    STYPE = internal,
    SSPACE = 16,
    COMBINEFUNC = uint128_avg_combine,
    FINALFUNC = uint128_avg_final
);

-- #endregion
