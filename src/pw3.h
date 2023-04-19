#ifndef PW3_H
#define PW3_H

#include "postgres.h"
#include "fmgr.h"

pg_attribute_always_inline static void pw3_bswap(void *buf, size_t count)
{
#ifdef WORDS_BIGENDIAN
    return;
#endif
    uint8 *array = (uint8 *)buf;
    for (size_t i = 0; i < count / 2; i++)
    {
        size_t j = count - i - 1;
        uint8 temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

typedef _BitInt(128) pw3_int128;
// static_assert(sizeof(pw3_int128) == 16);

pg_attribute_always_inline static pw3_int128 *pw3_int128_palloc(pw3_int128 value)
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