#include "../pw3.h"

#include "utils/numeric.h"
#include "utils/builtins.h"

PG_FUNCTION_INFO_V1(int128_min);
Datum int128_min(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128_P(0);
    pw3_int128 *right = PW3_GETARG_INT128_P(1);

    PW3_RETURN_INT128_P(*left < *right ? left : right);
}

PG_FUNCTION_INFO_V1(int128_max);
Datum int128_max(PG_FUNCTION_ARGS)
{
    pw3_int128 *left = PW3_GETARG_INT128_P(0);
    pw3_int128 *right = PW3_GETARG_INT128_P(1);

    PW3_RETURN_INT128_P(*left > *right ? left : right);
}

typedef struct pw3_int128_avg_state
{
    // TODO: this is nowhere near accurate enough to get decent averages,
    // we need to instead use the numeric type of perhaps store an even bigger
    // integer type and do the bulk of the work in the final function
    float8 sum;
    int64 count;
} pw3_int128_avg_state;

#define PW3_GETARG_INT128_AVG_STATE_P(n) ((pw3_int128_avg_state *)PG_GETARG_DATUM(n))
#define PW3_RETURN_INT128_AVG_STATE_P(x) return ((Datum)(x))

PG_FUNCTION_INFO_V1(int128_avg_accum);
Datum int128_avg_accum(PG_FUNCTION_ARGS)
{
    pw3_int128 *value = PW3_GETARG_INT128_P(1);

    pw3_int128_avg_state *next_state;
    if (PG_ARGISNULL(0))
    {
        next_state = pw3_agg_context_palloc0_object(fcinfo, pw3_int128_avg_state);
        next_state->sum = *value;
        next_state->count = 1;
    }
    else
    {
        pw3_int128_avg_state *prev_state = PW3_GETARG_INT128_AVG_STATE_P(0);

        // if we are in an aggregate context we can modify our previous state
        if (AggCheckCallContext(fcinfo, NULL))
        {
            next_state = prev_state;
        }
        else
        {
            next_state = pw3_agg_context_palloc0_object(fcinfo, pw3_int128_avg_state);
        }

        next_state->sum = prev_state->sum + *value;
        next_state->count = prev_state->count + 1;
    }

    PW3_RETURN_INT128_AVG_STATE_P(next_state);
}

PG_FUNCTION_INFO_V1(int128_avg_combine);
Datum int128_avg_combine(PG_FUNCTION_ARGS)
{
    pw3_int128_avg_state *state = pw3_agg_context_palloc0_object(fcinfo, pw3_int128_avg_state);
    state->sum = 0;
    state->count = 0;

    if (!PG_ARGISNULL(0))
    {
        pw3_int128_avg_state *left = PW3_GETARG_INT128_AVG_STATE_P(0);
        state->sum += left->sum;
        state->count += left->count;
    }

    if (!PG_ARGISNULL(1))
    {
        pw3_int128_avg_state *right = PW3_GETARG_INT128_AVG_STATE_P(1);
        state->sum += right->sum;
        state->count += right->count;
    }

    PW3_RETURN_INT128_AVG_STATE_P(state);
}

PG_FUNCTION_INFO_V1(int128_avg_final);
Datum int128_avg_final(PG_FUNCTION_ARGS)
{
    if (PG_ARGISNULL(0))
    {
        PG_RETURN_NULL();
    }

    pw3_int128_avg_state *state = PW3_GETARG_INT128_AVG_STATE_P(0);
    if (state->count <= 0)
    {
        PG_RETURN_NULL();
    }

    float8 float_result = state->sum / state->count;
    Numeric numeric_result = DatumGetNumeric(DirectFunctionCall1(float8_numeric, Float8GetDatum(float_result)));
    PG_RETURN_NUMERIC(numeric_result);
}