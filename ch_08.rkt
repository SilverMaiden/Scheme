(define (square x)
  (* x x))
(define (vowel? x)
  (member? x '(a e i o u)))
(define (first-letters sent)
  (every first sent))
(define (g wd)
  (se (word 'with wd) 'you))

(define (ends-e? wd)
  (equal? (last wd) 'e))

(define (hyphenate word1 word2)
  (word word1 '– word2))
#| Boring Exercises
8.1 What does Scheme return as the value of each of the following expressions? Figure it out for yourself before you 
try it on the computer.
> (every last '(algebra purple spaghetti tomato gnu))
It will return the last letter of every word, (a e i o u).
> (keep number? '(one two three four))
It will return an empty set because there are no actual numbers in the sentence.
> (accumulate * '(6 7 13 0 9 42 17))
It will return the result of multiplying all the numbers in the sentence by each other.
> (member? 'h (keep vowel? '(t h r o a t)))
It will return #f because the keep vowel? procedure will result in it doing the member? procedure on the sentence
'(o a), and h is not a member of that sentence.
> (every square (keep even? '(87 4 7 12 0 5)))
It will return a sentence containing the squares of every even number in the input sentence.
> (accumulate word (keep vowel? (every first '(and i love her))))
It will return the word ai, because every first '(and i love her) will evaluate to '(a i l h), then (keep vowel?)
will apply to '(a i l h), and will evaluate to '(a i). After that, accumulate word will combine '(a i) into one 
word, 'ai.
> ((repeated square 0) 25)
It will return 25, because the second input is 0, which means that square will be applied 0 times.
> (every (repeated bl 2) '(good day sunshine))
It will return the sentence '(go d sunshi), because the every procedure will apply (repeated bl 2) to each individual
word in the sentence.

8.2 Fill in the blanks in the following Scheme interactions:
> (__________ vowel? 'birthday)       (every)
IA
> (________ first '(golden slumbers))  (every)
(G S)
> (________ '(golden slumbers))   (first)
GOLDEN
> (________ ________ '(little child))  (every last)
(E D)
> (________ ________ (________ ________ '(little child))) (from left to right) (accumulate word (every last))
ED
> (________ + '(2 3 4 5)) (every)
(2 3 4 5)
> (________ + '(2 3 4 5)) (accumulate)
14

8.3 Describe each of the following functions in English. Make sure to include a description of the domain and range of 
each function. Be as precise as possible; for example, "the argument must be a function of one numeric argument" is 
better than "the argument must be a function."
(define (f a)
 (keep even? a))

The funtion (f a) takes as input one argument, be it a sentence or a word, and calls the procedure (keep even? a))
which searches the sentence/word for even numbers and returns the even numbers. The sentence/word must contain only
numerical arguments for the funtion to work.

(define (g b)
 (every b '(blue jay way)))

The function (g b) takes as input one function which it will apply to every individual word in the sentence 
'(blue jay way) by using the every procedure. It will return the result in a sentence.

(define (h c d)
 (c (c d)))

The function (h c d) takes 3 inputs, the first being the name of the function, the second being a function, and 
the third being a variable that the function will be applied to. The same result could be reached by using the
repeated function as follows: 
(define (h c d)
  ((repeated c 2) d))

(define (i e)
 (/ (accumulate + e) (count e)))

The function (i e) takes as input either a word or a sentence made up of numerical arguments.
It applies the accumulate function to the input and adds together all the values within the sentence/word. 
The function then counts how many numbers are in the input argument, then proceeds to divide the result of the
accumulate function by the result of the count function. 

accumulate
sqrt
repeated



(repeated sqrt 3)
(repeated even? 2)
(repeated first 2)
(repeated (repeated bf 3) 2)