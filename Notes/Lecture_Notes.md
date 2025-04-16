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
##### Lecture 5 - April 9, 2025
- Adding Code (lecture05.lc)
- In Elsa:
    - =~>
    Will try to reduce all the way to normal form
    - =*>
    Checks if there is a way to get to a certain point or something 
$~$
- Variable Scope
    - A **binding** is an association of a name to some entity
        - (name, entity)
    - The **scope** of a binding in a program is the part of the program where the name can be used to refer to the entity
    $~$
    - \x $\rightarrow$ e
        - "e" : is the scope of the binding from the formal parameter x, to whatever argument is passed to this function when called

        - In \x $\rightarrow$ e, we say that any occurrence of x in e is bound by \x
    $~$
    - /x $\rightarrow$ **x**
    - /x $\rightarrow$ (\y $\rightarrow$ **x**)
        - bound occurrences of **x**
    $~$
    - An occurrence of a variable is **free** if it's not bound
        - x y $\leftarrow$ x and y occur free
        - \y $\rightarrow$ x y $\leftarrow$ x occurs free, but y occurs bound
        $~$
        - (\x y $\rightarrow$ y) x $\leftarrow$ x occurs free, but y occurs bound
        - (\x y $\rightarrow$ x y) x $\leftarrow$ x occurs both free and bound, y occurs bound
    $~$
- e := x | x $\rightarrow$ e | $e_1$ $e_2$

What variables occur free in a lambda calc expression?
$~$
Let $FV(e)$ the set of variables that occur free in $e$.

- FV( x ) \ { x }
- FV (\x $\rightarrow$ e) = FV( e ) ***-*** { x }
    - " ***-*** " : set difference
- FV( $e_1$ $e_2$) = FV( $e_1$ ) U FV( $e_2$ )
$~$

- An expression that has no free variables is ***closed***
- A closed expression is also known as a ***combinator***
    - e.g. \x $\rightarrow$ x is a cobinator
$~$
- Revisiting the $\beta$-rule
    - (\x $\rightarrow$ $e_1$) $e_2$ $\rightarrow$$_\beta$ $e_1$[x := $e_2$]
        - $e_1$, but with ***free*** occurrences of x replaced with $e_2$
    $~$

    Examples:
    - (\x $\rightarrow$ (\x $\rightarrow$ x)) y
        - (\x $\rightarrow$ x) renamed to \z $\rightarrow$ z

    But what about this?
    - (\x $\rightarrow$ (\y $\rightarrow$) x ) y
     ~~=b> \y $\rightarrow$ y~~ ; wrong because y occurred free in the ***arugment***
    It got ***captured*** by the \y binder in the body of the function
    $~$
    - So what we *really* want:
    $e_1 [x := e_2]$ (the substitution operation)
    to mean is:
        - $e_1$ but with all free occurrences of x replaced by $e_2$ **as long as** no variables that occur free in $e_2$ get captured by binders in $e_1$
        - and if any variables would get captured, the substitution operation is **undefined**!
        $\rightarrow$ means that if we want to do substitution but it would cause variable capture, we need to **rename** (with " =a> " in Elsa) formal parameters first

##### Lecture 6 - April 11, 2025
- Capture-Avoiding Substitution
    - (\x $\rightarrow$ $e_1$) $\rightarrow$ $_\beta$ $e_1$[x := $e_2$] 
        - $e_1$[x := $e_2$] : How to define this so it avoids variable capture?
        - Recall the grammer of lambda calc:
        e:=x | \x $\rightarrow$ e | $e_1 e_2$
    - What might $e_1$ be in $e_1$[x := $e_2$]?
        - If $e_1$ is a variable and it's the same as the formal parameter in the binder (that is, $e_1$ == x)
        x[x := $e_2$] = $e_2$
        - If $e_1$ is a variable and it's NOT the same as the formal parameter in the binder (that is $e_1$ == y where y != x)
        y[x := $e_2$] = y
        $~$
        - If $e_1$ is an application $e' e''$
        ($e'$ $e''$)[x := $e_2$] =
        $e'$ [x := $e_2$]  $e''$ [x := $e_2$]
        $~$
        - If $e_1$ is a function with x as its formal parameter
        $e_1$ == \x $\rightarrow$ $e'$
        (\x $\rightarrow$ $e'$)[x := $e_2$] = (\x $\rightarrow$ $e'$)
        - If $e_1$ is a function with something else other than x as its formal parameter
        ($e_1$ == \y $\rightarrow$ $e'$ where y != x)
        (\y $\rightarrow$ $e'$) [x := $e_2$]
            - If y is not the FV($e_2$):
                (\y $\rightarrow$ $e'$) [x := $e_2$] = 
                \y $\rightarrow$ $e'$ [x := $e_2$]
            - If y **IS** in FV($e_2$):
                - Substitution is undefined and we have to do a renaming step before we can do substitution

        $~$
        (\x $\rightarrow$ (\y $\rightarrow$ x)) y
        $\rightarrow$$_\beta$ \y $\rightarrow$ y $~~~~~~~$ *could be wrong*
        $~$
        (\x $\rightarrow$ (\y $\rightarrow$ x))
        =a> (\x $\rightarrow$ (\z $\rightarrow$ x))
        - Known as an $\alpha$-step, or $\alpha$-renmaing
        $~$
        \x $\rightarrow$ x $~~~~$ \y $\rightarrow$ y
        - These are $\alpha$-equivalent!

        Example in (lecture06.lc)

###### New Topic :P
Returning to our exervise of encoding useful things in lambda calculus
- **Pairs** ! (aka two-element tuple)
    - What would we want to do with a pair?
        - Access the first element
        - Access the second element
        - Take two things and construct a pair
    - Example in (lecture06.lc)

##### Lecture 7 - April 14, 2025

- (lecture07.lc)

##### Lecture 8 - April 16, 2025
```haskell
--In ghci

3 + 4
7

(+) 3 4
7 

div 10 5
3

10 'div' 5
2

10 'mod' 5
0

10 'mod' 6
4

mod 10 5
0

mod 10 5
4

[] -- Empty list constructor
[]

1:2:3:4:[]
[1, 2, 3, 4]

[1, 2, 3, 4]
[1, 2, 3, 4]

1:[2, 3, 4]
[1, 2, 3, 4]

"raibow":["sprinkles"]
["rainbow", "sprinkles"]

"rainbow":"sprinkles":[]
["rainbow", "sprinkles"]

"rainbow":("sprinkles":[])
["rainbow", "sprinkles"]

(:) "rainbow" ((:) "sprinkles" [])
["rainbow", "sprinkles"]

```
- (lecture08.hs)

    



