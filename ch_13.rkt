(define (downup wd)
  (if (= (count wd) 1)
      (se wd)
      (se wd (downup (bl wd)) wd)))


(trace downup)
(downup 'trace)

#| Boring Exercises
13.1 Trace the explode procedure from page 183 and invoke (explode 'ape)
How many recursive calls were there? What were the arguments to each 
recursive call? Turn in a transcript showing the trace listing. |#

(define (explode wd)
  (if (equal? (count wd) 0)
      '()
      (se (first wd)
          (explode (bf wd)))))

(trace explode)
(explode 'blah)

#| There were 4 recursive calls. The arguments were 'blah, 'lah, 'ah, and 'h.
 >(explode 'blah)
recursive call
> (explode 'lah)
recursive call
> >(explode 'ah)
recursive call
> > (explode 'h)
recursive call
> > >(explode "")
hand back
< < <'()
handback 
< < '(h)
handback
< <'(a h)
handback
< '(l a h)
handback
<'(b l a h)

13.2 How many pigl-specialist little people are involved in evaluating the 
following expression? 
(pigl 'throughout) 
What are their arguments and return values, and to whom does each give her result?
|#
(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (butfirst wd) (first wd)))))

(trace pigl)
(pigl 'throughout)

#| pigl has 9 small people.  
alpha does define (x)
bravo does (pigl wd)
charlie does if (x)
delta does (member? x 'aeioy)
echo does (first wd)
foxtrot does (word wd 'ay)
golf does (pigl (x))
hotel does (word x y)
india does (bf wd)
juliet does (first wd)



Juliet and india report to hotel. Hotel reports to golf. 
Foxtrot and echo report to delta. Delta reports to charlie.
Charlie reports to bravo. Bravo reports to alpha.





13.3 Here is our first version of downup from Chapter 11. It doesn't work because 
it has no base case.
(define (downup wd)
  (se wd (downup (bl wd)) wd))
> (downup 'toe)
ERROR: Invalid argument to BUTLAST: ""

Explain what goes wrong to generate that error. In particular, why does 
Scheme try to take the butlast of an empty word?


It is a recursive procedure, which needs a correct base case or else it will loop forever.


13.4 Here is a Scheme procedure that never finishes its job: |#
(define (forever n)
  (if (= n 0)
      1
      (+ 1 (forever n))))
#| Explain why it doesn't give any result. (If you try to trace it, make sure you 
know how to make your version of Scheme stop what it's doing and give you another prompt.)

It won't give any result because it will run forever, since there isn't a proper base case 
to stop it. Unless the first input for forever is 0, there is no way that  (forever n) can 
result in 0, since the procedure will always add 1 to (forever n).


|#
(trace forever)
(forever 1)


#| Real Exercises
13.5 It may seem strange that there is one little person per invocation of a procedure, 
instead of just one little person per procedure. For certain problems, the 
person-per-procedure model would work fine. Consider, for example, this 
invocation of pigl:
> (pigl 'prawn)
AWNPRAY
Suppose there were only one pigl specialist in the computer, named Patricia. 
Alonzo hires Patricia and gives her the argument prawn. She sees that it 
doesn't begin with a vowel, so she moves the first letter to the end, 
gets rawnp, and tries to pigl that. Again, it doesn't begin with a vowel, 
so she moves another letter to the end and gets awnpr. That does begin 
with a vowel, so she adds an ay, returning awnpray to Alonzo.
Nevertheless, this revised little-people model doesn't always work. 
Show how it fails to explain what happens in the evaluation of
(downup 'smile)




