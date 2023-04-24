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

// pw3_int256

pw3_int256 *pw3_int256_palloc(pw3_int256 value)
{
    pw3_int256 *ptr = palloc_object(pw3_int256);
    *ptr = value;
    return ptr;
}

bool pw3_int256_add_overflow(pw3_int256 a, pw3_int256 b, pw3_int256 *res)
{
    if (b > 0 && a > PW3_INT256_MAX - b)
    {
        return true;
    }
    if (b < 0 && a < PW3_INT256_MIN - b)
    {
        return true;
    }
    *res = a + b;
    return false;
}

bool pw3_int256_sub_overflow(pw3_int256 a, pw3_int256 b, pw3_int256 *res)
{
    if (b < 0 && a > PW3_INT256_MAX + b)
    {
        return true;
    }
    if (b > 0 && a < PW3_INT256_MIN + b)
    {
        return true;
    }
    *res = a - b;
    return false;
}

bool pw3_int256_mul_overflow(pw3_int256 a, pw3_int256 b, pw3_int256 *res)
{
    if (b == -1 && a == PW3_INT256_MIN)
    {
        return true;
    }
    if (a == -1 && b == PW3_INT256_MIN)
    {
        return true;
    }
    if (b != 0 && a > PW3_INT256_MAX / b)
    {
        return true;
    }
    if (b != 0 && a < PW3_INT256_MIN / b)
    {
        return true;
    }
    *res = a * b;
    return false;
}

// pw3_uint256

pw3_uint256 *pw3_uint256_palloc(pw3_uint256 value)
{
    pw3_uint256 *ptr = palloc_object(pw3_uint256);
    *ptr = value;
    return ptr;
}
