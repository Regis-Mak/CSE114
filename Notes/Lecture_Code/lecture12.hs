{-#LANGUAGE BangPatterns#-}

message = "Welcome to lecture 12!"

len :: [a] -> Int
len [] = 0
len (_:rest) = len rest + 1

-- ghci> :set +s
-- gets running time of code

len' :: [a] -> Int
len' ls = len'' ls 0
    where len'' :: [a] -> a -> Int
    len'' [] !acc = acc
    len'' (_:rest) !acc = len' rest (acc + 1)

-- Laziness is both friend and foe
-- Here's an example where it's good:
-- Take a list and return the fith element
fifth :: [a] -> a
fifth (_:_:_:_:x:_) = x -- Matches any list of 5 or more elements
fifth _ =  error "no fifth element"

-- The maybe type

-- data Maybe a = Nothing | Just a

-- Fun fact: maybe in Haskell is the same as Option in Rust

-- Take a predicate and an argument,
-- and apply the predicate to the argument,
-- returning the result

applyPredicate :: (a -> Bool) -> a -> Bool
applyPredicate pred a = pred a