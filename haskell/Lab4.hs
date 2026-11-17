module Lab4 where

import Data.List
import Test.QuickCheck

{-
1 a) GHC.List
b) 38388
c) 40507084800
d) Lives in Data.List, Handles empty prefix as always true
e)  - GHC.List.all
    - GHC.List.any
    - We handled empty list corner cases as always true for "all" functions and
    always false for "any" functions
    - All elements of the empty list are positive, according to our
    implementation
    - There is no palindrome in the empty list of strings, according to our
    implementation
-}

allPos :: (Ord a, Num a) => [a] -> Bool
allPos xs = all (> 0) xs

allOdd :: (Integral a) => [a] -> Bool
allOdd xs = all odd xs

has42 :: (Eq a, Num a) => [a] -> Bool
has42 [] = False
has42 (x : xs) = x == 42 || has42 xs

allHave42 :: (Eq a, Num a) => [[a]] -> Bool
allHave42 xs = all has42 xs

anyZero :: (Eq a, Num a) => [a] -> Bool
anyZero xs = any (== 0) xs

anyHas42 :: (Eq a, Num a) => [[a]] -> Bool
anyHas42 xs = any has42 xs

triNum :: Int -> Int
triNum 0 = 0
triNum n = n + triNum (n - 1)

prop_triNum :: Int -> Property
prop_triNum n = n >= 0 ==> triNum n == n * (n + 1) `div` 2

mydrop :: Int -> [Int] -> [Int]
mydrop n [] = []
mydrop 0 xs = xs
mydrop n (x : xs) = mydrop (n - 1) xs

prop_mydrop :: Int -> [Int] -> Property
prop_mydrop n (xs :: [Int]) = n >= 0 ==> mydrop n xs == drop n xs

myelem :: (Eq a) => a -> [a] -> Bool
myelem n [] = False
myelem n (x : xs) = x == n || myelem n xs

prop_myelem :: (Eq a) => a -> [a] -> Bool
prop_myelem n xs = myelem n xs == Prelude.elem n xs

lookup_recursive :: (Eq k) => k -> [(k, v)] -> [v]
lookup_recursive n [] = []
lookup_recursive n ((k, v) : xs)
  | n == k = v : lookup_recursive n xs
  | otherwise = lookup_recursive n xs

mylookup :: (Eq k) => k -> [(k, v)] -> [v]
mylookup k kvs = map snd (filter ((== k) . fst) kvs)

prop_mylookup :: (Eq v, Eq k) => k -> [(k, v)] -> Bool
prop_mylookup k kvs = mylookup k kvs == lookup_recursive k kvs

myinsert :: (Ord t) => t -> [t] -> [t]
myinsert n [] = [n]
myinsert n (x : xs)
  | n > x = x : myinsert n xs
  | otherwise = n : (x : xs)

prop_myinsert :: (Ord t) => t -> [t] -> Bool
prop_myinsert n xs = myinsert n (sort xs) == sort (n : xs)

inSort :: (Ord a) => [a] -> [a]
inSort [] = []
inSort xs = aux [] xs
  where
    aux ys [] = ys
    aux ys (z : zs) = aux (myinsert z ys) zs

prop_inSort :: (Ord a) => [a] -> Bool
prop_inSort xs = inSort xs == sort xs

{-
4.3.2c)
sorted list     remaining input
[]              [5,3,7,1,2,9]
[5]             [3,7,1,2,9]
[3,5]           [7,1,2,9]
[3,5,7]         [1,2,9]
[1,3,5,7]       [2,9]
[1,2,3,5,7]     [9]
[1,2,3,5,7,9]   []
-}

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys)
  | x < y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

prop_merge :: [Int] -> [Int] -> Bool
prop_merge xs ys = merge (sort xs) (sort ys) == sort (xs ++ ys)

mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort xs
  | length xs <= 1 = xs
  | otherwise = merge sorted_first_half sorted_second_half
  where
    mid = length xs `div` 2
    sorted_first_half = mergeSort (take mid xs)
    sorted_second_half = mergeSort (drop mid xs)

prop_mergeSort :: [Int] -> Bool
prop_mergeSort xs = mergeSort xs == sort xs