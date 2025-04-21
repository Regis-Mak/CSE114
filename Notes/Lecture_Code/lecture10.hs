-- Welcome to lecture 10!

-- CSE114A pets database

-- We can define a type using the 'data' keyword:

-- name, owner, type of animal, age
-- 'PetRecord' is the data type
-- 'PetRec' is the data constructor for the data type PetRecord
-- FOr data of type PetREcord

data PetRecord = PetRec String String String PetAge
    deriving Show

{-
'PetRecord's are *product types*.
Something of type PetRecord is in some sense
an element of the set:
String x String x String x Int

'PetAge' is a *sum type* 
Sum types are great for choosing among options

Think of lists. A list can be:

- an empty list
- an element, together with a list

-}

--Combining all three concepts:
-- Let's define out type for lists of strings
-- This is a recursive type -- it refers it itself!
data StringList = Empty | Nonempty String StringList

data PetAge = IntAge Int | UnknownAge
    deriving Show

database :: [PetRecord]
database = [PetRec "rainbow" "lindsey" "cat" (IntAge 3),
            PetRec "sprinkles" "lindsey" "cat" (IntAge 4),
            PetRec "nympha" "aj" "cat" (IntAge 13),
            PetRec "larry" "harinand" "cat" (IntAge 4),
            PetRec "bewie" "tori" "cat" (IntAge UnknownAge),
            PetRec "walter" "tori" "cat" (IntAge UnknownAge)]

-- Take a pets database and owner's name, 
-- and returns a list of their pets
-- showing off a 'where' clause and multiple patter guards
getPetsByOwner :: [PetRecord] -> String -> [String]
getPetsByOwner [] _ = []
getPetsByOwner (PetRec n o _ _ : xs) owner | same o owner = name : rest
                                           | otherwise = rest

    where rest getPetsByOwner xs owener
        same :: String -> String -> Bool
        same s s' = s == s'

-- In the long run, we want to represent programs as trees
-- What about arithmetic expressions like '3 + 4'?
-- or (3 + 4) - 5, or (3 + 4) * (2 - (1 * 6))?

data Expr = Number Int 
            | Sum Expr Expr 
            | Diff Expr Expr 
            | Prod Expr Expr

-- 3 + 4
expr1 :: Expr
expr1 = Sum (Number 3) (Number 4)

-- (3 + 4) - 5
expr2 :: Expr
expr2 = Diff (Sum (Number 3) (Number 4)) (Number 5)

-- (3 + 4) - 5, or (3 + 4) * (2 - (1 * 6))
expr3 :: Expr
exper3 = Prod expr1 (Diff (Number 2) (Prod (Number 1) (Number 6)))
-- This is an AST (abstract syntax tree)