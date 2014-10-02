;example

#|
multi line
comments
|#
;this is a one line comment

(define (greet name)
    (if (equal? (first name) 'professor)
        (se '(i hope i am not bothering you) 'professor (last name))
        (se '(good to see you) (first name))))

(define (divisible? big little)
  (= (remainder big little) 0))
(define (buzz num)
  (if (or (divisble? num 7) (member? 7 num))
      'buzz
      num))
#|
(define (num–divisible–by–4? x)
 (and (number? x) (divisible? x 4)))
|#
(define (num–divisible–by–4? x)
 (and (number? x) (divisible? x 4)))
#| #T isn't the only true value. In fact, every value is considered true except for #f.
|#

(define (integer-quotient big little)
  (if (divisible? big little)
      (/ big little)
      #f))
; if big is divisible by little, return big/little, else return #f

(define (roman-value letter)
 (cond ((equal? letter 'i) 1)
 ((equal? letter 'v) 5)
 ((equal? letter 'x) 10)
 ((equal? letter 'l) 50)
 ((equal? letter 'c) 100)
 ((equal? letter 'd) 500)
 ((equal? letter 'm) 1000)
 (else 'huh?)))

(define (truefalse value)
 (cond (value 'true)
 (else 'false)))

;Boring Exercises:

#| 6.1 What values are printed when you type these expressions to Scheme? (Figure it out in your head before you try it 
on the computer.)
(cond ((= 3 4) '(this boy))
 ((< 2 5) '(nowhere man))
 (else '(two of us)))

This expression will return '(nowhere man) because (= 3 4) is false, and (< 2 5) is true.

(cond (empty? 3)
 (square 7)
 (else 9))

Will return square 7.(incorrect)
Not sure, will ask about later.

(define (third–person–singular verb)
 (cond ((equal? verb 'be) 'is)
 ((equal? (last verb) 'o) (word verb 'es))
 (else (word verb 's)))

(third–person–singular 'go) 
Returns 'goes ::Correct

|#
(define (third-person-singular verb)
  (cond ((equal? verb 'be) 'is)
        ((equal? (last verb) 'o) (word verb 'es))
        (else (word verb 's))))

#| 6.2 What values are printed when you type these expressions to Scheme? (Figure it out in your head before you try it 
on the computer.)
(or #f #f #f #t)
(and #f #f #f #t)
(or (= 2 3) (= 4 3))
(not #f)
(or (not (= 2 3)) (= 4 3))
(or (and (= 2 3) (= 3 3)) (and (< 2 3) (< 3 4)))

1. It will return #t because the or function returns #t for even one #t
2. It will return #f because the and funtion will return #f if there is even one #f
3 #f because neither is true
4. If it isn't #f it's #t.
5. It will return #t because out of (not (= 2 3)) and (= 4 3), one of the values is true.
6. It will return #t because out of the values, one is true (and (< 2 3) (< 3 4))

6.3  Rewrite the following procedure using a cond instead of the ifs:

(define (sign number)
  (if (< number 0)
      'negative
      (if (= number 0)
          'zero
          'positive)))
My Answer:
|#
(define (sign number)
  (cond ((< number 0) 'negative)
        ((= number 0) 'zero)
        (else 'positive)))

#|6.4 Rewrite the following procedure using an if instead of the cond:

(define (utensil meal)
  (cond ((equal? meal 'chinese) 'chopsticks)
        (else 'fork)))
My Answer: |#

(define (utensil meal)
  (if (equal? meal 'chinese)
      'chopsticks
      'fork))
#|
6.5 Write a procedure european–time to convert a time from American AM/PM notation into European 24-hour 
notation. Also write american–time, which does the opposite:
> (european–time '(8 am))
8
> (european–time '(4 pm))
16
> (american–time 21)
(9 PM)
> (american–time 12)
(12 PM)
> (european–time '(12 am))
24

(define (european-time x y)
  (if (= y PM)
      (+ x 12)
      x))
Ask later

Write a predicate teen? that returns true if its argument is between 13 and 19.
My Answer:
|#
(define (teen? x)
  (cond ((< 13 x 19) #t)
        ((= x 13) #t)
        ((= x 19) #t)
        (else #f)))

#|
6.7 Write a procedure type–of that takes anything as its argument and returns one of the words 
word, sentence, number, or boolean:
> (type–of '(getting better))
SENTENCE
> (type–of 'revolution)
WORD
> (type–of (= 3 3))
BOOLEAN
|#
(define (type-of x)
  (cond ((number? x) 'number)
        ((word? x) 'word)
        ((sentence? x) 'sentence)
        ((boolean? x) 'boolean)
        (else 'nada)))

#|
Write a procedure indef–article that works like this:
> (indef–article 'beatle)
(A BEATLE)
> (indef–article 'album)
(AN ALBUM)
Don't worry about silent initial consonants like the h in hour.
|#


(define (indef-article word)
  (if (member? (first word) '(a e i o u))
      (se 'An word)
      (se 'A word)))
#|
6.9 Sometimes you must choose the singular or the plural of a word: 1 book but 2 books. Write a procedure 
thismany that takes two arguments, a number and a singular noun, and combines them appropriately:
> (thismany 1 'partridge)
(1 PARTRIDGE)
> (thismany 3 'french–hen)
(3 FRENCH–HENS)
ASK LATER
(define (thismany num sn)
  (if (> num 1)
      (se num 

6.10 Write a procedure sort2 that takes as its argument a sentence containing two numbers. It should return a 
sentence containing the same two numbers, but in ascending order:
> (sort2 '(5 7))
(5 7)
> (sort2 '(7 5))
(5 7)
|#
(define (sort a)
  (cond ((< (first a) (last a)) a)
        (else (se (last a) (first a)))))

(define (sort2 a)
  (if (< (first a) (last a))
      (se a)
      (se (last a) (first a))))
#|
6.11 Write a predicate valid–date? that takes three numbers as arguments, representing a month, a day of the 
month, and a year. Your procedure should return #t if the numbers represent a valid date (e.g., it isn't the 31st of 
September). February has 29 days if the year is divisible by 4, except that if the year is divisible by 100 it must also be 
divisible by 400.
> (valid–date? 10 4 1949)
#T
> (valid–date? 20 4 1776)
#F
> (valid–date? 5 0 1992)
#F
> (valid–date? 2 29 1900)
#F
> (valid–date? 2 29 2000)
#T
|#
  
(define (valid-date? m d y)
  (cond ((< 0 m 13) #t)
        ((< 0 d 32) #t)
        ((and (member? m '( 1 3 5 7 8 10 12)) (member? d '(31))) #t)
        ((= m 2) (= d 28))
        (else #f)))

#| 6.12 Make plural handle correctly words that end in y but have a vowel before the y, such as boy. Then teach it 
about words that end in x (box). What other special cases can you find?
|#

(define (stl wd)
  (last (butlast wd)))

; stl means second to last.

(define (plural wd)
  (cond ((and (member? (last wd) '(y)) (member? (stl wd) 'aeiou)) (word wd 's))
        ((and (member? (last wd) '(x)) (member? (stl wd) 'aeiou)) (word wd 'es))
        (else 'nope)))

#| 6.13 Write a better greet procedure that understands as many different kinds of names as you can think of:> (greet '(john lennon))
(HELLO JOHN)
> (greet '(dr marie curie))
(HELLO DR CURIE)
> (greet '(dr martin luther king jr))
(HELLO DR KING)
> (greet '(queen elizabeth))
(HELLO YOUR MAJESTY)
> (greet '(david livingstone))
(DR LIVINGSTONE I PRESUME?)|#

(define (greet name)
  (cond ((member? (first name) '(dr doctor Doctor Dr)) (se 'Hello (first name) (last name) '(--how are you?)))
        ((and (member? (first name) '(king King)) (member? (first (bf name)) '(jeoffrey Jeoffrey)) '(Arent you dead...??)))
        ((member? (first name) '(king queen prince princess)) '(Hello Your Majesty -- Id curtsey, but Im a computer.))
        ((member? (first name) '(lady)) '(Hello m'lady))
        ((member? (first name) '(lord)) '(Hello m'lord))
        ((member? (first name) '(Daenerys daenerys)) '(Greetings, Kahleesi.))
        (else (se 'Hello (first name)))))

#| 6.14 Write a procedure describe–time that takes a number of seconds as its argument and returns a more useful 
description of that amount of time:
> (describe–time 45)
(45 SECONDS)
> (describe–time 930)
(15.5 MINUTES)
> (describe–time 30000000000)
(9.506426344208686 CENTURIES)
|#

(define (describe-time x)
  (cond ((and (> x 3600) (< x 86400)) (se (/ (/ x 60) 60) 'hours))
        ((and (> x 3599) (< x 3601)) (se (/ (/ x 60) 60) 'hour))
        ((and (> x 60) (< x 3600) (se (/ x 60) 'minutes)))
        ((and (> x 59) (< x 61)) (se (/ x 60) 'minute))
        ((and (< x 60) (> x 1)) (se x 'seconds))
        ((and (< x 2) (> x 0)) (se x 'second))
        (else 'nope)))
; I get it, no need to waste time working up to the century mark though.

