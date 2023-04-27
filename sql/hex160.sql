-- TEST -- in function min (success)
SELECT '0'::hex160;
-- TEST -- in function max (success)
SELECT 'ffffffffffffffffffffffffffffffffffffffff'::hex160;
-- TEST -- in function max (success)
SELECT 'fFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfF'::hex160;
-- TEST -- in function max + 1 (failure)
SELECT 'ffffffffffffffffffffffffffffffffffffffff1'::hex160;

-- min variable
\set hex160_min '\'0\'::hex160'
-- max variable
\set hex160_max '\'ffffffffffffffffffffffffffffffffffffffff\'::hex160'

-- TEST -- operator lt (success)
SELECT '5'::hex160 < '2'::hex160;
-- TEST -- operator lt (success)
SELECT '5'::hex160 < '5'::hex160;

-- TEST -- operator gt (success)
SELECT '5'::hex160 > '2'::hex160;
-- TEST -- operator gt (success)
SELECT '5'::hex160 > '5'::hex160;

-- TEST -- operator lteq (success)
SELECT '5'::hex160 <= '2'::hex160;
-- TEST -- operator lteq (success)
SELECT '5'::hex160 <= '5'::hex160;

-- TEST -- operator gteq (success)
SELECT '5'::hex160 >= '2'::hex160;
-- TEST -- operator gteq (success)
SELECT '5'::hex160 >= '5'::hex160;

-- TEST -- operator eq (success)
SELECT '5'::hex160 = '2'::hex160;
-- TEST -- operator eq (success)
SELECT '5'::hex160 = '5'::hex160;

-- TEST -- operator neq (success)
SELECT '5'::hex160 <> '2'::hex160;
-- TEST -- operator neq (success)
SELECT '5'::hex160 <> '5'::hex160;

-- TEST -- operator bitand (success)
SELECT '5'::hex160 & '2'::hex160;

-- TEST -- operator bitor (success)
SELECT '5'::hex160 | '2'::hex160;

-- TEST -- operator bitxor (success)
SELECT '5'::hex160 # '2'::hex160;

-- TEST -- operator bitnot (success)
SELECT ~('2'::hex160);

-- TEST -- operator bitshiftleft (success)
SELECT '5'::hex160 << 2;

-- TEST -- operator bitshiftright (success)
SELECT '5'::hex160 >> 2;

-- TEST -- cast hex160 as smallint (success)
SELECT '5'::hex160::smallint;
-- TEST -- cast hex160 as smallint (failure)
SELECT :hex160_max::smallint;

-- TEST -- cast hex160 as integer (success)
SELECT '5'::hex160::integer;
-- TEST -- cast hex160 as integer (failure)
SELECT :hex160_max::integer;

-- TEST -- cast hex160 as bigint (success)
SELECT '5'::hex160::bigint;
-- TEST -- cast hex160 as bigint (failure)
SELECT :hex160_max::bigint;

-- TEST -- cast hex160 as int128 (success)
SELECT '5'::hex160::int128;
-- TEST -- cast hex160 as int128 (failure)
SELECT :hex160_max::int128;

-- TEST -- cast hex160 as uint128 (success)
SELECT '5'::hex160::uint128;
-- TEST -- cast hex160 as uint128 (failure)
SELECT :hex160_max::uint128;

-- TEST -- cast hex160 as int256 (success)
SELECT '5'::hex160::int256;

-- TEST -- cast hex160 as uint256 (success)
SELECT '5'::hex160::uint256;

-- TEST -- cast hex160 as hex256 (success)
SELECT '5'::hex160::hex256;

-- TEST -- cast smallint as hex160 (success)
SELECT '5'::smallint::hex160;
-- TEST -- cast smallint as hex160 (failure)
SELECT '-5'::smallint::hex160;

-- TEST -- cast integer as hex160 (success)
SELECT '5'::integer::hex160;
-- TEST -- cast integer as hex160 (failure)
SELECT '-5'::integer::hex160;

-- TEST -- cast bigint as hex160 (success)
SELECT '5'::bigint::hex160;
-- TEST -- cast bigint as hex160 (failure)
SELECT '-5'::bigint::hex160;
