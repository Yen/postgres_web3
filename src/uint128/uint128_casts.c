#include "../pw3.h"

PG_FUNCTION_INFO_V1(uint128_as_int2);
Datum uint128_as_int2(PG_FUNCTION_ARGS)
{
    pw3_uint128 *value = PW3_GETARG_UINT128_P(0);
    if (*value > PG_INT16_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("smallint out of range")));
    }
    PG_RETURN_INT16((int16)*value);
}

PG_FUNCTION_INFO_V1(uint128_as_int4);
Datum uint128_as_int4(PG_FUNCTION_ARGS)
{
    pw3_uint128 *value = PW3_GETARG_UINT128_P(0);
    if (*value > PG_INT32_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("integer out of range")));
    }
    PG_RETURN_INT32((int32)*value);
}

PG_FUNCTION_INFO_V1(uint128_as_int8);
Datum uint128_as_int8(PG_FUNCTION_ARGS)
{
    pw3_uint128 *value = PW3_GETARG_UINT128_P(0);
    if (*value > PG_INT64_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("bigint out of range")));
    }
    PG_RETURN_INT64((int64)*value);
}

PG_FUNCTION_INFO_V1(uint128_as_int128);
Datum uint128_as_int128(PG_FUNCTION_ARGS)
{
    pw3_uint128 *value = PW3_GETARG_UINT128_P(0);
    if (*value > PW3_INT128_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int128 out of range")));
    }
    PW3_RETURN_INT128_P(pw3_int128_palloc(*value));
}

PG_FUNCTION_INFO_V1(int2_as_uint128);
Datum int2_as_uint128(PG_FUNCTION_ARGS)
{
    int16 value = PG_GETARG_INT16(0);
    if (value < 0)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint128 out of range")));
    }
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(value));
}

PG_FUNCTION_INFO_V1(int4_as_uint128);
Datum int4_as_uint128(PG_FUNCTION_ARGS)
{
    int32 value = PG_GETARG_INT32(0);
    if (value < 0)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint128 out of range")));
    }
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(value));
}

PG_FUNCTION_INFO_V1(int8_as_uint128);
Datum int8_as_uint128(PG_FUNCTION_ARGS)
{
    int64 value = PG_GETARG_INT64(0);
    if (value < 0)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint128 out of range")));
    }
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(value));
}