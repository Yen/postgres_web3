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

-- #region int256 inout functions

CREATE FUNCTION int256_in(cstring)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_out(int256)
RETURNS cstring
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_send(int256)
RETURNS bytea
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_recv(internal)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region uint256 inout functions

CREATE FUNCTION uint256_in(cstring)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_out(uint256)
RETURNS cstring
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_send(uint256)
RETURNS bytea
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_recv(internal)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region hex160 inout functions

CREATE FUNCTION hex160_in(cstring)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_out(hex160)
RETURNS cstring
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_send(hex160)
RETURNS bytea
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_recv(internal)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region hex256 inout functions

CREATE FUNCTION hex256_in(cstring)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_out(hex256)
RETURNS cstring
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_send(hex256)
RETURNS bytea
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_recv(internal)
RETURNS hex256
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

-- #region int256 operator functions

CREATE FUNCTION int256_add(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_sub(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_mul(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_div(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_mod(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_lt(int256, int256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_gt(int256, int256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_lteq(int256, int256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_gteq(int256, int256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_eq(int256, int256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_neq(int256, int256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_uplus(int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_uminus(int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_abs(int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_bitand(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_bitor(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_bitxor(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_bitnot(int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_bitshiftleft(int256, integer)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_bitshiftright(int256, integer)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region uint256 operator functions

CREATE FUNCTION uint256_add(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_sub(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_mul(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_div(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_mod(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_lt(uint256, uint256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_gt(uint256, uint256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_lteq(uint256, uint256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_gteq(uint256, uint256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_eq(uint256, uint256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_neq(uint256, uint256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_uplus(uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_uminus(uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_abs(uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_bitand(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_bitor(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_bitxor(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_bitnot(uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_bitshiftleft(uint256, integer)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_bitshiftright(uint256, integer)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region hex160 operator functions

CREATE FUNCTION hex160_lt(hex160, hex160)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_gt(hex160, hex160)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_lteq(hex160, hex160)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_gteq(hex160, hex160)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_eq(hex160, hex160)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_neq(hex160, hex160)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_bitand(hex160, hex160)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_bitor(hex160, hex160)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_bitxor(hex160, hex160)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_bitnot(hex160)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_bitshiftleft(hex160, integer)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_bitshiftright(hex160, integer)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region hex256 operator functions

CREATE FUNCTION hex256_lt(hex256, hex256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_gt(hex256, hex256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_lteq(hex256, hex256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_gteq(hex256, hex256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_eq(hex256, hex256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_neq(hex256, hex256)
RETURNS boolean
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_bitand(hex256, hex256)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_bitor(hex256, hex256)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_bitxor(hex256, hex256)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_bitnot(hex256)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_bitshiftleft(hex256, integer)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_bitshiftright(hex256, integer)
RETURNS hex256
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

-- #region int256 aggregate functions

CREATE FUNCTION int256_min(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_max(int256, int256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_avg_accum(internal, int256)
RETURNS internal
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

CREATE FUNCTION int256_avg_combine(internal, internal)
RETURNS internal
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

CREATE FUNCTION int256_avg_final(internal)
RETURNS numeric
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

-- #endregion

-- #region uint256 aggregate functions

CREATE FUNCTION uint256_min(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_max(uint256, uint256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_avg_accum(internal, uint256)
RETURNS internal
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

CREATE FUNCTION uint256_avg_combine(internal, internal)
RETURNS internal
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE;

CREATE FUNCTION uint256_avg_final(internal)
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

CREATE FUNCTION int128_as_int256(int128)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_as_uint256(int128)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_as_hex160(int128)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int128_as_hex256(int128)
RETURNS hex256
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

CREATE FUNCTION uint128_as_int256(uint128)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_as_uint256(uint128)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_as_hex160(uint128)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint128_as_hex256(uint128)
RETURNS hex256
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

-- #region int256 cast functions

CREATE FUNCTION int256_as_int2(int256)
RETURNS smallint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_as_int4(int256)
RETURNS integer
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_as_int8(int256)
RETURNS bigint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_as_int128(int256)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_as_uint128(int256)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_as_uint256(int256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_as_hex160(int256)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int256_as_hex256(int256)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int2_as_int256(smallint)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int4_as_int256(integer)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int8_as_int256(bigint)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region uint256 cast functions

CREATE FUNCTION uint256_as_int2(uint256)
RETURNS smallint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_as_int4(uint256)
RETURNS integer
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_as_int8(uint256)
RETURNS bigint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_as_int128(uint256)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_as_uint128(uint256)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_as_int256(uint256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_as_hex160(uint256)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION uint256_as_hex256(uint256)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int2_as_uint256(smallint)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int4_as_uint256(integer)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int8_as_uint256(bigint)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region hex160 cast functions

CREATE FUNCTION hex160_as_int2(hex160)
RETURNS smallint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_as_int4(hex160)
RETURNS integer
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_as_int8(hex160)
RETURNS bigint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_as_int128(hex160)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_as_uint128(hex160)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_as_int256(hex160)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_as_uint256(hex160)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex160_as_hex256(hex160)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int2_as_hex160(smallint)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int4_as_hex160(integer)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int8_as_hex160(bigint)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

-- #endregion

-- #region hex256 cast functions

CREATE FUNCTION hex256_as_int2(hex256)
RETURNS smallint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_as_int4(hex256)
RETURNS integer
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_as_int8(hex256)
RETURNS bigint
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_as_int128(hex256)
RETURNS int128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_as_uint128(hex256)
RETURNS uint128
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_as_int256(hex256)
RETURNS int256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_as_uint256(hex256)
RETURNS uint256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION hex256_as_hex160(hex256)
RETURNS hex160
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int2_as_hex256(smallint)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int4_as_hex256(integer)
RETURNS hex256
AS '$libdir/postgres_web3'
LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION int8_as_hex256(bigint)
RETURNS hex256
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

-- #region int256

CREATE TYPE int256(
    INPUT = int256_in,
    OUTPUT = int256_out,
    SEND = int256_send,
    RECEIVE = int256_recv,
    INTERNALLENGTH = 32,
    STORAGE = PLAIN
);

-- #endregion

-- #region uint256

CREATE TYPE uint256(
    INPUT = uint256_in,
    OUTPUT = uint256_out,
    SEND = uint256_send,
    RECEIVE = uint256_recv,
    INTERNALLENGTH = 32,
    STORAGE = PLAIN
);

-- #endregion

-- #region hex160

CREATE TYPE hex160(
    INPUT = hex160_in,
    OUTPUT = hex160_out,
    SEND = hex160_send,
    RECEIVE = hex160_recv,
    INTERNALLENGTH = 24,
    STORAGE = PLAIN
);

-- #endregion

-- #region hex256

CREATE TYPE hex256(
    INPUT = hex256_in,
    OUTPUT = hex256_out,
    SEND = hex256_send,
    RECEIVE = hex256_recv,
    INTERNALLENGTH = 32,
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

-- #region int256 operators

CREATE OPERATOR +(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_add,
    COMMUTATOR = +
);

CREATE OPERATOR -(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_sub
);

CREATE OPERATOR *(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_mul,
    COMMUTATOR = *
);

CREATE OPERATOR /(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_div
);

CREATE OPERATOR %(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_mod
);

CREATE OPERATOR <(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_lt,
    NEGATOR = >=
);

CREATE OPERATOR >(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_gt,
    NEGATOR = <=
);

CREATE OPERATOR <=(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_lteq,
    NEGATOR = >
);

CREATE OPERATOR >=(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_gteq,
    NEGATOR = <
);

CREATE OPERATOR =(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_eq,
    COMMUTATOR = =,
    NEGATOR = <>
);

CREATE OPERATOR <>(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_neq,
    COMMUTATOR = <>,
    NEGATOR = =
);

CREATE OPERATOR +(
    RIGHTARG = int256,
    FUNCTION = int256_uplus
);

CREATE OPERATOR -(
    RIGHTARG = int256,
    FUNCTION = int256_uminus
);

CREATE OPERATOR @(
    RIGHTARG = int256,
    FUNCTION = int256_abs
);

CREATE OPERATOR &(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_bitand,
    COMMUTATOR = &
);

CREATE OPERATOR |(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_bitor,
    COMMUTATOR = |
);

CREATE OPERATOR #(
    LEFTARG = int256,
    RIGHTARG = int256,
    FUNCTION = int256_bitxor,
    COMMUTATOR = #
);

CREATE OPERATOR ~(
    RIGHTARG = int256,
    FUNCTION = int256_bitnot
);

CREATE OPERATOR <<(
    LEFTARG = int256,
    RIGHTARG = integer,
    FUNCTION = int256_bitshiftleft
);

CREATE OPERATOR >>(
    LEFTARG = int256,
    RIGHTARG = integer,
    FUNCTION = int256_bitshiftright
);

-- #endregion

-- #region uint256 operators

CREATE OPERATOR +(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_add,
    COMMUTATOR = +
);

CREATE OPERATOR -(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_sub
);

CREATE OPERATOR *(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_mul,
    COMMUTATOR = *
);

CREATE OPERATOR /(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_div
);

CREATE OPERATOR %(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_mod
);

CREATE OPERATOR <(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_lt,
    NEGATOR = >=
);

CREATE OPERATOR >(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_gt,
    NEGATOR = <=
);

CREATE OPERATOR <=(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_lteq,
    NEGATOR = >
);

CREATE OPERATOR >=(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_gteq,
    NEGATOR = <
);

CREATE OPERATOR =(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_eq,
    COMMUTATOR = =,
    NEGATOR = <>
);

CREATE OPERATOR <>(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_neq,
    COMMUTATOR = <>,
    NEGATOR = =
);

CREATE OPERATOR +(
    RIGHTARG = uint256,
    FUNCTION = uint256_uplus
);

CREATE OPERATOR -(
    RIGHTARG = uint256,
    FUNCTION = uint256_uminus
);

CREATE OPERATOR @(
    RIGHTARG = uint256,
    FUNCTION = uint256_abs
);

CREATE OPERATOR &(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_bitand,
    COMMUTATOR = &
);

CREATE OPERATOR |(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_bitor,
    COMMUTATOR = |
);

CREATE OPERATOR #(
    LEFTARG = uint256,
    RIGHTARG = uint256,
    FUNCTION = uint256_bitxor,
    COMMUTATOR = #
);

CREATE OPERATOR ~(
    RIGHTARG = uint256,
    FUNCTION = uint256_bitnot
);

CREATE OPERATOR <<(
    LEFTARG = uint256,
    RIGHTARG = integer,
    FUNCTION = uint256_bitshiftleft
);

CREATE OPERATOR >>(
    LEFTARG = uint256,
    RIGHTARG = integer,
    FUNCTION = uint256_bitshiftright
);

-- #endregion

-- #region hex160 operators

CREATE OPERATOR <(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_lt,
    NEGATOR = >=
);

CREATE OPERATOR >(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_gt,
    NEGATOR = <=
);

CREATE OPERATOR <=(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_lteq,
    NEGATOR = >
);

CREATE OPERATOR >=(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_gteq,
    NEGATOR = <
);

CREATE OPERATOR =(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_eq,
    COMMUTATOR = =,
    NEGATOR = <>
);

CREATE OPERATOR <>(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_neq,
    COMMUTATOR = <>,
    NEGATOR = =
);

CREATE OPERATOR &(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_bitand,
    COMMUTATOR = &
);

CREATE OPERATOR |(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_bitor,
    COMMUTATOR = |
);

CREATE OPERATOR #(
    LEFTARG = hex160,
    RIGHTARG = hex160,
    FUNCTION = hex160_bitxor,
    COMMUTATOR = #
);

CREATE OPERATOR ~(
    RIGHTARG = hex160,
    FUNCTION = hex160_bitnot
);

CREATE OPERATOR <<(
    LEFTARG = hex160,
    RIGHTARG = integer,
    FUNCTION = hex160_bitshiftleft
);

CREATE OPERATOR >>(
    LEFTARG = hex160,
    RIGHTARG = integer,
    FUNCTION = hex160_bitshiftright
);

-- #endregion

-- #region hex256 operators

CREATE OPERATOR <(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_lt,
    NEGATOR = >=
);

CREATE OPERATOR >(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_gt,
    NEGATOR = <=
);

CREATE OPERATOR <=(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_lteq,
    NEGATOR = >
);

CREATE OPERATOR >=(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_gteq,
    NEGATOR = <
);

CREATE OPERATOR =(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_eq,
    COMMUTATOR = =,
    NEGATOR = <>
);

CREATE OPERATOR <>(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_neq,
    COMMUTATOR = <>,
    NEGATOR = =
);

CREATE OPERATOR &(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_bitand,
    COMMUTATOR = &
);

CREATE OPERATOR |(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_bitor,
    COMMUTATOR = |
);

CREATE OPERATOR #(
    LEFTARG = hex256,
    RIGHTARG = hex256,
    FUNCTION = hex256_bitxor,
    COMMUTATOR = #
);

CREATE OPERATOR ~(
    RIGHTARG = hex256,
    FUNCTION = hex256_bitnot
);

CREATE OPERATOR <<(
    LEFTARG = hex256,
    RIGHTARG = integer,
    FUNCTION = hex256_bitshiftleft
);

CREATE OPERATOR >>(
    LEFTARG = hex256,
    RIGHTARG = integer,
    FUNCTION = hex256_bitshiftright
);

-- #endregion

-- #region int128 casts

CREATE CAST (int128 as smallint) WITH FUNCTION int128_as_int2 AS ASSIGNMENT;
CREATE CAST (int128 as integer) WITH FUNCTION int128_as_int4 AS ASSIGNMENT;
CREATE CAST (int128 as bigint) WITH FUNCTION int128_as_int8 AS ASSIGNMENT;
CREATE CAST (int128 as uint128) WITH FUNCTION int128_as_uint128 AS ASSIGNMENT;
CREATE CAST (int128 as int256) WITH FUNCTION int128_as_int256 AS IMPLICIT;
CREATE CAST (int128 as uint256) WITH FUNCTION int128_as_uint256 AS ASSIGNMENT;
CREATE CAST (int128 as hex160) WITH FUNCTION int128_as_hex160;
CREATE CAST (int128 as hex256) WITH FUNCTION int128_as_hex256;

CREATE CAST (smallint as int128) WITH FUNCTION int2_as_int128 AS IMPLICIT;
CREATE CAST (integer as int128) WITH FUNCTION int4_as_int128 AS IMPLICIT;
CREATE CAST (bigint as int128) WITH FUNCTION int8_as_int128 AS IMPLICIT;

-- #endregion

-- #region uint128 casts

CREATE CAST (uint128 as smallint) WITH FUNCTION uint128_as_int2 AS ASSIGNMENT;
CREATE CAST (uint128 as integer) WITH FUNCTION uint128_as_int4 AS ASSIGNMENT;
CREATE CAST (uint128 as bigint) WITH FUNCTION uint128_as_int8 AS ASSIGNMENT;
CREATE CAST (uint128 as int128) WITH FUNCTION uint128_as_int128 AS ASSIGNMENT;
CREATE CAST (uint128 as int256) WITH FUNCTION uint128_as_int256 AS ASSIGNMENT;
CREATE CAST (uint128 as uint256) WITH FUNCTION uint128_as_uint256 AS IMPLICIT;
CREATE CAST (uint128 as hex160) WITH FUNCTION uint128_as_hex160;
CREATE CAST (uint128 as hex256) WITH FUNCTION uint128_as_hex256;

CREATE CAST (smallint as uint128) WITH FUNCTION int2_as_uint128 AS ASSIGNMENT;
CREATE CAST (integer as uint128) WITH FUNCTION int4_as_uint128 AS ASSIGNMENT;
CREATE CAST (bigint as uint128) WITH FUNCTION int8_as_uint128 AS ASSIGNMENT;

-- #endregion

-- #region int256 casts

CREATE CAST (int256 as smallint) WITH FUNCTION int256_as_int2 AS ASSIGNMENT;
CREATE CAST (int256 as integer) WITH FUNCTION int256_as_int4 AS ASSIGNMENT;
CREATE CAST (int256 as bigint) WITH FUNCTION int256_as_int8 AS ASSIGNMENT;
CREATE CAST (int256 as int128) WITH FUNCTION int256_as_int128 AS ASSIGNMENT;
CREATE CAST (int256 as uint128) WITH FUNCTION int256_as_uint128 AS ASSIGNMENT;
CREATE CAST (int256 as uint256) WITH FUNCTION int256_as_uint256 AS ASSIGNMENT;
CREATE CAST (int256 as hex160) WITH FUNCTION int256_as_hex160;
CREATE CAST (int256 as hex256) WITH FUNCTION int256_as_hex256;

CREATE CAST (smallint as int256) WITH FUNCTION int2_as_int256 AS IMPLICIT;
CREATE CAST (integer as int256) WITH FUNCTION int4_as_int256 AS IMPLICIT;
CREATE CAST (bigint as int256) WITH FUNCTION int8_as_int256 AS IMPLICIT;

-- #endregion

-- #region uint256 casts

CREATE CAST (uint256 as smallint) WITH FUNCTION uint256_as_int2 AS ASSIGNMENT;
CREATE CAST (uint256 as integer) WITH FUNCTION uint256_as_int4 AS ASSIGNMENT;
CREATE CAST (uint256 as bigint) WITH FUNCTION uint256_as_int8 AS ASSIGNMENT;
CREATE CAST (uint256 as int128) WITH FUNCTION uint256_as_int128 AS ASSIGNMENT;
CREATE CAST (uint256 as uint128) WITH FUNCTION uint256_as_uint128 AS ASSIGNMENT;
CREATE CAST (uint256 as int256) WITH FUNCTION uint256_as_int256 AS ASSIGNMENT;
CREATE CAST (uint256 as hex160) WITH FUNCTION uint256_as_hex160;
CREATE CAST (uint256 as hex256) WITH FUNCTION uint256_as_hex256;

CREATE CAST (smallint as uint256) WITH FUNCTION int2_as_uint256 AS ASSIGNMENT;
CREATE CAST (integer as uint256) WITH FUNCTION int4_as_uint256 AS ASSIGNMENT;
CREATE CAST (bigint as uint256) WITH FUNCTION int8_as_uint256 AS ASSIGNMENT;

-- #endregion

-- #region hex160 casts

CREATE CAST (hex160 as smallint) WITH FUNCTION hex160_as_int2;
CREATE CAST (hex160 as integer) WITH FUNCTION hex160_as_int4;
CREATE CAST (hex160 as bigint) WITH FUNCTION hex160_as_int8;
CREATE CAST (hex160 as int128) WITH FUNCTION hex160_as_int128;
CREATE CAST (hex160 as uint128) WITH FUNCTION hex160_as_uint128;
CREATE CAST (hex160 as int256) WITH FUNCTION hex160_as_int256;
CREATE CAST (hex160 as uint256) WITH FUNCTION hex160_as_uint256;
CREATE CAST (hex160 as hex256) WITH FUNCTION hex160_as_hex256 AS IMPLICIT;

CREATE CAST (smallint as hex160) WITH FUNCTION int2_as_hex160;
CREATE CAST (integer as hex160) WITH FUNCTION int4_as_hex160;
CREATE CAST (bigint as hex160) WITH FUNCTION int8_as_hex160;

-- #endregion

-- #region hex256 casts

CREATE CAST (hex256 as smallint) WITH FUNCTION hex256_as_int2;
CREATE CAST (hex256 as integer) WITH FUNCTION hex256_as_int4;
CREATE CAST (hex256 as bigint) WITH FUNCTION hex256_as_int8;
CREATE CAST (hex256 as int128) WITH FUNCTION hex256_as_int128;
CREATE CAST (hex256 as uint128) WITH FUNCTION hex256_as_uint128;
CREATE CAST (hex256 as int256) WITH FUNCTION hex256_as_int256;
CREATE CAST (hex256 as uint256) WITH FUNCTION hex256_as_uint256;
CREATE CAST (hex256 as hex160) WITH FUNCTION hex256_as_hex160 AS ASSIGNMENT;

CREATE CAST (smallint as hex256) WITH FUNCTION int2_as_hex256;
CREATE CAST (integer as hex256) WITH FUNCTION int4_as_hex256;
CREATE CAST (bigint as hex256) WITH FUNCTION int8_as_hex256;

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
    COMBINEFUNC = uint128_avg_combine,
    FINALFUNC = uint128_avg_final
);

-- #endregion

-- #region int256 aggregates

CREATE AGGREGATE sum(int256) (
    SFUNC = int256_add,
    STYPE = int256,
    COMBINEFUNC = int256_add,
    initcond = '0'
);

CREATE AGGREGATE min(int256) (
    SFUNC = int256_min,
    STYPE = int256,
    SORTOP = <,
    COMBINEFUNC = int256_min
);

CREATE AGGREGATE max(int256) (
    SFUNC = int256_max,
    STYPE = int256,
    SORTOP = >,
    COMBINEFUNC = int256_max
);

CREATE AGGREGATE avg(int256) (
    SFUNC = int256_avg_accum,
    STYPE = internal,
    COMBINEFUNC = int256_avg_combine,
    FINALFUNC = int256_avg_final
);

-- #endregion

-- #region uint256 aggregates

CREATE AGGREGATE sum(uint256) (
    SFUNC = uint256_add,
    STYPE = uint256,
    COMBINEFUNC = uint256_add,
    initcond = '0'
);

CREATE AGGREGATE min(uint256) (
    SFUNC = uint256_min,
    STYPE = uint256,
    SORTOP = <,
    COMBINEFUNC = uint256_min
);

CREATE AGGREGATE max(uint256) (
    SFUNC = uint256_max,
    STYPE = uint256,
    SORTOP = >,
    COMBINEFUNC = uint256_max
);

CREATE AGGREGATE avg(uint256) (
    SFUNC = uint256_avg_accum,
    STYPE = internal,
    COMBINEFUNC = uint256_avg_combine,
    FINALFUNC = uint256_avg_final
);

-- #endregion
