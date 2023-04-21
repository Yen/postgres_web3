#include "pw3.h"

PG_MODULE_MAGIC;

void pw3_bswap(void *buf, size_t count)
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

void *pw3_agg_context_palloc0(FunctionCallInfo fcinfo, size_t size)
{
    MemoryContext agg_context;
    if (!AggCheckCallContext(fcinfo, &agg_context))
        elog(ERROR, "pw3_agg_context_palloc0 called in non-aggregate context");
    MemoryContext old_context = MemoryContextSwitchTo(agg_context);
    void *result = palloc0(size);
    MemoryContextSwitchTo(old_context);
    return result;
}

// pw3_int128

pw3_int128 *pw3_int128_palloc(pw3_int128 value)
{
    pw3_int128 *ptr = palloc_object(pw3_int128);
    *ptr = value;
    return ptr;
}

// pw3_uint128

pw3_uint128 *pw3_uint128_palloc(pw3_uint128 value)
{
    pw3_uint128 *ptr = palloc_object(pw3_uint128);
    *ptr = value;
    return ptr;
}