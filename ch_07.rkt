#| Boring Exercises
7.1 The following procedure does some redundant computation.
(define (gertrude wd)
 (se (if (vowel? (first wd)) 'an 'a)
 wd
 'is
 (if (vowel? (first wd)) 'an 'a)
 wd
 'is
 (if (vowel? (first wd)) 'an 'a)
 wd))
> (gertrude 'rose)
(A ROSE IS A ROSE IS A ROSE)
> (gertrude 'iguana)
(AN IGUANA IS AN IGUANA IS AN IGUANA)
Use let to avoid the redundant work.
|#

(define (vowel? x)
  (member? x '(a e i o u)))

(define (gertrude wd)
  (let ((an-or-a (if (vowel? (first wd))
                     'an
                     'a)))
    (se an-or-a wd 'is
        an-or-a wd 'is 
        an-or-a wd)))

#| 7.2 Put in the missing parentheses:
> (let pi 3.14159
 pie 'lemon meringue
 se 'pi is pi 'but pie is pie)
 (PI IS 3.14159 BUT PIE IS LEMON MERINGUE)
|#

(let ((pi (+ 0 3.14159))
  (pie '(lemon meringue)))
  (se '(pi is) pi '(but pie is) pie))

#| Real Exercises
7.3 The following program doesn't work. Why not? Fix it.

(define (superlative adjective word)
 (se (word adjective 'est) word))

It's supposed to work like this:
> (superlative 'dumb 'exercise)
(DUMBEST EXERCISE)

'word' is being used as a variable in the input, so the procedure is substituting in the variable 'word' into 
wherever 'word' is present, and replacing the procedure 'word' with the variable. This can be fixed by changing the
name of the second input variable from word to wd, or anything else.

My answer:
|#

(define (superlative adjective wd)
 (se (word adjective 'est) wd))

#| 7.4 What does this procedure do? Explain how it manages to work.
|#(define (sum-square a b)
    (let ((+ *)
          (* +))
      (* (+ a a) (+ b b))))
#| It makes the value of + to the value of * and vice versa, now using the plus sign to multiply and the multiply 
sign to add in the procedure. When it evaluates (+ a a) it will multiply a by itself, (+ b b) will multiply b by 
itself, and (* (+ a a) (+ b b)) will add the square of a to the square of b.