#include "../pw3.h"

PG_FUNCTION_INFO_V1(hex160_lt);
Datum hex160_lt(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PG_RETURN_BOOL(*left < *right);
}

PG_FUNCTION_INFO_V1(hex160_gt);
Datum hex160_gt(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PG_RETURN_BOOL(*left > *right);
}

PG_FUNCTION_INFO_V1(hex160_lteq);
Datum hex160_lteq(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PG_RETURN_BOOL(*left <= *right);
}

PG_FUNCTION_INFO_V1(hex160_gteq);
Datum hex160_gteq(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PG_RETURN_BOOL(*left >= *right);
}

PG_FUNCTION_INFO_V1(hex160_eq);
Datum hex160_eq(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PG_RETURN_BOOL(*left == *right);
}

PG_FUNCTION_INFO_V1(hex160_neq);
Datum hex160_neq(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PG_RETURN_BOOL(*left != *right);
}

PG_FUNCTION_INFO_V1(hex160_bitand);
Datum hex160_bitand(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PW3_RETURN_HEX160_P(pw3_hex160_palloc(*left & *right));
}

PG_FUNCTION_INFO_V1(hex160_bitor);
Datum hex160_bitor(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PW3_RETURN_HEX160_P(pw3_hex160_palloc(*left | *right));
}

PG_FUNCTION_INFO_V1(hex160_bitxor);
Datum hex160_bitxor(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    pw3_hex160 *right = PW3_GETARG_HEX160_P(1);
    PW3_RETURN_HEX160_P(pw3_hex160_palloc(*left ^ *right));
}

PG_FUNCTION_INFO_V1(hex160_bitnot);
Datum hex160_bitnot(PG_FUNCTION_ARGS)
{
    pw3_hex160 *value = PW3_GETARG_HEX160_P(0);
    PW3_RETURN_HEX160_P(pw3_hex160_palloc(~*value));
}

PG_FUNCTION_INFO_V1(hex160_bitshiftleft);
Datum hex160_bitshiftleft(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_HEX160_P(pw3_hex160_palloc(*left << right));
}

PG_FUNCTION_INFO_V1(hex160_bitshiftright);
Datum hex160_bitshiftright(PG_FUNCTION_ARGS)
{
    pw3_hex160 *left = PW3_GETARG_HEX160_P(0);
    int32 right = PG_GETARG_INT32(1);
    PW3_RETURN_HEX160_P(pw3_hex160_palloc(*left >> right));
}
