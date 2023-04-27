-- TEST -- in function min (success)
SELECT '0'::hex256;
-- TEST -- in function max (success)
SELECT 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'::hex256;
-- TEST -- in function max (success)
SELECT 'fFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfFfF'::hex256;
-- TEST -- in function max + 1 (failure)
SELECT 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1'::hex256;

-- min variable
\set hex256_min '\'0\'::hex256'
-- max variable
\set hex256_max '\'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff\'::hex256'

-- TEST -- operator lt (success)
SELECT '5'::hex256 < '2'::hex256;
-- TEST -- operator lt (success)
SELECT '5'::hex256 < '5'::hex256;

-- TEST -- operator gt (success)
SELECT '5'::hex256 > '2'::hex256;
-- TEST -- operator gt (success)
SELECT '5'::hex256 > '5'::hex256;

-- TEST -- operator lteq (success)
SELECT '5'::hex256 <= '2'::hex256;
-- TEST -- operator lteq (success)
SELECT '5'::hex256 <= '5'::hex256;

-- TEST -- operator gteq (success)
SELECT '5'::hex256 >= '2'::hex256;
-- TEST -- operator gteq (success)
SELECT '5'::hex256 >= '5'::hex256;

-- TEST -- operator eq (success)
SELECT '5'::hex256 = '2'::hex256;
-- TEST -- operator eq (success)
SELECT '5'::hex256 = '5'::hex256;

-- TEST -- operator neq (success)
SELECT '5'::hex256 <> '2'::hex256;
-- TEST -- operator neq (success)
SELECT '5'::hex256 <> '5'::hex256;

-- TEST -- operator bitand (success)
SELECT '5'::hex256 & '2'::hex256;

-- TEST -- operator bitor (success)
SELECT '5'::hex256 | '2'::hex256;

-- TEST -- operator bitxor (success)
SELECT '5'::hex256 # '2'::hex256;

-- TEST -- operator bitnot (success)
SELECT ~('2'::hex256);

-- TEST -- operator bitshiftleft (success)
SELECT '5'::hex256 << 2;

-- TEST -- operator bitshiftright (success)
SELECT '5'::hex256 >> 2;

-- TEST -- cast hex256 as smallint (success)
SELECT '5'::hex256::smallint;
-- TEST -- cast hex256 as smallint (failure)
SELECT :hex256_max::smallint;

-- TEST -- cast hex256 as integer (success)
SELECT '5'::hex256::integer;
-- TEST -- cast hex256 as integer (failure)
SELECT :hex256_max::integer;

-- TEST -- cast hex256 as bigint (success)
SELECT '5'::hex256::bigint;
-- TEST -- cast hex256 as bigint (failure)
SELECT :hex256_max::bigint;

-- TEST -- cast hex256 as int128 (success)
SELECT '5'::hex256::int128;
-- TEST -- cast hex256 as int128 (failure)
SELECT :hex256_max::int128;

-- TEST -- cast hex256 as uint128 (success)
SELECT '5'::hex256::uint128;
-- TEST -- cast hex256 as uint128 (failure)
SELECT :hex256_max::uint128;

-- TEST -- cast hex256 as int256 (success)
SELECT '5'::hex256::int256;
-- TEST -- cast hex256 as int256 (failure)
SELECT :hex256_max::int256;

-- TEST -- cast hex256 as uint256 (success)
SELECT '5'::hex256::uint256;

-- TEST -- cast hex256 as hex160 (success)
SELECT '5'::hex256::hex160;
-- TEST -- cast hex256 as hex160 (failure)
SELECT :hex256_max::hex160;

-- TEST -- cast smallint as hex256 (success)
SELECT '5'::smallint::hex256;
-- TEST -- cast smallint as hex256 (failure)
SELECT '-5'::smallint::hex256;

-- TEST -- cast integer as hex256 (success)
SELECT '5'::integer::hex256;
-- TEST -- cast integer as hex256 (failure)
SELECT '-5'::integer::hex256;

-- TEST -- cast bigint as hex256 (success)
SELECT '5'::bigint::hex256;
-- TEST -- cast bigint as hex256 (failure)
SELECT '-5'::bigint::hex256;
