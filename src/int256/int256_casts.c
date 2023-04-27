#include "../pw3.h"

PG_FUNCTION_INFO_V1(int256_as_int2);
Datum int256_as_int2(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < (pw3_int256)PG_INT16_MIN || *value > (pw3_int256)PG_INT16_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("smallint out of range")));
    }
    PG_RETURN_INT16((int16)*value);
}

PG_FUNCTION_INFO_V1(int256_as_int4);
Datum int256_as_int4(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < (pw3_int256)PG_INT32_MIN || *value > (pw3_int256)PG_INT32_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("integer out of range")));
    }
    PG_RETURN_INT32((int32)*value);
}

PG_FUNCTION_INFO_V1(int256_as_int8);
Datum int256_as_int8(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < (pw3_int256)PG_INT64_MIN || *value > (pw3_int256)PG_INT64_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("bigint out of range")));
    }
    PG_RETURN_INT64((int64)*value);
}

PG_FUNCTION_INFO_V1(int256_as_int128);
Datum int256_as_int128(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < (pw3_int256)PW3_INT128_MIN || *value > (pw3_int256)PW3_INT128_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int128 out of range")));
    }
    PW3_RETURN_INT128_P(pw3_int128_palloc(*value));
}

PG_FUNCTION_INFO_V1(int256_as_uint128);
Datum int256_as_uint128(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < 0)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint128 out of range")));
    }
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(*value));
}

PG_FUNCTION_INFO_V1(int256_as_uint256);
Datum int256_as_uint256(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < 0)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint256 out of range")));
    }
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(*value));
}

PG_FUNCTION_INFO_V1(int256_as_hex160);
Datum int256_as_hex160(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < 0 || *value > (pw3_int256)PW3_HEX160_MAX)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("hex160 out of range")));
    }
    PW3_RETURN_HEX160_P(pw3_hex160_palloc(*value));
}

PG_FUNCTION_INFO_V1(int256_as_hex256);
Datum int256_as_hex256(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < 0)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("hex256 out of range")));
    }
    PW3_RETURN_HEX256_P(pw3_hex256_palloc(*value));
}

PG_FUNCTION_INFO_V1(int2_as_int256);
Datum int2_as_int256(PG_FUNCTION_ARGS)
{
    int16 value = PG_GETARG_INT16(0);
    PW3_RETURN_INT256_P(pw3_int256_palloc(value));
}

PG_FUNCTION_INFO_V1(int4_as_int256);
Datum int4_as_int256(PG_FUNCTION_ARGS)
{
    int32 value = PG_GETARG_INT32(0);
    PW3_RETURN_INT256_P(pw3_int256_palloc(value));
}

PG_FUNCTION_INFO_V1(int8_as_int256);
Datum int8_as_int256(PG_FUNCTION_ARGS)
{
    int64 value = PG_GETARG_INT64(0);
    PW3_RETURN_INT256_P(pw3_int256_palloc(value));
}