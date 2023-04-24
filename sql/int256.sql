-- TEST -- in function (success)
SELECT '0'::int256;
-- TEST -- in function min (success)
SELECT '-57896044618658097711785492504343953926634992332820282019728792003956564819968'::int256;
-- TEST -- in function max (success)
SELECT '57896044618658097711785492504343953926634992332820282019728792003956564819967'::int256;
-- TEST -- in function min - 1 (failure)
SELECT '-57896044618658097711785492504343953926634992332820282019728792003956564819969'::int256;
-- TEST -- in function max + 1 (failure)
SELECT '57896044618658097711785492504343953926634992332820282019728792003956564819968'::int256;

-- min variable
\set int256_min '\'-57896044618658097711785492504343953926634992332820282019728792003956564819968\'::int256'
-- max variable
\set int256_max '\'57896044618658097711785492504343953926634992332820282019728792003956564819967\'::int256'

-- TEST -- operator add (success)
SELECT '5'::int256 + '2'::int256;
-- TEST -- operator add (failure)
SELECT :int256_max + '1'::int256;

-- TEST -- operator sub (success)
SELECT '5'::int256 - '2'::int256;
-- TEST -- operator sub (failure)
SELECT :int256_min - '1'::int256;

-- TEST -- operator mul (success)
SELECT '5'::int256 * '2'::int256;
-- TEST -- operator mul (failure)
SELECT :int256_max * '2'::int256;

-- TEST -- operator div (success)
SELECT '5'::int256 / '2'::int256;
-- TEST -- operator div (failure)
SELECT '5'::int256 / '0'::int256;
-- TEST -- operator div (failure)
SELECT :int256_min / '-1'::int256;

-- TEST -- operator mod (success)
SELECT '5'::int256 % '2'::int256;
-- TEST -- operator mod (failure)
SELECT '5'::int256 % '0'::int256;

-- TEST -- operator lt (success)
SELECT '5'::int256 < '2'::int256;
-- TEST -- operator lt (success)
SELECT '5'::int256 < '5'::int256;

-- TEST -- operator gt (success)
SELECT '5'::int256 > '2'::int256;
-- TEST -- operator gt (success)
SELECT '5'::int256 > '5'::int256;

-- TEST -- operator lteq (success)
SELECT '5'::int256 <= '2'::int256;
-- TEST -- operator lteq (success)
SELECT '5'::int256 <= '5'::int256;

-- TEST -- operator gteq (success)
SELECT '5'::int256 >= '2'::int256;
-- TEST -- operator gteq (success)
SELECT '5'::int256 >= '5'::int256;

-- TEST -- operator eq (success)
SELECT '5'::int256 = '2'::int256;
-- TEST -- operator eq (success)
SELECT '5'::int256 = '5'::int256;

-- TEST -- operator neq (success)
SELECT '5'::int256 <> '2'::int256;
-- TEST -- operator neq (success)
SELECT '5'::int256 <> '5'::int256;

-- TEST -- operator uplus (success)
SELECT +('5'::int256);

-- TEST -- operator uminus (success)
SELECT -('5'::int256);

-- TEST -- operator abs (success)
SELECT @('5'::int256);
-- TEST -- operator abs (success)
SELECT @('-5'::int256);
-- TEST -- operator abs (failure)
SELECT @(:int256_min);

-- TEST -- operator bitand (success)
SELECT '5'::int256 & '2'::int256;

-- TEST -- operator bitor (success)
SELECT '5'::int256 | '2'::int256;

-- TEST -- operator bitxor (success)
SELECT '5'::int256 # '2'::int256;

-- TEST -- operator bitnot (success)
SELECT ~('2'::int256);

-- TEST -- operator bitshiftleft (success)
SELECT '5'::int256 << 2;

-- TEST -- operator bitshiftright (success)
SELECT '5'::int256 >> 2;

-- TEST -- cast int256 as smallint (success)
SELECT '5'::int256::smallint;
-- TEST -- cast int256 as smallint (failure)
SELECT :int256_max::smallint;
-- TEST -- cast int256 as smallint (failure)
SELECT :int256_min::smallint;

-- TEST -- cast int256 as integer (success)
SELECT '5'::int256::integer;
-- TEST -- cast int256 as integer (failure)
SELECT :int256_max::integer;
-- TEST -- cast int256 as integer (failure)
SELECT :int256_min::integer;

-- TEST -- cast int256 as bigint (success)
SELECT '5'::int256::bigint;
-- TEST -- cast int256 as bigint (failure)
SELECT :int256_max::bigint;
-- TEST -- cast int256 as bigint (failure)
SELECT :int256_min::bigint;

-- TEST -- cast int256 as int128 (success)
SELECT '5'::int256::int128;
-- TEST -- cast int256 as int128 (failure)
SELECT :int256_min::int128;
-- TEST -- cast int256 as int128 (failure)
SELECT :int256_max::int128;

-- TEST -- cast int256 as uint128 (success)
SELECT '5'::int256::uint128;
-- TEST -- cast int256 as uint128 (failure)
SELECT '-5'::int256::uint128;

-- TEST -- cast int256 as uint256 (success)
SELECT '5'::int256::uint256;
-- TEST -- cast int256 as uint256 (failure)
SELECT '-5'::int256::uint256;

-- TEST -- cast smallint as int256 (success)
SELECT '5'::smallint::int256;

-- TEST -- cast integer as int256 (success)
SELECT '5'::integer::int256;

-- TEST -- cast bigint as int256 (success)
SELECT '5'::bigint::int256;
