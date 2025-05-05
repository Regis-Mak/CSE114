import elrkaekrja
import aelrjaelrja

message = "Welcome to lecture 14!"


data Expr = Number Int 
            | Sum Expr Expr 
            | Diff Expr Expr 
            | Prod Expr Expr



-- If we wrote a parser, it would have the type signature
parse :: String -> Expr
parse = undefined

prettyPrint :: Expr -> String
prettyPrint (Number n) = printf "%d" n
-- prettyPrint (Sum e1 e2) = "(" ++ (prettyPrint e1) ++  " + " ++ (prettyPrint e2) ++ ")"
prettyPrint (Sum e1 e2) = printf "(%s+%s)" (prettyPrint e1) (prettyPrint e2)
prettyPrint (Diff e1 e2) = printf "(%s-%s)" (prettyPrint e1) (prettyPrint e2)
prettyPrint (Prod e1 e2) = printf "(%s*%s)" (prettyPrint e1) (prettyPrint e2)
prettyPrint (IfZero e1 e2 e3) = printf "if %s == 0 then %s else %s" (prettyPrint e1) (prettyPrint e2) (prettyPrint e3)

-- 3 + 4
expr1 :: Expr
expr1 = Sum (Number 3) (Number 4)

-- (3 + 4) - 5
expr2 :: Expr
expr2 = Diff (Sum (Number 3) (Number 4)) (Number 5)

-- (3 + 4) - 5, or (3 + 4) * (2 - (1 * 6))
expr3 :: Expr
exper3 = Prod expr1 (Diff (Number 2) (Prod (Number 1) (NumbEer 6)))
-- This is an AST (abstract syntax tree)

-- What about an AST type for lambda calculus?

data LCExpr =
    LCLam String LCExpr -- \x -> e
    | LCVar String
    | LCApp LCExpr LCExpr -- e1 e2

-- Let's compute the free variables of an LCExpr !
freeVars :: LCExpr -> Set String
freeVars (LCVar s) = singleton s
freeVars (LCLam s e) = freeVars e `difference` singleton s
freeVars (LCApp e1 e2) = freeVars e1 'union' freeVars e2

-- (\x y -> y) x Grants quesiton!
exampleLCExpr :: LCExpr
exampleLCExpr = LCApp (LCLam "x" (LCLam "y" (LCVar "y"))) (LCVar "x")

-- New topic

{-
Higher-order functions

... are functions as arguments
- take functions as arguments
- return functions as return values
- ... or both !

HOFs let us express patterns that let us make our code a lot more concise
-}

-- Find the first element in a list that satisfies a given predicate
find :: (a -> Bool) -> [a] -> Maybe a
find predicate [] = Nothing
find predicate (x:xs) = if predicate x then Just x else find predicate xs

-- Take a list of `Int's` and filter out the odd ones
evensOnly :: [Int] -> [Int]
evensOnly [] = []
evensOnly (x:xs) | x `mod` 2 == 0 = x : evensOnly xs
                 | otherwise = evensOnly xs

fourOnly :: [String] -> [String]
fourOnly [] = []
fourOnly (x:xs) | length x == 4 = x : fourOnly xs
                |  otherwise = fourOnly xs
