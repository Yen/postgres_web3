-- TEST -- in function min (success)
SELECT '0'::uint256;
-- TEST -- in function min (success)
SELECT '-0'::uint256;
-- TEST -- in function max (success)
SELECT '115792089237316195423570985008687907853269984665640564039457584007913129639935'::uint256;
-- TEST -- in function min - 1 (failure)
SELECT '-1'::uint256;
-- TEST -- in function max + 1 (failure)
SELECT '115792089237316195423570985008687907853269984665640564039457584007913129639936'::uint256;

-- min variable
\set uint256_min '\'0\'::uint256'
-- max variable
\set uint256_max '\'115792089237316195423570985008687907853269984665640564039457584007913129639935\'::uint256'

-- TEST -- operator add (success)
SELECT '5'::uint256 + '2'::uint256;
-- TEST -- operator add (failure)
SELECT :uint256_max + '1'::uint256;

-- TEST -- operator sub (success)
SELECT '5'::uint256 - '2'::uint256;
-- TEST -- operator sub (failure)
SELECT :uint256_min - '1'::uint256;

-- TEST -- operator mul (success)
SELECT '5'::uint256 * '2'::uint256;
-- TEST -- operator mul (failure)
SELECT :uint256_max * '2'::uint256;

-- TEST -- operator div (success)
SELECT '5'::uint256 / '2'::uint256;
-- TEST -- operator div (failure)
SELECT '5'::uint256 / '0'::uint256;

-- TEST -- operator mod (success)
SELECT '5'::uint256 % '2'::uint256;
-- TEST -- operator mod (failure)
SELECT '5'::uint256 % '0'::uint256;

-- TEST -- operator lt (success)
SELECT '5'::uint256 < '2'::uint256;
-- TEST -- operator lt (success)
SELECT '5'::uint256 < '5'::uint256;

-- TEST -- operator gt (success)
SELECT '5'::uint256 > '2'::uint256;
-- TEST -- operator gt (success)
SELECT '5'::uint256 > '5'::uint256;

-- TEST -- operator lteq (success)
SELECT '5'::uint256 <= '2'::uint256;
-- TEST -- operator lteq (success)
SELECT '5'::uint256 <= '5'::uint256;

-- TEST -- operator gteq (success)
SELECT '5'::uint256 >= '2'::uint256;
-- TEST -- operator gteq (success)
SELECT '5'::uint256 >= '5'::uint256;

-- TEST -- operator eq (success)
SELECT '5'::uint256 = '2'::uint256;
-- TEST -- operator eq (success)
SELECT '5'::uint256 = '5'::uint256;

-- TEST -- operator neq (success)
SELECT '5'::uint256 <> '2'::uint256;
-- TEST -- operator neq (success)
SELECT '5'::uint256 <> '5'::uint256;

-- TEST -- operator uplus (success)
SELECT +('5'::uint256);

-- TEST -- operator uminus (success)
SELECT -('0'::uint256);
-- TEST -- operator uminus (failure)
SELECT -('5'::uint256);

-- TEST -- operator abs (success)
SELECT @('5'::uint256);

-- TEST -- operator bitand (success)
SELECT '5'::uint256 & '2'::uint256;

-- TEST -- operator bitor (success)
SELECT '5'::uint256 | '2'::uint256;

-- TEST -- operator bitxor (success)
SELECT '5'::uint256 # '2'::uint256;

-- TEST -- operator bitnot (success)
SELECT ~('2'::uint256);

-- TEST -- operator bitshiftleft (success)
SELECT '5'::uint256 << 2;

-- TEST -- operator bitshiftright (success)
SELECT '5'::uint256 >> 2;

-- TEST -- cast uint256 as smallint (success)
SELECT '5'::uint256::smallint;
-- TEST -- cast uint256 as smallint (failure)
SELECT :uint256_max::smallint;

-- TEST -- cast uint256 as integer (success)
SELECT '5'::uint256::integer;
-- TEST -- cast uint256 as integer (failure)
SELECT :uint256_max::integer;

-- TEST -- cast uint256 as bigint (success)
SELECT '5'::uint256::bigint;
-- TEST -- cast uint256 as bigint (failure)
SELECT :uint256_max::bigint;

-- TEST -- cast uint256 as int128 (success)
SELECT '5'::uint256::int128;
-- TEST -- cast uint256 as int128 (failure)
SELECT :uint256_max::int128;

-- TEST -- cast uint256 as uint128 (success)
SELECT '5'::uint256::uint128;
-- TEST -- cast uint256 as uint128 (failure)
SELECT :uint256_max::uint128;

-- TEST -- cast uint256 as int256 (success)
SELECT '5'::uint256::int256;

-- TEST -- cast uint256 as hex160 (success)
SELECT '5'::uint256::hex160;
-- TEST -- cast uint256 as hex160 (failure)
SELECT :uint256_max::hex160;

-- TEST -- cast uint256 as hex256 (success)
SELECT '5'::uint256::hex256;

-- TEST -- cast smallint as uint256 (success)
SELECT '5'::smallint::uint256;
-- TEST -- cast smallint as uint256 (failure)
SELECT '-5'::smallint::uint256;

-- TEST -- cast integer as uint256 (success)
SELECT '5'::integer::uint256;
-- TEST -- cast integer as uint256 (failure)
SELECT '-5'::integer::uint256;

-- TEST -- cast bigint as uint256 (success)
SELECT '5'::bigint::uint256;
-- TEST -- cast bigint as uint256 (failure)
SELECT '-5'::bigint::uint256;
