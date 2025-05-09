message = "Welcome to lecture 16"

-- Not tail-recursive: The call 'ourFoldr' is not in tail position
ourFoldr :: (a -> b -> b) b -> [a] -> b 
ourFoldr f base [] = base
ourFoldr f base (x:xs) = f x (ourFoldr f base xs)

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

sum'' :: [Int] -> Int
sum'' xs = ourFoldr (+) 0 xs

{-
sum'' [1,2,3,4]
foldr (+) 0 [1,2,3,4]
1 + (foldr (+) 0 [2,3,4])
1 + (2 + (foldr (+) [3,4]))
1 + (2 + (3 + (foldr (+) 0 [4])))
1 + (2 + (3 + (4 + (foldr(+) 0 []))))
1 + (2 + (3 + (4 + 0)))
1 + (2 + (3 + 4))
1 + (2 + 7)
1 + 9
10

Foldr is NOT tail recursive
Foldl IS tail recursive
-}

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs
-- How would we do this tail recursively?

sumTR :: [Int] -> Int
sumTR xs = helper 0 xs
    where helper :: Int -> [Int] -> Int
        helper acc [] = acc
        helper acc (x:xs) = helper (x + acc) xs

-- Here's foldl, a tail-recusrisve alternative to foldr:
ourFoldl :: (b -> a -> b) -> b -> [a] -> b 
ourFoldl f acc [] = acc
ourFoldl f acc (x:xs) = foldl f (f acc x) xs

sumTR' :: [Int] -> Int
sumTR' xs = ourFoldl (+) 0 xs
{-
SumTR' [1,2,3,4]
ourFoldl (+) 0 [1,2,3,4]
ourFoldl (+) (0 + 1) [2, 3, 4]
ourFoldl (+) ((0 + 1) + 2) [3,4]
ourFoldl (+) (((0 + 1) + 2) + 3) [4]
ourFoldl (+) ((((0 + 1) + 2) + 3) + 4) []
ourFoldl (+) ((((1) + 2) + 3) + 4)
ourFoldl (+) (((3) + 3) + 4)
ourFoldl (+) ((6) + 4)
ourFoldl (+) 10
-}

{-
Addition and string concatenation are associative.

But subtraction isn't! Recommended to not use fold with non associative operations cuz it can be poop

-}