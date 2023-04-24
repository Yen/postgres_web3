#include "../pw3.h"

PG_FUNCTION_INFO_V1(int256_add);
Datum int256_add(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);

    pw3_int256 result;
    if (pw3_int256_add_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int256 out of range")));
    }
    PW3_RETURN_INT256_P(pw3_int256_palloc(result));
}

PG_FUNCTION_INFO_V1(int256_sub);
Datum int256_sub(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);

    pw3_int256 result;
    if (pw3_int256_sub_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int256 out of range")));
    }
    PW3_RETURN_INT256_P(pw3_int256_palloc(result));
}

PG_FUNCTION_INFO_V1(int256_mul);
Datum int256_mul(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);

    pw3_int256 result;
    if (pw3_int256_mul_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int256 out of range")));
    }
    PW3_RETURN_INT256_P(pw3_int256_palloc(result));
}

PG_FUNCTION_INFO_V1(int256_div);
Datum int256_div(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);

    pw3_int256 result;
    if (*right == 0)
    {
        ereport(ERROR, (errcode(ERRCODE_DIVISION_BY_ZERO), errmsg("division by zero")));
    }

    if (*right == -1)
    {
        if (*left == PW3_INT256_MIN)
        {
            ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int256 out of range")));
        }
        result = -*left;
    }
    else
    {
        result = *left / *right;
    }
    PW3_RETURN_INT256_P(pw3_int256_palloc(result));
}

PG_FUNCTION_INFO_V1(int256_mod);
Datum int256_mod(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);

    pw3_int256 result;
    if (*right == 0)
    {
        ereport(ERROR, (errcode(ERRCODE_DIVISION_BY_ZERO), errmsg("division by zero")));
    }

    if (*right == -1)
    {
        result = 0;
    }
    else
    {
        result = *left % *right;
    }
    PW3_RETURN_INT256_P(pw3_int256_palloc(result));
}

PG_FUNCTION_INFO_V1(int256_lt);
Datum int256_lt(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PG_RETURN_BOOL(*left < *right);
}

PG_FUNCTION_INFO_V1(int256_gt);
Datum int256_gt(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PG_RETURN_BOOL(*left > *right);
}

PG_FUNCTION_INFO_V1(int256_lteq);
Datum int256_lteq(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PG_RETURN_BOOL(*left <= *right);
}

PG_FUNCTION_INFO_V1(int256_gteq);
Datum int256_gteq(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PG_RETURN_BOOL(*left >= *right);
}

PG_FUNCTION_INFO_V1(int256_eq);
Datum int256_eq(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PG_RETURN_BOOL(*left == *right);
}

PG_FUNCTION_INFO_V1(int256_neq);
Datum int256_neq(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PG_RETURN_BOOL(*left != *right);
}

PG_FUNCTION_INFO_V1(int256_uplus);
Datum int256_uplus(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    PW3_RETURN_INT256_P(value);
}

PG_FUNCTION_INFO_V1(int256_uminus);
Datum int256_uminus(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value < 0)
    {
        PW3_RETURN_INT256_P(value);
    }
    PW3_RETURN_INT256_P(pw3_int256_palloc(-*value));
}

PG_FUNCTION_INFO_V1(int256_abs);
Datum int256_abs(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    if (*value >= 0)
    {
        PW3_RETURN_INT256_P(value);
    }
    if (*value == PW3_INT256_MIN)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int256 out of range")));
    }
    PW3_RETURN_INT256_P(pw3_int256_palloc(-*value));
}

PG_FUNCTION_INFO_V1(int256_bitand);
Datum int256_bitand(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PW3_RETURN_INT256_P(pw3_int256_palloc(*left & *right));
}

PG_FUNCTION_INFO_V1(int256_bitor);
Datum int256_bitor(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PW3_RETURN_INT256_P(pw3_int256_palloc(*left | *right));
}

PG_FUNCTION_INFO_V1(int256_bitxor);
Datum int256_bitxor(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    pw3_int256 *right = PW3_GETARG_INT256_P(1);
    PW3_RETURN_INT256_P(pw3_int256_palloc(*left ^ *right));
}

PG_FUNCTION_INFO_V1(int256_bitnot);
Datum int256_bitnot(PG_FUNCTION_ARGS)
{
    pw3_int256 *value = PW3_GETARG_INT256_P(0);
    PW3_RETURN_INT256_P(pw3_int256_palloc(~*value));
}

PG_FUNCTION_INFO_V1(int256_bitshiftleft);
Datum int256_bitshiftleft(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_INT256_P(pw3_int256_palloc(*left << right));
}

PG_FUNCTION_INFO_V1(int256_bitshiftright);
Datum int256_bitshiftright(PG_FUNCTION_ARGS)
{
    pw3_int256 *left = PW3_GETARG_INT256_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_INT256_P(pw3_int256_palloc(*left >> right));
}
