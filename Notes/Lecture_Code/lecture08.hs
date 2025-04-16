message::String
message = "Welcome to lecture 8!"

{-
Agenda:

- First steps with Haskell
- Working with lists
- Writing functions with patter matching
- If time: pattern guards
- If time: intro to polymorphic types

-}

-- Let's translate this to Haskell
-- TRI = \n -> ITE(ISZ n)
--            ZERO
--           (ADD n (TRI (DECUR n))

-- Correct but non-diomatic, version of 'tri'
tri :: Integer -> Integer
tri = \n -> if (n == 0)
                then 0

                else (n + tri(n-1))


-- Slightly more idiomatic:
tri :: Integer -> Integer
tri = if (n == 0)
        then 0

        else (n + tri(n-1))

-- Actually idiomatic: use pattern matching
tri'' :: Int -> Int
tri'' 0 = 0
tri '' n = n + tri'' (n - 1)

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

--Our version of the build-in append function, '(++)'
append :: [a] -> [a] -> [a]
append [] xs = xs
append (y:ys) xs = y : append ys xs

duplicateAll :: [b] -> [b]
duplicateAll [] = []
duplicateAll (x:xs) = x : x : duplicateAll xs

