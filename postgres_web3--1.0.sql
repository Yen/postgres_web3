-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION postgres_web3" to load this file. \quit

-- int128 inout functions

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

-- int128 operator functions

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

-- int128 aggregate functions

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

-- int128 cast functions

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

-- int128

CREATE TYPE int128(
    INPUT = int128_in,
    OUTPUT = int128_out,
    SEND = int128_send,
    RECEIVE = int128_recv,
    INTERNALLENGTH = 16,
    STORAGE = PLAIN
);

-- int128 operators

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

-- int128 casts

CREATE CAST (int128 as smallint) WITH FUNCTION int128_as_int2 AS ASSIGNMENT;
CREATE CAST (int128 as integer) WITH FUNCTION int128_as_int4 AS ASSIGNMENT;
CREATE CAST (int128 as bigint) WITH FUNCTION int128_as_int8 AS ASSIGNMENT;

CREATE CAST (smallint as int128) WITH FUNCTION int2_as_int128 AS IMPLICIT;
CREATE CAST (integer as int128) WITH FUNCTION int4_as_int128 AS IMPLICIT;
CREATE CAST (bigint as int128) WITH FUNCTION int8_as_int128 AS IMPLICIT;

-- int128 aggregates

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
