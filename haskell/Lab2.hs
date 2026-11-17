module Lab2 where

mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

myMul :: Int -> Int -> Int
myMul 0 n = 0
myMul m n   | m>0 = n + myMul (m-1) n
            | otherwise = -n - myMul (m+1) (-n)

triNum :: Int -> Int
triNum 0 = 0
triNum n = n + triNum (n-1)

checkTriNum :: Int -> Bool
checkTriNum n = triNum n == n*(n+1)`div`2

myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

myAppend :: [a] -> [a] -> [a]
myAppend [] ys = ys
myAppend (x:xs) ys = x : myAppend xs ys

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myAppend (myReverse xs) [x]

myTake :: Int -> [a] -> [a]
myTake 0 (x:xs) = []
myTake n [] = []
myTake n (x:xs) = x : (myTake (n-1) xs)

myElem :: Eq a => a -> [a] -> Bool
myElem n [] = False
myElem n (x:xs) = x == n || myElem n xs

nth :: [a] -> Int -> a
nth (x:xs) 0 = x
nth (x:xs) i = nth xs (i-1)

linear :: Eq a => a -> [a] -> Int
linear a (x:xs) = search a (x:xs)
    where 
        search a [] = (-1 - len)
        search a (x:xs)   
            | x == a = 0
            | otherwise = 1 + search a xs

        len = myLength (x:xs)

{-
nth Complexity: O(n), in the worst case (index at the end), it iterates over the
entire list

linear Complexity: O(n) because in the worst case (element not in list) it 
iterates over the whole list

An improvement, if the list were sorted, could be to add a base case that the
searched-for element is greater than or less than the current x

Indexes into lists are less natural in Haskell than in Python because Haskell
typically operates on lists by splitting into head and tail at each recursion
frame, which doesn't maintain any information about the index with respect to
the entire original list. If you wanted to keep track of the index, you would
likely need an auxiliary function.
-}

evenElems :: [a] -> [a]
evenElems [] = []
evenElems (x:y:zs) = x : (evenElems zs)

oddElems :: [a] -> [a]
oddElems [] = []
oddElems (x:y:zs) = y : (oddElems zs)

interleave :: [a] -> [a] -> [a]
interleave [] ys = ys
interleave xs [] = xs
interleave (x:xs) (y:ys) = x : y : interleave xs ys

dedup :: Eq a => [a] -> [a]
dedup [] = []
dedup [x] = [x]
dedup (x:y:zs)  | x == y = dedup (y:zs)
                | otherwise = x : dedup (y:zs)

allPos :: (Ord a, Num a) => [a] -> Bool
allPos [] = True
allPos (x:xs) = x>0 && allPos xs

allOdd :: Integral a => [a] -> Bool
allOdd [] = True
allOdd (x:xs) = odd x && allOdd xs

has42 :: (Eq a, Num a) => [a] -> Bool
has42 [] = False
has42 (x:xs) = x == 42 || has42 xs

allHave42 :: (Eq a, Num a) => [[a]] -> Bool
allHave42 [] = True
allHave42 (x:xs) = has42 x && allHave42 xs

anyZero :: (Eq a, Num a) => [a] -> Bool
anyZero [] = False
anyZero (x:xs) = x == 0 || anyZero xs

anyPalindrome :: (Eq a, Num a) => [[a]] -> Bool
anyPalindrome [] = False
anyPalindrome (x:xs) = has42 x || anyPalindrome xs

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = reverse xs == xs

isPalindrome1 :: Eq a => [a] -> Bool
isPalindrome1 [] = True
isPalindrome1 [_] = True
isPalindrome1 xs = head xs == last xs && isPalindrome1 (tail (init xs))

isPalindrome2 :: Eq a => [a] -> Bool
isPalindrome2 [] = True
isPalindrome2 xs = head xs == last xs && isPalindrome2 (tail (init xs))

isPalindrome3 :: Eq a => [a] -> Bool
isPalindrome3 xs = right == reverse left where
    m = length xs `div` 2
    left = take m xs
    right = drop m xs

isPalindrome4 :: Eq a => [a] -> Bool
isPalindrome4 xs = right == reverse left where
    m = (length xs + 1) `div` 2
    left = take m xs
    right = drop m xs

isPalindrome5 :: Eq a => [a] -> Bool
isPalindrome5 [] = True
isPalindrome5 xs = right == reverse left where
    m = length xs `div` 2
    left = take m xs
    right = drop (length xs - m) xs

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] xs = True
isPrefixOf (x:xs) (y:ys) | x == y = isPrefixOf xs ys
                         | otherwise = False
 
numSubstr :: Eq a => [a] -> [a] -> Int
numSubstr [] ys = 1
numSubstr xs [] = 0
numSubstr xs (y:ys) | isPrefixOf xs (y:ys) = 1 + numSubstr xs ys
                    | otherwise = numSubstr xs ys