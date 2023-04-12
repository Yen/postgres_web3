#include "pw3.h"

PG_FUNCTION_INFO_V1(int128_add);
Datum int128_add(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);

    pw3_int128 result;
    if (__builtin_add_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int128 out of range")));
    }
    PW3_RETURN_INT128(pw3_int128_palloc(result));
}

PG_FUNCTION_INFO_V1(int128_sub);
Datum int128_sub(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);

    pw3_int128 result;
    if (__builtin_sub_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int128 out of range")));
    }
    PW3_RETURN_INT128(pw3_int128_palloc(result));
}

PG_FUNCTION_INFO_V1(int128_mul);
Datum int128_mul(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);

    pw3_int128 result;
    if (__builtin_mul_overflow(*left, *right, &result))
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int128 out of range")));
    }
    PW3_RETURN_INT128(pw3_int128_palloc(result));
}

PG_FUNCTION_INFO_V1(int128_div);
Datum int128_div(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);

    pw3_int128 result;
    if (*right == 0)
    {
        ereport(ERROR, (errcode(ERRCODE_DIVISION_BY_ZERO), errmsg("division by zero")));
    }

    if (*right == -1)
    {
        if (*left == PW3_INT128_MIN)
        {
            ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int128 out of range")));
        }
        result = -*left;
    }
    else
    {
        result = *left / *right;
    }
    PW3_RETURN_INT128(pw3_int128_palloc(result));
}

PG_FUNCTION_INFO_V1(int128_mod);
Datum int128_mod(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);

    pw3_int128 result;
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
    PW3_RETURN_INT128(pw3_int128_palloc(result));
}

PG_FUNCTION_INFO_V1(int128_lt);
Datum int128_lt(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PG_RETURN_BOOL(*left < *right);
}

PG_FUNCTION_INFO_V1(int128_gt);
Datum int128_gt(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PG_RETURN_BOOL(*left > *right);
}

PG_FUNCTION_INFO_V1(int128_lteq);
Datum int128_lteq(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PG_RETURN_BOOL(*left <= *right);
}

PG_FUNCTION_INFO_V1(int128_gteq);
Datum int128_gteq(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PG_RETURN_BOOL(*left >= *right);
}

PG_FUNCTION_INFO_V1(int128_eq);
Datum int128_eq(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PG_RETURN_BOOL(*left == *right);
}

PG_FUNCTION_INFO_V1(int128_neq);
Datum int128_neq(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PG_RETURN_BOOL(*left != *right);
}

PG_FUNCTION_INFO_V1(int128_uplus);
Datum int128_uplus(PG_FUNCTION_ARGS)
{
    pw3_int128 *value = PW3_GETARG_INT128(0);
    PW3_RETURN_INT128(value);
}

PG_FUNCTION_INFO_V1(int128_uminus);
Datum int128_uminus(PG_FUNCTION_ARGS)
{
    pw3_int128 *value = PW3_GETARG_INT128(0);
    if (*value < 0)
    {
        PW3_RETURN_INT128(value);
    }
    PW3_RETURN_INT128(pw3_int128_palloc(-*value));
}

PG_FUNCTION_INFO_V1(int128_abs);
Datum int128_abs(PG_FUNCTION_ARGS)
{
    pw3_int128 *value = PW3_GETARG_INT128(0);
    if (*value >= 0)
    {
        PW3_RETURN_INT128(value);
    }
    if (*value == PW3_INT128_MIN)
    {
        ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("int128 out of range")));
    }
    PW3_RETURN_INT128(pw3_int128_palloc(-*value));
}

PG_FUNCTION_INFO_V1(int128_bitand);
Datum int128_bitand(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PW3_RETURN_INT128(pw3_int128_palloc(*left & *right));
}

PG_FUNCTION_INFO_V1(int128_bitor);
Datum int128_bitor(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PW3_RETURN_INT128(pw3_int128_palloc(*left | *right));
}

PG_FUNCTION_INFO_V1(int128_bitxor);
Datum int128_bitxor(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    pw3_int128 *right = PW3_GETARG_INT128(1);
    PW3_RETURN_INT128(pw3_int128_palloc(*left ^ *right));
}

PG_FUNCTION_INFO_V1(int128_bitnot);
Datum int128_bitnot(PG_FUNCTION_ARGS)
{
    pw3_int128 *value = PW3_GETARG_INT128(0);
    PW3_RETURN_INT128(pw3_int128_palloc(~*value));
}

PG_FUNCTION_INFO_V1(int128_bitshiftleft);
Datum int128_bitshiftleft(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_INT128(pw3_int128_palloc(*left << right));
}

PG_FUNCTION_INFO_V1(int128_bitshiftright);
Datum int128_bitshiftright(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_INT128(pw3_int128_palloc(*left >> right));
}
