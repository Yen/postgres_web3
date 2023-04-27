#include "../pw3.h"
#include "libpq/pqformat.h"

PG_FUNCTION_INFO_V1(hex256_in);
Datum hex256_in(PG_FUNCTION_ARGS)
{
    char *str = PG_GETARG_CSTRING(0);
    size_t len = strlen(str);

    bool has_digits = false;
    pw3_hex256 acc_temp = 0;
    pw3_hex256 acc = 0;
    for (size_t i = 0; i < len; i++)
    {
        char c = str[i];

        has_digits = true;

        pw3_hex256 v;
        if (c >= '0' && c <= '9')
        {
            v = c - '0';
        }
        else if (c >= 'a' && c <= 'f')
        {
            v = c - 'a' + 10;
        }
        else if (c >= 'A' && c <= 'F')
        {
            v = c - 'A' + 10;
        }
        else
        {
            goto invalid_syntax;
        }

        if (__builtin_mul_overflow(acc, 16, &acc_temp))
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

    PW3_RETURN_HEX256_P(pw3_hex256_palloc(acc));

out_of_range:
    ereport(ERROR, (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE), errmsg("value \"%s\" is out of range for type %s", str, "hex256")));

invalid_syntax:
    ereport(ERROR, (errcode(ERRCODE_INVALID_TEXT_REPRESENTATION), errmsg("invalid input syntax for type %s: \"%s\"", "hex256", str)));
}

PG_FUNCTION_INFO_V1(hex256_out);
Datum hex256_out(PG_FUNCTION_ARGS)
{
    pw3_hex256 *data = PW3_GETARG_HEX256_P(0);

    char str_buf[PW3_HEX256_STRLEN_MAX];
    char *str_end = str_buf + PW3_HEX256_STRLEN_MAX;
    char *str_begin = str_end;

    pw3_hex256 rem = *data;

    while (true)
    {
        pw3_hex256 r = rem % 16;
        rem = rem / 16;

        char c = r < 10 ? '0' + r : 'a' + r - 10;

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

PG_FUNCTION_INFO_V1(hex256_send);
Datum hex256_send(PG_FUNCTION_ARGS)
{
    pw3_hex256 *data = PW3_GETARG_HEX256_P(0);

    StringInfoData buf;
    pq_begintypsend(&buf);

    uint8_t bytes[PW3_HEX256_PACKED_SIZE];
    for (size_t i = 0; i < PW3_HEX256_PACKED_SIZE; i++)
    {
        bytes[i] = (*data >> 8 * (PW3_HEX256_PACKED_SIZE - i - 1)) && 0xFF;
    }
    pq_sendbytes(&buf, bytes, PW3_HEX256_PACKED_SIZE);

    PG_RETURN_BYTEA_P(pq_endtypsend(&buf));
}

PG_FUNCTION_INFO_V1(hex256_recv);
Datum hex256_recv(PG_FUNCTION_ARGS)
{
    StringInfo buf = (StringInfo)PG_GETARG_POINTER(0);

    uint8_t bytes[PW3_HEX256_PACKED_SIZE];
    pq_copymsgbytes(buf, bytes, PW3_HEX256_PACKED_SIZE);

    pw3_hex256 *value = pw3_hex256_palloc(0);
    for (size_t i = 0; i < PW3_HEX256_PACKED_SIZE; i++)
    {
        *value |= (pw3_hex256)bytes[i] << 8 * (PW3_HEX256_PACKED_SIZE - i - 1);
    }
    PW3_RETURN_HEX256_P(value);
}
