#include "../pw3.h"
#include "libpq/pqformat.h"

PG_FUNCTION_INFO_V1(int256_in);
Datum int256_in(PG_FUNCTION_ARGS)
{
    char *str = PG_GETARG_CSTRING(0);
    size_t len = strlen(str);

    bool has_digits = false;
    bool positive = true;
    pw3_int256 acc_temp = 0;
    pw3_int256 acc = 0;
    for (size_t i = 0; i < len; i++)
    {
        char c = str[i];

        // handle sign
        if (i == 0)
        {
            if (c == '-')
            {
                positive = false;
                continue;
            }
            if (c == '+')
            {
                continue;
            }
        }

        has_digits = true;

        if (c < '0' || c > '9')
        {
            goto invalid_syntax;
        }
        pw3_int256 v = c - '0';

        if (pw3_int256_mul_overflow(acc, 10, &acc_temp))
        {
            goto out_of_range;
        }
        acc = acc_temp;

        if (v == 0)
        {
            continue;
        }

        if (!positive)
        {
            v = -v;
        }

        if (pw3_int256_add_overflow(acc, v, &acc_temp))
        {
            goto out_of_range;
        }
        acc = acc_temp;
    }

    if (!has_digits)
    {
        goto invalid_syntax;
    }

    PW3_RETURN_INT256_P(pw3_int256_palloc(acc));

out_of_range:
    ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("value \"%s\" is out of range for type %s", str, "int256")));

invalid_syntax:
    ereport(ERROR, (errcode(ERRCODE_INVALID_TEXT_REPRESENTATION), errmsg("invalid input syntax for type %s: \"%s\"", "int256", str)));
}

PG_FUNCTION_INFO_V1(int256_out);
Datum int256_out(PG_FUNCTION_ARGS)
{
    pw3_int256 *data = PW3_GETARG_INT256_P(0);

    char str_buf[PW3_INT256_STRLEN_MAX];
    char *str_end = str_buf + PW3_INT256_STRLEN_MAX;
    char *str_begin = str_end;

    pw3_int256 rem = *data;
    bool positive = rem >= 0;

    while (true)
    {
        pw3_int256 r = rem % 10;
        rem = rem / 10;

        char c = '0' + (positive ? r : -r);

        str_begin--;
        *str_begin = c;

        if (rem == 0)
        {
            break;
        }
    }

    if (!positive)
    {
        str_begin--;
        *str_begin = '-';
    }

    char *str = palloc0(sizeof(char) * (str_end - str_begin + 1));
    memcpy(str, str_begin, str_end - str_begin);
    PG_RETURN_CSTRING(str);
}

PG_FUNCTION_INFO_V1(int256_send);
Datum int256_send(PG_FUNCTION_ARGS)
{
    pw3_int256 *data = PW3_GETARG_INT256_P(0);

    StringInfoData buf;
    pq_begintypsend(&buf);

    pw3_int256 value = *data;
    pw3_bswap(&value, sizeof(pw3_int256));
    pq_sendbytes(&buf, &value, sizeof(pw3_int256));

    PG_RETURN_BYTEA_P(pq_endtypsend(&buf));
}

PG_FUNCTION_INFO_V1(int256_recv);
Datum int256_recv(PG_FUNCTION_ARGS)
{
    StringInfo buf = (StringInfo)PG_GETARG_POINTER(0);

    pw3_int256 *value = pw3_int256_palloc(0);
    pq_copymsgbytes(buf, (char *)value, sizeof(pw3_int256));
    pw3_bswap(value, sizeof(pw3_int256));

    PW3_RETURN_INT256_P(value);
}