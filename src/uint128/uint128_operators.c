#include "../pw3.h"

PG_FUNCTION_INFO_V1(uint128_add);
Datum uint128_add(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);

    pw3_uint128 result;
    if (__builtin_add_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint128 out of range")));
    }
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(result));
}

PG_FUNCTION_INFO_V1(uint128_sub);
Datum uint128_sub(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);

    pw3_uint128 result;
    if (__builtin_sub_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint128 out of range")));
    }
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(result));
}

PG_FUNCTION_INFO_V1(uint128_mul);
Datum uint128_mul(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);

    pw3_uint128 result;
    if (__builtin_mul_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint128 out of range")));
    }
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(result));
}

PG_FUNCTION_INFO_V1(uint128_div);
Datum uint128_div(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);

    pw3_uint128 result;
    if (*right == 0)
    {
        ereport(ERROR, (errcode(ERRCODE_DIVISION_BY_ZERO), errmsg("division by zero")));
    }

    result = *left / *right;
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(result));
}

PG_FUNCTION_INFO_V1(uint128_mod);
Datum uint128_mod(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);

    pw3_uint128 result;
    if (*right == 0)
    {
        ereport(ERROR, (errcode(ERRCODE_DIVISION_BY_ZERO), errmsg("division by zero")));
    }

    result = *left % *right;
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(result));
}

PG_FUNCTION_INFO_V1(uint128_lt);
Datum uint128_lt(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PG_RETURN_BOOL(*left < *right);
}

PG_FUNCTION_INFO_V1(uint128_gt);
Datum uint128_gt(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PG_RETURN_BOOL(*left > *right);
}

PG_FUNCTION_INFO_V1(uint128_lteq);
Datum uint128_lteq(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PG_RETURN_BOOL(*left <= *right);
}

PG_FUNCTION_INFO_V1(uint128_gteq);
Datum uint128_gteq(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PG_RETURN_BOOL(*left >= *right);
}

PG_FUNCTION_INFO_V1(uint128_eq);
Datum uint128_eq(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PG_RETURN_BOOL(*left == *right);
}

PG_FUNCTION_INFO_V1(uint128_neq);
Datum uint128_neq(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PG_RETURN_BOOL(*left != *right);
}

PG_FUNCTION_INFO_V1(uint128_uplus);
Datum uint128_uplus(PG_FUNCTION_ARGS)
{
    pw3_uint128 *value = PW3_GETARG_UINT128_P(0);
    PW3_RETURN_UINT128_P(value);
}

PG_FUNCTION_INFO_V1(uint128_uminus);
Datum uint128_uminus(PG_FUNCTION_ARGS)
{
    pw3_uint128 *value = PW3_GETARG_UINT128_P(0);
    if (*value != 0)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint128 out of range")));
    }
    PW3_RETURN_UINT128_P(value);
}

PG_FUNCTION_INFO_V1(uint128_abs);
Datum uint128_abs(PG_FUNCTION_ARGS)
{
    pw3_uint128 *value = PW3_GETARG_UINT128_P(0);
    PW3_RETURN_UINT128_P(value);
}

PG_FUNCTION_INFO_V1(uint128_bitand);
Datum uint128_bitand(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(*left & *right));
}

PG_FUNCTION_INFO_V1(uint128_bitor);
Datum uint128_bitor(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(*left | *right));
}

PG_FUNCTION_INFO_V1(uint128_bitxor);
Datum uint128_bitxor(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    pw3_uint128 *right = PW3_GETARG_UINT128_P(1);
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(*left ^ *right));
}

PG_FUNCTION_INFO_V1(uint128_bitnot);
Datum uint128_bitnot(PG_FUNCTION_ARGS)
{
    pw3_uint128 *value = PW3_GETARG_UINT128_P(0);
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(~*value));
}

PG_FUNCTION_INFO_V1(uint128_bitshiftleft);
Datum uint128_bitshiftleft(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(*left << right));
}

PG_FUNCTION_INFO_V1(uint128_bitshiftright);
Datum uint128_bitshiftright(PG_FUNCTION_ARGS)
{
    pw3_uint128 *left = PW3_GETARG_UINT128_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_UINT128_P(pw3_uint128_palloc(*left >> right));
}
