message = "Welcome to lecture 15!"

{-
Agenda:
    - Higher order functions: 'map' (again), 'foldr', 'foldl' (if time)
    - HW1 Comments
-}

-- Take a list of `Int's` and square them
square :: [Int] -> [Int]
square [] = []
square (x:xs) = x*x : square xs

-- Take a list of `Int's` and produce a list of `Bool`s that say whether each `Int` is divisible by 3
divisibileBy3 :: [Int] -> [Bool]
divisibileBy3 [] = []
divisibileBy3 (x:xs) = (x 'mod' 3 == 0) : divisibileBy3 xs

-- Take a list of predicates, apply them all to the string "rainbow", 
-- and return ta list of the results
applyAllPreds :: [String -> Bool] -> [Bool]
applyAllPreds :: [] = []
applyAllPreds (f:fs) = f "rainbow" : applyAllPreds fs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f(x:xs) = f x : map' f xs

-- Let's write all the above functions with 'map' instead!
square' :: [Int] -> [Int]
square' xs = map' (\x -> x * x)  xs

divisibileBy3' :: [Int] -> [Bool]
divisibileBy3'xs = map' divisibileBy3' (\x -> x `mod` 3 == 0) xs

applyAllPreds' :: [String -> Bool] -> [Bool]
applyAllPreds' fs = map' (\f -> f "rainbow") fs


-------------------------------------------------
-- Take a list of ints and return their sum
sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- Take a list of strings and concatenate then
concat' :: [String] -> String
concat' [] = ""
concat' (x:xs) = x ++ concat' xs

-- Take a list of lists and return their total length
lengthAll :: [[a]] -> Int
lengthAll [] = 0
lengthAll (x:xs) = length x + lengthAll xs

{-
What's the same about all of these?

- They all take a list, but the lists are of different types
- They all have a base case, where thers some sort of base value we want to return
- They all make a recursive call on the tail of the list
- They all combine the result of the recursive call with something,
but they all do it in different ways

To generalize this into a pattern that will encompass all the above . . .

- a  polymorphic list argument, so something of type '[a]'
- something to return in base case, which might not be the same type as the elemnts of the list.
  call it 'b'
- a function that does the combining. This function will take two arguments:
    - one will be an element of the provided list, so it has type 'a'
    - and one will be the result of a recursive call, so it has type 'b'
    - and we should get back something of type 'b', b/c that's what we need to return
-}

ourFoldr :: (a -> b -> b) b -> [a] -> b 
ourFoldr f base [] = base
ourFoldr f base (x:xs) = f x (ourFoldr f base xs)

-- Can we write sum' as a one-liner using ourFoldr?
sum'' :: [Int] -> Int
sum'' xs = ourFoldr (+) 0 xs

concat'' :: [String] -> String
concat'' xs = ourFoldr (++) "" xs

lengthAll' :: [[a]] -> Int
lengthAll' 