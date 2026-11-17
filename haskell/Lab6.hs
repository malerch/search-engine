module Lab6 where

import Data.List
import GHC.Float
import Test.QuickCheck
import Prelude

{-
6.1.1
a)  O(sqrt(n)), because for any n, it will execute sqrt(n) times

6.1.2
a)
n = 17
step  l   h   m
1     0   18  9
2     0   9   4
3     4   9   6
4     4   6   5
5     4   5   4
return 4

b) O(log(n))

d) The first algorithm takes significantly longer to execute, which can be
explained by their time complexity. sqrt(100000000000000) is still orders
of magnitude larger than log2(100000000000000)

f) the algorithm is not correct for all n; h = n + 1 ensures the starting value
is guaranteed to be greater than the answer. take isqrt 1, it will immediately
return 0 since 0 + 1 !< 1, even though sqrt(1) is 1
-}

isqrt :: Int -> Int
isqrt n = aux 0 n
  where
    aux m n
      | (m + 1) ^ 2 <= n = aux (m + 1) n
      | otherwise = m

prop_isqrt :: Int -> Property
prop_isqrt n = n >= 0 ==> n == isqrt (n ^ 2)

binary_isqrt :: Int -> Int
binary_isqrt n = aux 0 (n + 1)
  where
    aux l h
      | l + 1 < h = aux_b
      | otherwise = l
      where
        aux_b
          | m ^ 2 <= n = aux m h
          | otherwise = aux l m
        m = (l + h) `div` 2

prop_binary_isqrt :: Int -> Property
prop_binary_isqrt n = n >= 0 ==> n == binary_isqrt (n ^ 2)

isDistinctNaive :: (Eq a) => [a] -> Bool
isDistinctNaive [] = True
isDistinctNaive (x : xs) = all (/= x) xs && isDistinctNaive xs

{-
O(n^2) because it requires each element to be compared with every other
element
-}

isDistinctOrd :: (Ord a) => [a] -> Bool
isDistinctOrd xs = aux (sort xs)
  where
    aux [] = True
    aux [_] = True
    aux (x : y : zs)
      | x == y = False
      | otherwise = aux (y : zs)

prop_isDistinctNaive :: [Int] -> Bool
prop_isDistinctNaive xs = (nub xs == xs) == isDistinctNaive xs

prop_isDistinctOrd :: [Int] -> Bool
prop_isDistinctOrd xs = (nub xs == xs) == isDistinctOrd xs

prop_isDistinct :: [Int] -> Bool
prop_isDistinct xs = isDistinctNaive xs == isDistinctOrd xs

keys :: (Eq k, Ord k) => [(k, v)] -> [k]
keys = sort . map fst

isValidKvs :: (Ord k) => [(k, v)] -> Bool
isValidKvs = isDistinctOrd . keys

{-
c) lookup returns the value corresponding to a given key in an association list
-}

swearWords :: [String]
swearWords = ["fuck", "fucking", "ass", "damn", "shit"]

exampleSentences :: [String]
exampleSentences =
  [ "How can you justify destroying a $7 million dollar mini mall to rescue a girl whose ransom was only $25,000 dollars? Little Girl: FUCK YOU, LADY!",
    "Thanks a lot you shit-brained, fuck-faced, ball breaking, duck fucking pain in the ass.",
    "How's that damn three seashell thing work?",
    "Brake! Brake! Brake now, you Mickey Mouse-piece of shit!"
  ]
