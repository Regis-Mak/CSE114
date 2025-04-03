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

            - In **Lambda Calculus**, we don't put ( ) around the argument in a function call
                - \x $\rightarrow$ x "rainbow"
                *This would be a function whose body is [ x "rainbow" ]*
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
   
#### Lecture 3 - April 4, 2025

- 




