#ifndef PW3_H
#define PW3_H

#include "postgres.h"
#include "fmgr.h"

void pw3_bswap(void *buf, size_t count);

void *pw3_agg_context_palloc0(FunctionCallInfo fcinfo, size_t size);
#define pw3_agg_context_palloc0_object(fcinfo, type) (type *)pw3_agg_context_palloc0(fcinfo, sizeof(type))

typedef _BitInt(128) pw3_int128;
// static_assert(sizeof(pw3_int128) == 16);

pw3_int128 *pw3_int128_palloc(pw3_int128 value);

#define PW3_INT128_MAX (((pw3_int128)INT64_MAX << 64) | (pw3_int128)UINT64_MAX)
#define PW3_INT128_MIN (-(PW3_INT128_MAX - 1))

#define PW3_GETARG_INT128_P(n) ((pw3_int128 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_INT128_P(x) return ((Datum)(x))

#endif /* PW3_H */