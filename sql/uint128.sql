-- TEST -- in function min (success)
SELECT '0'::uint128;
-- TEST -- in function min (success)
SELECT '-0'::uint128;
-- TEST -- in function max (success)
SELECT '340282366920938463463374607431768211455'::uint128;
-- TEST -- in function min - 1 (failure)
SELECT '-1'::uint128;
-- TEST -- in function max + 1 (failure)
SELECT '340282366920938463463374607431768211456'::uint128;

-- min variable
\set uint128_min '\'0\'::uint128'
-- max variable
\set uint128_max '\'340282366920938463463374607431768211455\'::uint128'

-- TEST -- operator add (success)
SELECT 5::uint128 + 2::uint128;
-- TEST -- operator add (failure)
SELECT :uint128_max + 1::uint128;

-- TEST -- operator sub (success)
SELECT 5::uint128 - 2::uint128;
-- TEST -- operator sub (failure)
SELECT :uint128_min - 1::uint128;

-- TEST -- operator mul (success)
SELECT 5::uint128 * 2::uint128;
-- TEST -- operator mul (failure)
SELECT :uint128_max * 2::uint128;

-- TEST -- operator div (success)
SELECT 5::uint128 / 2::uint128;
-- TEST -- operator div (failure)
SELECT 5::uint128 / 0::uint128;

-- TEST -- operator mod (success)
SELECT 5::uint128 % 2::uint128;
-- TEST -- operator mod (failure)
SELECT 5::uint128 % 0::uint128;

-- TEST -- operator lt (success)
SELECT 5::uint128 < 2::uint128;
-- TEST -- operator lt (success)
SELECT 5::uint128 < 5::uint128;

-- TEST -- operator gt (success)
SELECT 5::uint128 > 2::uint128;
-- TEST -- operator gt (success)
SELECT 5::uint128 > 5::uint128;

-- TEST -- operator lteq (success)
SELECT 5::uint128 <= 2::uint128;
-- TEST -- operator lteq (success)
SELECT 5::uint128 <= 5::uint128;

-- TEST -- operator gteq (success)
SELECT 5::uint128 >= 2::uint128;
-- TEST -- operator gteq (success)
SELECT 5::uint128 >= 5::uint128;

-- TEST -- operator eq (success)
SELECT 5::uint128 = 2::uint128;
-- TEST -- operator eq (success)
SELECT 5::uint128 = 5::uint128;

-- TEST -- operator neq (success)
SELECT 5::uint128 <> 2::uint128;
-- TEST -- operator neq (success)
SELECT 5::uint128 <> 5::uint128;

-- TEST -- operator uplus (success)
SELECT +(5::uint128);

-- TEST -- operator uminus (success)
SELECT -(0::uint128);
-- TEST -- operator uminus (failure)
SELECT -(5::uint128);

-- TEST -- operator abs (success)
SELECT @(5::uint128);

-- TEST -- operator bitand (success)
SELECT 5::uint128 & 2::uint128;

-- TEST -- operator bitor (success)
SELECT 5::uint128 | 2::uint128;

-- TEST -- operator bitxor (success)
SELECT 5::uint128 # 2::uint128;

-- TEST -- operator bitnot (success)
SELECT ~(2::uint128);

-- TEST -- operator bitshiftleft (success)
SELECT 5::uint128 << 2;

-- TEST -- operator bitshiftright (success)
SELECT 5::uint128 >> 2;

-- TEST -- cast uint128 as smallint (success)
SELECT 5::uint128::smallint;
-- TEST -- cast uint128 as smallint (failure)
SELECT :uint128_max::smallint;

-- TEST -- cast uint128 as integer (success)
SELECT 5::uint128::integer;
-- TEST -- cast uint128 as integer (failure)
SELECT :uint128_max::integer;

-- TEST -- cast uint128 as bigint (success)
SELECT 5::uint128::bigint;
-- TEST -- cast uint128 as bigint (failure)
SELECT :uint128_max::bigint;

-- TEST -- cast uint128 as int128 (success)
SELECT 5::uint128::int128;
-- TEST -- cast uint128 as int128 (failure)
SELECT :uint128_max::int128;
