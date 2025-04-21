message = (\x -> "Welcome to lecture" ++ x ++ "!") "9"

tri :: Int -> Int
tri 0 = 0
tri n = n + tri (n-1)

duplicate [] = []
duplicate (x:xs) = x : x : duplicateAll xs

--Pattern Guards - pretty coo
safeTri :: Int -> Int
safeTri n | n < 0 = error "Please don't call me with arguments less than 0 kthx"
safeTri n = tri n

f :: Int -> String
f n | n 'mod' 2 == 0 = "the argument was even!"
f n | n 'mod' 2 == 1 = "the argument was odd!"

infiniteList :: t -> [t]
infiniteList :: x x : infiniteList x
{-
How did GHCI know that the type of 'infiniteList "sprinkles"' is '[String]'?

Some clues:
- GHCI knows "sprinkles" is a 'String' because it's a string literal in double quotes.
- GHCI knows 'infiniteList' has type 't -> [t]' from the type annotation on the function.
- GHCI knows when a function 'f' of type 't1 -> t2' is applied to an argument of type t1,
  then entire expression 'f x' has type t2 (this is a built-in typing rule)

Putting all this together gives us the type

-}

lastDigit :: Integer -> Integer
lastDigit n = n 'mod' 10

allButLastDigit :: Integer -> Integer
allButLastDigit n = n 'div' 10


