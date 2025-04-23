message = (\n -> "Welcome to lecture " ++ n ++ "!") "11"

data PetRecord = PetRec String String String PetAge
    deriving Show

data PetAge = IntAge Int | UnknownAge
    deriving Show

database :: [PetRecord]
database = [NonEmpty (PetRec "rainbow" "lindsey" "cat" (IntAge 3)),
                NonEmpty (PetRec "sprinkles" "lindsey" "cat" (IntAge 4)),
                    NonEmpty (PetRec "nympha" "aj" "cat" (IntAge 13)),
                        NonEmpty (PetRec "larry" "harinand" "cat" (IntAge 4)),
                            NonEmpty (PetRec "bewie" "tori" "cat" (IntAge UnknownAge)),
                                NonEmpty (PetRec "walter" "tori" "cat" (IntAge UnknownAge))]

data PetDB = Empty | NonEmpty PetRecord PetDB

-- Take a pets database and owner's name, 
-- and returns a list of their pets
-- showing off a 'where' clause and multiple patter guards
getPetsByOwner :: PetDB -> String -> String
getPetsByOwner Empty _ = []
getPetsByOwner (NonEmpty (PetRecord name owner _ _) rest) ownerName = 
    if owner == ownerName then name : recOfDB else recOfDB
    where recOfDB = getPetsByOwner rest ownerName

-- The (abstract) syntax
data Expr = Number Int 
            | Sum Expr Expr 
            | Diff Expr Expr 
            | Prod Expr Expr
            | IfZero Expr Expr Expr
    deriving Show

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

-- The semantics of our language
-- Semantics: what programs *mean*
interp :: Expr -> Int
interp (Number n) = n
interp (Sum e1 e2) = interp e1 + interp e2
interp (Diff e1 e2) = interp e1 - interp e2
interp (Prod e1 e2) = interp e1 * interp e2
interp (IfZero e1 e2 e3) = if interp e1 == 0 then interp e2 else interp e3
