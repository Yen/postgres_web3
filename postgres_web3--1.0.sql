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

-- int128 cast functions

CREATE FUNCTION int128_as_int2(int128)
RETURNS int2
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_as_int4(int128)
RETURNS int4
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_as_int8(int128)
RETURNS int8
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int2_as_int128(int2)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int4_as_int128(int4)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int8_as_int128(int8)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- int128

CREATE TYPE int128(
    INPUT = int128_in,
    OUTPUT = int128_out,
    INTERNALLENGTH = 16,
    STORAGE = PLAIN
);

-- int128 operators

CREATE OPERATOR +(
    leftarg = int128,
    rightarg = int128,
    function = int128_add,
    commutator = +
);

CREATE OPERATOR -(
    leftarg = int128,
    rightarg = int128,
    function = int128_sub
);

CREATE OPERATOR *(
    leftarg = int128,
    rightarg = int128,
    function = int128_mul,
    commutator = *
);

CREATE OPERATOR /(
    leftarg = int128,
    rightarg = int128,
    function = int128_div
);

CREATE OPERATOR %(
    leftarg = int128,
    rightarg = int128,
    function = int128_mod
);

CREATE OPERATOR <(
    leftarg = int128,
    rightarg = int128,
    function = int128_lt,
    negator = >=
);

CREATE OPERATOR >(
    leftarg = int128,
    rightarg = int128,
    function = int128_gt,
    negator = <=
);

CREATE OPERATOR <=(
    leftarg = int128,
    rightarg = int128,
    function = int128_lteq,
    negator = >
);

CREATE OPERATOR >=(
    leftarg = int128,
    rightarg = int128,
    function = int128_gteq,
    negator = <
);

CREATE OPERATOR =(
    leftarg = int128,
    rightarg = int128,
    function = int128_eq,
    commutator = =,
    negator = <>
);

CREATE OPERATOR <>(
    leftarg = int128,
    rightarg = int128,
    function = int128_neq,
    commutator = <>,
    negator = =
);

CREATE OPERATOR +(
    rightarg = int128,
    function = int128_uplus
);

CREATE OPERATOR -(
    rightarg = int128,
    function = int128_uminus
);

CREATE OPERATOR @(
    rightarg = int128,
    function = int128_abs
);

CREATE OPERATOR &(
    leftarg = int128,
    rightarg = int128,
    function = int128_bitand,
    commutator = &
);

CREATE OPERATOR |(
    leftarg = int128,
    rightarg = int128,
    function = int128_bitor,
    commutator = |
);

CREATE OPERATOR #(
    leftarg = int128,
    rightarg = int128,
    function = int128_bitxor,
    commutator = #
);

CREATE OPERATOR ~(
    rightarg = int128,
    function = int128_bitnot
);

CREATE OPERATOR <<(
    leftarg = int128,
    rightarg = integer,
    function = int128_bitshiftleft
);

CREATE OPERATOR >>(
    leftarg = int128,
    rightarg = integer,
    function = int128_bitshiftright
);

-- int128 casts

CREATE CAST (int128 as int2) WITH FUNCTION int128_as_int2 AS ASSIGNMENT;
CREATE CAST (int128 as int4) WITH FUNCTION int128_as_int4 AS ASSIGNMENT;
CREATE CAST (int128 as int8) WITH FUNCTION int128_as_int8 AS ASSIGNMENT;

CREATE CAST (int2 as int128) WITH FUNCTION int2_as_int128 AS IMPLICIT;
CREATE CAST (int4 as int128) WITH FUNCTION int4_as_int128 AS IMPLICIT;
CREATE CAST (int8 as int128) WITH FUNCTION int8_as_int128 AS IMPLICIT;