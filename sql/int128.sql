-- TEST -- in function (success)
SELECT '0'::int128;
-- TEST -- in function min (success)
SELECT '-170141183460469231731687303715884105728'::int128;
-- TEST -- in function max (success)
SELECT '170141183460469231731687303715884105727'::int128;
-- TEST -- in function min - 1 (failure)
SELECT '-170141183460469231731687303715884105729'::int128;
-- TEST -- in function max + 1 (failure)
SELECT '170141183460469231731687303715884105728'::int128;

-- min variable
\set int128_min '\'-170141183460469231731687303715884105728\'::int128'
-- max variable
\set int128_max '\'170141183460469231731687303715884105727\'::int128'

-- TEST -- operator add (success)
SELECT 5::int128 + 2::int128;
-- TEST -- operator add (failure)
SELECT :int128_max + 1::int128;

-- TEST -- operator sub (success)
SELECT 5::int128 - 2::int128;
-- TEST -- operator sub (failure)
SELECT :int128_min - 1::int128;

-- TEST -- operator mul (success)
SELECT 5::int128 * 2::int128;
-- TEST -- operator mul (failure)
SELECT :int128_max * 2::int128;

-- TEST -- operator div (success)
SELECT 5::int128 / 2::int128;
-- TEST -- operator div (failure)
SELECT 5::int128 / 0::int128;
-- TEST -- operator div (failure)
SELECT :int128_min / -1::int128;

-- TEST -- operator mod (success)
SELECT 5::int128 % 2::int128;
-- TEST -- operator mod (failure)
SELECT 5::int128 % 0::int128;

-- TEST -- operator lt (success)
SELECT 5::int128 < 2::int128;
-- TEST -- operator lt (success)
SELECT 5::int128 < 5::int128;

-- TEST -- operator gt (success)
SELECT 5::int128 > 2::int128;
-- TEST -- operator gt (success)
SELECT 5::int128 > 5::int128;

-- TEST -- operator lteq (success)
SELECT 5::int128 <= 2::int128;
-- TEST -- operator lteq (success)
SELECT 5::int128 <= 5::int128;

-- TEST -- operator gteq (success)
SELECT 5::int128 >= 2::int128;
-- TEST -- operator gteq (success)
SELECT 5::int128 >= 5::int128;

-- TEST -- operator eq (success)
SELECT 5::int128 = 2::int128;
-- TEST -- operator eq (success)
SELECT 5::int128 = 5::int128;

-- TEST -- operator neq (success)
SELECT 5::int128 <> 2::int128;
-- TEST -- operator neq (success)
SELECT 5::int128 <> 5::int128;

-- TEST -- operator uplus (success)
SELECT +(5::int128);

-- TEST -- operator uminus (success)
SELECT -(5::int128);

-- TEST -- operator abs (success)
SELECT @(5::int128);
-- TEST -- operator abs (success)
SELECT @(-5::int128);
-- TEST -- operator abs (failure)
SELECT @(:int128_min);

-- TEST -- operator bitand (success)
SELECT 5::int128 & 2::int128;

-- TEST -- operator bitor (success)
SELECT 5::int128 | 2::int128;

-- TEST -- operator bitxor (success)
SELECT 5::int128 # 2::int128;

-- TEST -- operator bitnot (success)
SELECT ~(2::int128);

-- TEST -- operator bitshiftleft (success)
SELECT 5::int128 << 2;

-- TEST -- operator bitshiftright (success)
SELECT 5::int128 >> 2;

-- TEST -- cast int128 as smallint (success)
SELECT 5::int128::smallint;
-- TEST -- cast int128 as smallint (failure)
SELECT :int128_max::smallint;
-- TEST -- cast int128 as smallint (failure)
SELECT :int128_min::smallint;

-- TEST -- cast int128 as integer (success)
SELECT 5::int128::integer;
-- TEST -- cast int128 as integer (failure)
SELECT :int128_max::integer;
-- TEST -- cast int128 as integer (failure)
SELECT :int128_min::integer;

-- TEST -- cast int128 as bigint (success)
SELECT 5::int128::bigint;
-- TEST -- cast int128 as bigint (failure)
SELECT :int128_max::bigint;
-- TEST -- cast int128 as bigint (failure)
SELECT :int128_min::bigint;

-- TEST -- cast int128 as uint128 (success)
SELECT 5::int128::uint128;
-- TEST -- cast int128 as uint128 (failure)
SELECT -5::int128::uint128;
