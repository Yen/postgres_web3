#include "../pw3.h"

PG_FUNCTION_INFO_V1(uint256_add);
Datum uint256_add(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);

    pw3_uint256 result;
    if (__builtin_add_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint256 out of range")));
    }
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(result));
}

PG_FUNCTION_INFO_V1(uint256_sub);
Datum uint256_sub(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);

    pw3_uint256 result;
    if (__builtin_sub_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint256 out of range")));
    }
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(result));
}

PG_FUNCTION_INFO_V1(uint256_mul);
Datum uint256_mul(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);

    pw3_uint256 result;
    if (__builtin_mul_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint256 out of range")));
    }
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(result));
}

PG_FUNCTION_INFO_V1(uint256_div);
Datum uint256_div(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);

    pw3_uint256 result;
    if (*right == 0)
    {
        ereport(ERROR, (errcode(ERRCODE_DIVISION_BY_ZERO), errmsg("division by zero")));
    }

    result = *left / *right;
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(result));
}

PG_FUNCTION_INFO_V1(uint256_mod);
Datum uint256_mod(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);

    pw3_uint256 result;
    if (*right == 0)
    {
        ereport(ERROR, (errcode(ERRCODE_DIVISION_BY_ZERO), errmsg("division by zero")));
    }

    result = *left % *right;
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(result));
}

PG_FUNCTION_INFO_V1(uint256_lt);
Datum uint256_lt(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PG_RETURN_BOOL(*left < *right);
}

PG_FUNCTION_INFO_V1(uint256_gt);
Datum uint256_gt(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PG_RETURN_BOOL(*left > *right);
}

PG_FUNCTION_INFO_V1(uint256_lteq);
Datum uint256_lteq(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PG_RETURN_BOOL(*left <= *right);
}

PG_FUNCTION_INFO_V1(uint256_gteq);
Datum uint256_gteq(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PG_RETURN_BOOL(*left >= *right);
}

PG_FUNCTION_INFO_V1(uint256_eq);
Datum uint256_eq(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PG_RETURN_BOOL(*left == *right);
}

PG_FUNCTION_INFO_V1(uint256_neq);
Datum uint256_neq(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PG_RETURN_BOOL(*left != *right);
}

PG_FUNCTION_INFO_V1(uint256_uplus);
Datum uint256_uplus(PG_FUNCTION_ARGS)
{
    pw3_uint256 *value = PW3_GETARG_UINT256_P(0);
    PW3_RETURN_UINT256_P(value);
}

PG_FUNCTION_INFO_V1(uint256_uminus);
Datum uint256_uminus(PG_FUNCTION_ARGS)
{
    pw3_uint256 *value = PW3_GETARG_UINT256_P(0);
    if (*value != 0)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("uint256 out of range")));
    }
    PW3_RETURN_UINT256_P(value);
}

PG_FUNCTION_INFO_V1(uint256_abs);
Datum uint256_abs(PG_FUNCTION_ARGS)
{
    pw3_uint256 *value = PW3_GETARG_UINT256_P(0);
    PW3_RETURN_UINT256_P(value);
}

PG_FUNCTION_INFO_V1(uint256_bitand);
Datum uint256_bitand(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(*left & *right));
}

PG_FUNCTION_INFO_V1(uint256_bitor);
Datum uint256_bitor(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(*left | *right));
}

PG_FUNCTION_INFO_V1(uint256_bitxor);
Datum uint256_bitxor(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    pw3_uint256 *right = PW3_GETARG_UINT256_P(1);
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(*left ^ *right));
}

PG_FUNCTION_INFO_V1(uint256_bitnot);
Datum uint256_bitnot(PG_FUNCTION_ARGS)
{
    pw3_uint256 *value = PW3_GETARG_UINT256_P(0);
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(~*value));
}

PG_FUNCTION_INFO_V1(uint256_bitshiftleft);
Datum uint256_bitshiftleft(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(*left << right));
}

PG_FUNCTION_INFO_V1(uint256_bitshiftright);
Datum uint256_bitshiftright(PG_FUNCTION_ARGS)
{
    pw3_uint256 *left = PW3_GETARG_UINT256_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_UINT256_P(pw3_uint256_palloc(*left >> right));
}
