{-
Type classes let us:

- specify what operations can be used on things of a certain type
- let ys provide specific definitions of those operations for specific types when necessary
-}

data Expr = Number Int 
            | Sum Expr Expr 
            | Diff Expr Expr 
            | Prod Expr Expr
            | IfZero Expr Expr Expr
            | Var String
    deriving (Show, Eq)
type Env = [(String, Int)]

interp :: Env -> Expr -> Int

