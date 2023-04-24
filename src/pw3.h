#ifndef PW3_H
#define PW3_H

#include "postgres.h"
#include "fmgr.h"

#include <assert.h>

void pw3_bswap(void *buf, size_t count);

void *pw3_agg_context_palloc0(FunctionCallInfo fcinfo, size_t size);
#define pw3_agg_context_palloc0_object(fcinfo, type) (type *)pw3_agg_context_palloc0(fcinfo, sizeof(type))

// pw3_int128

typedef _BitInt(128) pw3_int128;
static_assert(sizeof(pw3_int128) == 16, "expected pw3_int128 to be 16 bytes");

pw3_int128 *pw3_int128_palloc(pw3_int128 value);

#define PW3_INT128_MAX ((pw3_int128)170141183460469231731687303715884105727wb)
#define PW3_INT128_MIN ((pw3_int128)-170141183460469231731687303715884105728wb)

#define PW3_GETARG_INT128_P(n) ((pw3_int128 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_INT128_P(x) return ((Datum)(x))

#define PW3_INT128_STRLEN_MAX 40 /* -170141183460469231731687303715884105728 */

// pw3_uint128

typedef unsigned _BitInt(128) pw3_uint128;
static_assert(sizeof(pw3_uint128) == 16, "expected pw3_uint128 to be 16 bytes");

pw3_uint128 *pw3_uint128_palloc(pw3_uint128 value);

#define PW3_UINT128_MAX ((pw3_uint128)340282366920938463463374607431768211455uwb)
#define PW3_UINT128_MIN ((pw3_uint128)0uwb)

#define PW3_GETARG_UINT128_P(n) ((pw3_uint128 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_UINT128_P(x) return ((Datum)(x))

#define PW3_UINT128_STRLEN_MAX 39 /* 340282366920938463463374607431768211455 */

#endif /* PW3_H */