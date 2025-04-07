## CSE114 Lecture Notes 2025
---
##### Lecture 1 - March 31, 2025
- Syllabus 😛 
$~$
##### Lecture 2 - April 2, 2025
- What is PL?
    - What do PL People do? [Inspired by Mike Hicks]
        - Consider the **Programming Language** to have a central place in solving computing problems
        - Consider software behavior in a rigorous and general way

    $~$

- **Lambda [Calculus]** $\rightarrow$ a system of reasoning
    - Everything is a function
    - Invented in 1936 (Alonzo Church)
        - Same year as Turning Machines
$~$
    - The simlest function:
        - The Identity Function : Takes an input and outputes the input
        $~$
        - On Paper:
            - $\lambda$x.x
                - "$\lambda$x" *: the binder*
                    - "x" *: the formal parameter*
                - " . " *: just a delimiter*
                - "x" *: function body*
                $~$
        - Elsa Syntax:
            - \x $\rightarrow$ x 
            $~$

        - Python Syntax:
            ```python
            lambda x : x
                    or
            def identity(x):
                return x
            ```
        
        - What about this?
        $\lambda$z . ($\lambda$x . x)
        \z $\rightarrow$ (\x $\rightarrow$ x)
            - This takes in an argument, ignores it, and returns a function (in this case; the identity function)
            $~$
        - Calling Functions:
            ~~~
            > identity(3)
            3
            ~~~
            ~~~
            > (lambda x : x)(3)
            3
            ~~~
        $~$

        - In **Lambda Calculus**, we don't put "( )" around the argument in a function call
            - \x $\rightarrow$ x "rainbow"
            *This would be a function whose body is* [ x "rainbow" ]
        $~$
        - \f $\rightarrow$ f(\x $\rightarrow$ x)
            - Function that takes a function, and applies it to the identity function
        $~$
        - (\f $\rightarrow$ f(\x $\rightarrow$ x)) \y $\rightarrow$ y
            
            (\f $\rightarrow$ f(\x $\rightarrow$ x)) *: The function we are calling*
            \y $\rightarrow$ y *: Argument*

            $~$

            This plugs in the argument in place of occurrences of the formal paramter in the function body
            - We get:
            (\y $\rightarrow$ y) (\x $\rightarrow$ x)
            - Steps to: \x $\rightarrow$ x
        $~$
        - The **Subsitution Rule** ($\beta$ rule)
            - (\x $\rightarrow$ $e_1$) $e_2 \rightarrow \beta e_1[x := e_2]$
                - $\beta e_1[x := e_2]$ : $e_1$ but w/ occurrences of x replaced by $e_2$
            $~$
            - \x $\rightarrow$ (\y $\rightarrow$ x)
                - Takes in arguments x and y, then returns x
                - (\x $\rightarrow$ (\y $\rightarrow$ x)) 5
                    - $\rightarrow$ $\beta$ \y $\rightarrow$ 5
   
##### Lecture 3 - April 4, 2025

- From last time: The $\beta$-rule
    - (\x $\rightarrow$ $e_1$) $e_2$ $\rightarrow$ $_\beta$ $e_1$[x := $e_2$]
        - $e_1$ but with occurrences of x replaced by $e_2$
        - (\x $\rightarrow$ $e_1$) $e_2$ : *reducible expression or "redux"*
$~$
- ( (\x $\rightarrow$ (\y $\rightarrow$ x) ) 5) 6
As shorthand for : \x $\rightarrow$ (\y $\rightarrow$ x)
we can instead write : \x y $\rightarrow$ x
$~$
As short hand for:
( (\x $\rightarrow$ (\y $\rightarrow$ x) ) 5) 6
We can just write
( (\x y $\rightarrow$ x) 5) 6
Which can be further shortened to:
(\x y $\rightarrow$ x) 5 6 (Remove extra "( )")

- A more general way of saying this is:
    - Function application is **Left-Associative**, i.e,
    f  g  x means:
    - Apply f to g, then apply the result of *that* to x.
    - In other words
        - f g x is shorthand for
        (f g) x
    $~$
    - If we want to apply  to x and then apply f to the result, we would write
        - f (g x)
    $~$
- Learning Elsa ( lecture03.lc )

##### Lecture 4 - April 7, 2025
- Grammer of Lambda Calculus
    - e ::= x
        - x : variables

    - \x $\rightarrow$ e
        - Function definitions, aka Lambda abstractions
    
    - $e_1$ $e_2$
        - Function calls, aka function applications
$~$
- Notational Conventions
    - The body of a lambda abstractions extends as far right as possible
    \x $\rightarrow$ m n
        - means \x $\rightarrow$ (m n)
        - NOT (\x $\rightarrow$ m) n
    $~$
    - Function application is left-associative:
    $a~b~c$
        - means $(a~b)~c$
        - NOT $a~(b~c)$
    $~$
    - Instead of
    \x $\rightarrow$ (\y $\rightarrow$ (\z $\rightarrow$ e))
    We can just write:
    \x $\rightarrow$ \y $\rightarrow$ \z $\rightarrow$ e
    and we can simplify that to
    \x y z $\rightarrow$ e
    $~$
    Putting this all together:
    instead of
    (((\x $\rightarrow$ (\y $\rightarrow$ (\z $\rightarrow$ z))) q) r) s
    We can just write
    (\x y z $\rightarrow$ z) q r s
    $~$
    - A **redux** (reducible expression) is anything you can apply the $\beta$-rule to.
    - A lambda calculus expression in **normal form** is one that has no redexes
    $~$
    Example:
        - (\x y $\rightarrow$ (\z $\rightarrow$ z) x) rainbow sprinkles
        =b> (\x y $\rightarrow$ x) rainbow sprinkles
        =b> (\y $\rightarrow$ rainbow) sprinkles
        =b> rainbow
        *Expression is now in normal form*
        - Or:
        =b> (\y $\rightarrow$ (\z $\rightarrow$ z) rainbow) sprinkles
        =b> (\z $\rightarrow$ z)rainbow
        =b> rainbow
    - ***Church-Rosser Theorem!***
$~$
- More Learning Elsa (lecture04.lc)    
$~$
##### Lecture 5    



