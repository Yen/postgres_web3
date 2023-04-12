#ifndef PW3_H
#define PW3_H

#include "postgres.h"
#include "fmgr.h"

typedef _BitInt(128) pw3_int128;

static pw3_int128 *pw3_int128_palloc(pw3_int128 value)
{
    pw3_int128 *ptr = palloc(sizeof(pw3_int128));
    *ptr = value;
    return ptr;
}

#define PW3_INT128_MAX (((pw3_int128)INT64_MAX << 64) | (pw3_int128)UINT64_MAX)
#define PW3_INT128_MIN (-(PW3_INT128_MAX - 1))

#define PW3_GETARG_INT128_P(n) ((pw3_int128 *)PG_GETARG_DATUM(n))
#define PW3_RETURN_INT128_P(x) return ((Datum)(x))

#endif /* PW3_H */