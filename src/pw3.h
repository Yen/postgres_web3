#ifndef PW3_H
#define PW3_H

#include "postgres.h"
#include "fmgr.h"

#include <assert.h>

void *pw3_agg_context_palloc0(FunctionCallInfo fcinfo, size_t size);
#define pw3_agg_context_palloc0_object(fcinfo, type) (type *)pw3_agg_context_palloc0(fcinfo, sizeof(type))

// pw3_int128

typedef _BitInt(128) pw3_int128;
#define PW3_INT128_PACKED_SIZE 16
#define PW3_INT128_ALLOC_SIZE 16
static_assert(sizeof(pw3_int128) <= PW3_INT128_ALLOC_SIZE, "sizeof pw3_int128 greater than alloc size");

pw3_int128 *pw3_int128_palloc(pw3_int128 value);

#define PW3_INT128_MAX ((pw3_int128)170141183460469231731687303715884105727wb)
#define PW3_INT128_MIN ((pw3_int128)-170141183460469231731687303715884105728wb)

#define PW3_GETARG_INT128_P(n) ((pw3_int128 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_INT128_P(x) return ((Datum)(x))

#define PW3_INT128_STRLEN_MAX 40 /* -170141183460469231731687303715884105728 */

// pw3_uint128

typedef unsigned _BitInt(128) pw3_uint128;
#define PW3_UINT128_PACKED_SIZE 16
#define PW3_UINT128_ALLOC_SIZE 16
static_assert(sizeof(pw3_uint128) <= PW3_UINT128_ALLOC_SIZE, "sizeof pw3_uint128 greater than alloc size");

pw3_uint128 *pw3_uint128_palloc(pw3_uint128 value);

#define PW3_UINT128_MAX ((pw3_uint128)340282366920938463463374607431768211455uwb)
#define PW3_UINT128_MIN ((pw3_uint128)0uwb)

#define PW3_GETARG_UINT128_P(n) ((pw3_uint128 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_UINT128_P(x) return ((Datum)(x))

#define PW3_UINT128_STRLEN_MAX 39 /* 340282366920938463463374607431768211455 */

// pw3_int256

typedef _BitInt(256) pw3_int256;
#define PW3_INT256_PACKED_SIZE 32
#define PW3_INT256_ALLOC_SIZE 32
static_assert(sizeof(pw3_int256) <= PW3_INT256_ALLOC_SIZE, "sizeof pw3_int256 greater than alloc size");

pw3_int256 *pw3_int256_palloc(pw3_int256 value);

#define PW3_INT256_MAX ((pw3_int256)57896044618658097711785492504343953926634992332820282019728792003956564819967wb)
#define PW3_INT256_MIN ((pw3_int256)-57896044618658097711785492504343953926634992332820282019728792003956564819968wb)

#define PW3_GETARG_INT256_P(n) ((pw3_int256 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_INT256_P(x) return ((Datum)(x))

#define PW3_INT256_STRLEN_MAX 78 /* -57896044618658097711785492504343953926634992332820282019728792003956564819968 */

// TODO: our target compiler (clang-16) currently doesnt support __builtin_[add sub mul]_overflow functions for signed _BitInt(>128)
bool pw3_int256_add_overflow(pw3_int256 a, pw3_int256 b, pw3_int256 *res);
bool pw3_int256_sub_overflow(pw3_int256 a, pw3_int256 b, pw3_int256 *res);
bool pw3_int256_mul_overflow(pw3_int256 a, pw3_int256 b, pw3_int256 *res);

// pw3_uint256

typedef unsigned _BitInt(256) pw3_uint256;
#define PW3_UINT256_PACKED_SIZE 32
#define PW3_UINT256_ALLOC_SIZE 32
static_assert(sizeof(pw3_uint256) <= PW3_UINT256_ALLOC_SIZE, "sizeof pw3_uint256 greater than alloc size");

pw3_uint256 *pw3_uint256_palloc(pw3_uint256 value);

#define PW3_UINT256_MAX ((pw3_uint256)115792089237316195423570985008687907853269984665640564039457584007913129639935uwb)
#define PW3_UINT256_MIN ((pw3_uint256)0uwb)

#define PW3_GETARG_UINT256_P(n) ((pw3_uint256 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_UINT256_P(x) return ((Datum)(x))

#define PW3_UINT256_STRLEN_MAX 79 /* 115792089237316195423570985008687907853269984665640564039457584007913129639935 */

// pw3_hex160

typedef unsigned _BitInt(160) pw3_hex160;
#define PW3_HEX160_PACKED_SIZE 20
// as of time of writing, clang16 pads the _BitInt(160) from 20 bytes to 24.
// as far as the current spec goes, this is compiler specific behaviour and
// something we can revisit in the future if there is a way to do this dynamically
// if the compiler does/doesnt pad or we have a fix to take away the padding
// in memory. Right now, we dont try and work around it and waste the space as there
// is a worry we cannot maintain backwards compatibility with extension versions if
// we need to change the INTERNALLENGTH on the postgres CREATE TYPE statement.
#define PW3_HEX160_ALLOC_SIZE 24
static_assert(sizeof(pw3_hex160) <= PW3_HEX160_ALLOC_SIZE, "sizeof pw3_hex160 greater than alloc size");

pw3_hex160 *pw3_hex160_palloc(pw3_hex160 value);

#define PW3_HEX160_MAX ((pw3_hex160)0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFuwb)
#define PW3_HEX160_MIN ((pw3_hex160)0uwb)

#define PW3_GETARG_HEX160_P(n) ((pw3_hex160 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_HEX160_P(x) return ((Datum)(x))

#define PW3_HEX160_STRLEN_MAX 40 /* ffffffffffffffffffffffffffffffffffffffff */

// pw3_hex160

typedef unsigned _BitInt(256) pw3_hex256;
#define PW3_HEX256_PACKED_SIZE 32
#define PW3_HEX256_ALLOC_SIZE 32
static_assert(sizeof(pw3_hex256) <= PW3_HEX256_ALLOC_SIZE, "sizeof pw3_hex256 greater than alloc size");

pw3_hex256 *pw3_hex256_palloc(pw3_hex256 value);

#define PW3_HEX256_MAX ((pw3_hex256)0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFuwb)
#define PW3_HEX256_MIN ((pw3_hex256)0uwb)

#define PW3_GETARG_HEX256_P(n) ((pw3_hex256 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_HEX256_P(x) return ((Datum)(x))

#define PW3_HEX256_STRLEN_MAX 64 /* ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff */

#endif /* PW3_H */
