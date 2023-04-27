#include "../pw3.h"
#include "libpq/pqformat.h"

PG_FUNCTION_INFO_V1(uint256_in);
Datum uint256_in(PG_FUNCTION_ARGS)
{
    char *str = PG_GETARG_CSTRING(0);
    size_t len = strlen(str);

    bool has_digits = false;
    bool positive = true;
    pw3_uint256 acc_temp = 0;
    pw3_uint256 acc = 0;
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
        pw3_uint256 v = c - '0';

        if (__builtin_mul_overflow(acc, 10, &acc_temp))
        {
            goto out_of_range;
        }
        acc = acc_temp;

        if (v == 0)
        {
            continue;
        }

        if (__builtin_add_overflow(acc, v, &acc_temp))
        {
            goto out_of_range;
        }
        acc = acc_temp;
    }

    if (!has_digits)
    {
        goto invalid_syntax;
    }

    if (!positive && acc != 0)
    {
        goto out_of_range;
    }

    PW3_RETURN_UINT256_P(pw3_uint256_palloc(acc));

out_of_range:
    ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("value \"%s\" is out of range for type %s", str, "uint256")));

invalid_syntax:
    ereport(ERROR, (errcode(ERRCODE_INVALID_TEXT_REPRESENTATION), errmsg("invalid input syntax for type %s: \"%s\"", "uint256", str)));
}

PG_FUNCTION_INFO_V1(uint256_out);
Datum uint256_out(PG_FUNCTION_ARGS)
{
    pw3_uint256 *data = PW3_GETARG_UINT256_P(0);

    char str_buf[PW3_UINT256_STRLEN_MAX];
    char *str_end = str_buf + PW3_UINT256_STRLEN_MAX;
    char *str_begin = str_end;

    pw3_uint256 rem = *data;

    while (true)
    {
        pw3_uint256 r = rem % 10;
        rem = rem / 10;

        char c = '0' + r;

        str_begin--;
        *str_begin = c;

        if (rem == 0)
        {
            break;
        }
    }

    char *str = palloc0(sizeof(char) * (str_end - str_begin + 1));
    memcpy(str, str_begin, str_end - str_begin);
    PG_RETURN_CSTRING(str);
}

PG_FUNCTION_INFO_V1(uint256_send);
Datum uint256_send(PG_FUNCTION_ARGS)
{
    pw3_uint256 *data = PW3_GETARG_UINT256_P(0);

    StringInfoData buf;
    pq_begintypsend(&buf);

    uint8_t bytes[PW3_UINT256_PACKED_SIZE];
    for (size_t i = 0; i < PW3_UINT256_PACKED_SIZE; i++)
    {
        bytes[i] = (*data >> 8 * (PW3_UINT256_PACKED_SIZE - i - 1)) && 0xFF;
    }
    pq_sendbytes(&buf, bytes, PW3_UINT256_PACKED_SIZE);

    PG_RETURN_BYTEA_P(pq_endtypsend(&buf));
}

PG_FUNCTION_INFO_V1(uint256_recv);
Datum uint256_recv(PG_FUNCTION_ARGS)
{
    StringInfo buf = (StringInfo)PG_GETARG_POINTER(0);

    uint8_t bytes[PW3_UINT256_PACKED_SIZE];
    pq_copymsgbytes(buf, bytes, PW3_UINT256_PACKED_SIZE);

    pw3_uint256 *value = pw3_uint256_palloc(0);
    for (size_t i = 0; i < PW3_UINT256_PACKED_SIZE; i++)
    {
        *value |= (pw3_uint256)bytes[i] << 8 * (PW3_UINT256_PACKED_SIZE - i - 1);
    }
    PW3_RETURN_UINT256_P(value);
}
