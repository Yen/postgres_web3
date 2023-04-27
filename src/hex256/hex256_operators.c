#include "../pw3.h"

PG_FUNCTION_INFO_V1(hex256_lt);
Datum hex256_lt(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PG_RETURN_BOOL(*left < *right);
}

PG_FUNCTION_INFO_V1(hex256_gt);
Datum hex256_gt(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PG_RETURN_BOOL(*left > *right);
}

PG_FUNCTION_INFO_V1(hex256_lteq);
Datum hex256_lteq(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PG_RETURN_BOOL(*left <= *right);
}

PG_FUNCTION_INFO_V1(hex256_gteq);
Datum hex256_gteq(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PG_RETURN_BOOL(*left >= *right);
}

PG_FUNCTION_INFO_V1(hex256_eq);
Datum hex256_eq(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PG_RETURN_BOOL(*left == *right);
}

PG_FUNCTION_INFO_V1(hex256_neq);
Datum hex256_neq(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PG_RETURN_BOOL(*left != *right);
}

PG_FUNCTION_INFO_V1(hex256_bitand);
Datum hex256_bitand(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PW3_RETURN_HEX256_P(pw3_hex256_palloc(*left & *right));
}

PG_FUNCTION_INFO_V1(hex256_bitor);
Datum hex256_bitor(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PW3_RETURN_HEX256_P(pw3_hex256_palloc(*left | *right));
}

PG_FUNCTION_INFO_V1(hex256_bitxor);
Datum hex256_bitxor(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    pw3_hex256 *right = PW3_GETARG_HEX256_P(1);
    PW3_RETURN_HEX256_P(pw3_hex256_palloc(*left ^ *right));
}

PG_FUNCTION_INFO_V1(hex256_bitnot);
Datum hex256_bitnot(PG_FUNCTION_ARGS)
{
    pw3_hex256 *value = PW3_GETARG_HEX256_P(0);
    PW3_RETURN_HEX256_P(pw3_hex256_palloc(~*value));
}

PG_FUNCTION_INFO_V1(hex256_bitshiftleft);
Datum hex256_bitshiftleft(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_HEX256_P(pw3_hex256_palloc(*left << right));
}

PG_FUNCTION_INFO_V1(hex256_bitshiftright);
Datum hex256_bitshiftright(PG_FUNCTION_ARGS)
{
    pw3_hex256 *left = PW3_GETARG_HEX256_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_HEX256_P(pw3_hex256_palloc(*left >> right));
}
