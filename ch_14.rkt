(define (disjoint-pairs wd)
  (if (equal? (count wd) 0)
      '()
      (if (equal? (count wd) 1)
          wd
          (se (word 
               (first wd)
               (first (bf wd)))
              (disjoint-pairs (bf (bf wd)))))))
  
(disjoint-pairs 'george)

(define (add-numbers sent)
  (cond ((equal? (count sent) 0) 0)
        ((number? (first sent)) 
         (+ (first sent) (add-numbers (bf sent))))
        (else (add-numbers (bf sent)))))

(add-numbers '(2 coffees with 4 creamers, 7 sugars each and 8 donuts.))

(define (first-number sent)              
  (cond ((empty? sent) '())
        ((number? (first sent)) (first sent))
        (else (first-number (bf sent)))))

(first-number '(how many were there? 5 or 6 ?))

#| Exercises
Classify each of these problems as a pattern (every, keep, or accumulate), 
if possible, and then write the procedure recursively. In some cases 
we've given an example of invoking the procedure we want you to write, 
instead of describing it.
14.1
> (remove–once 'morning '(good morning good morning))
(GOOD GOOD MORNING)
(It's okay if your solution removes the other MORNING instead, 
as long as it removes only one of them.)

keep. 
|#



(define (remove-once wd sent)
  (cond ((equal? (count sent) 0) '() )
        ((equal? wd (first sent))
         (se (bf sent)))
        (else (se (first sent) (remove-once wd (bf sent))))))

(remove-once 'hello '(oh hello there I didnt see you oh hello to yoy too))

#| 14.2
> (up 'town)
(T TO TOW TOWN)

every

|#

(define (reverse wd)
  (if (= (count wd) 1)
      wd
      (word (last wd)
            (reverse (bl wd)))))



(define (up wd)
  (if (equal? (count wd) 0)
      '()
      (se (up (bl wd))
          wd)))



#| 14.3 
> (remdup '(ob la di ob la da))
(ob la di da)
(It's okay if your procedure returns (DI OB LA DA) instead, 
as long as it removes all but one instance of each 
duplicated word.) |#


(define (remdup sent)
  (if (equal? (count sent) 0)
      '()
      (if (equal? (count sent) 1)
          sent
          (if (member? (last sent) (bl sent))
              (se (remdup (bl sent)))
              (se (remdup (bl sent)) 
                  (last sent))))))



(remdup '(ob la di ob la da))

#| 14.4
(odds '(i lost my little girl))
(I MY GIRL)

keep
|#


(define (odds sent)
  (cond ((equal? (count sent) 0) '() )
        ((equal? (count sent) 1) sent)
        (else (se (first sent) 
                  (odds (bf (bf sent)))))))

(odds '(i lost my little girl))

#|
14.5 [8.7] Write a procedure letter–count that takes a sentence as 
its argument and returns the total number of letters in the sentence:
> (letter–count '(fixing a hole))
11
|#

(define (letter-count sent)
  (if (equal? (count sent) 0)
      0
      (+ (count (first sent))
         (letter-count (bf sent)))))

(letter-count '(fixing a hole))

; 14.6 Write member?


(define (member?H fst sec)
  (cond ((or (equal? (count fst) 0) (equal? (count sec) 0)) #f)
        ((equal? fst (first sec)))
        (else (member?H fst (bf sec)))))


(member?H 1 '777470)

#| 14.7 Write differences, which takes a sentence of numbers as 
its argument and returns a sentence containing the differences 
between adjacent elements. (The length of the returned sentence 
is one less than that of the argument.)
> (differences '(4 23 9 87 6 12))
(19 –14 78 –81 6)
|#
(define (differences ns)
  (cond ((< (count ns) 2) '())
        ((< (first ns) (first (bf ns)))
         (se (- (first(bf ns)) (first ns))
              (differences (bf ns))))
        ((> (first ns) (first (bf ns)))
         (se (- (first ns) (first(bf ns))) 
             (differences (bf ns))))
        (else 'NA)))

(differences '(4 0 1 8 3))

#|14.8 Write expand, which takes a sentence as its argument. 
It returns a sentence similar to the argument, except that if 
a number appears in the argument, then the return value contains 
that many copies of the following word:
> (expand '(4 calling birds 3 french hens))
(CALLING CALLING CALLING CALLING BIRDS FRENCH FRENCH FRENCH HENS)
> (expand '(the 7 samurai))
(THE SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI)
|#

(define (numword num wd)
  (if (<= num 0)
      '()
      (if (equal? num 1)
          wd
          (se wd (numword (- num 1) wd)))))
      
(numword 5 'cat)

 

(define (expand sent)
  (cond ((= (count sent) 0) '() )
        ((= (count sent) 1) sent)
        ((and (number? (first sent)) (not (number? (first(bf sent)))))
         (se (numword (first sent) (first (bf sent))) (expand (bf(bf sent)))))
         (else (se (first sent) (expand (bf sent))))))
  
(expand '(4 calling birds 7 french hens))

#| 14.9 Write a procedure called location that takes two arguments, 
a word and a sentence. It should return a number indicating where 
in the sentence that word can be found. If the word isn't in the sentence, 
return #f. If the word appears more than once, return the location of the first appearance.
> (location 'me '(you never give me your money))
4
|#


  


(define (location wd sent)
  (if (equal? (or (count wd) (count sent)) 0)
      '()
      (if (not (equal? (first sent) wd))
          (+ 1 (location wd (bf sent)))
          1)))

(location 'cat '(cats love to play outside. I have a cat do you have a cat ?))


#| 14.10 Write the procedure count–adjacent–duplicates that takes 
a sentence as an argument and returns the number of words in the 
sentence that are immediately followed by the same word:
> (count–adjacent–duplicates '(y a b b a d a b b a d o o))
3
> (count–adjacent–duplicates '(yeah yeah yeah))
2
|#


(define (count-adjacent-duplicates sent)
  (if (<= (count sent) 1)
      0
      (if (equal? (first sent) (first (bf sent)))
          (+ 1 (count-adjacent-duplicates (bf sent)))
          (count-adjacent-duplicates (bf sent)))))

  
(count-adjacent-duplicates '(yeah yeah yeah))
(count-adjacent-duplicates '(y a b b a d a b b a d o o))



#| 14.11 Write the procedure remove–adjacent–duplicates that takes 
a sentence as argument and returns the same sentence but with 
any word that's immediately followed by the same word removed:
> (remove–adjacent–duplicates '(y a b b a d a b b a d o o))
(Y A B A D A B A D O)
> (remove–adjacent–duplicates '(yeah yeah yeah))
(YEAH)
|#


(define (remove-adjacent-duplicates sent)
  (if (<= (count sent) 0)
      '()
      (if (equal? (count sent) 1)
          sent
          (if (equal? (first sent) (first (bf sent)))
              (se (remove-adjacent-duplicates (bf sent)))
              (se (first sent) (remove-adjacent-duplicates (bf sent)))))))


(remove-adjacent-duplicates '(yeah yeah yeah))

(remove-adjacent-duplicates '(y a b b a d a b b a d o o))

#| 14.12 Write a procedure progressive–squares? that takes a sentence 
of numbers as its argument. It should return #t if each number (other 
than the first) is the square of the number before it:
> (progressive–squares? '(3 9 81 6561))
#T
> (progressive–squares? '(25 36 49 64))
#F
|#

(define (square? x y)
  (if (= (or x y) 0)
      #f
      (if (= (* x x) y)
          #t
          #f)))

(define (progressive-squares? ns)
  (if (<= (count ns) 1)
      #t
      (if (square? (first ns) (first (bf ns)))
          (progressive-squares? (bf ns))
          #f)))


(progressive-squares? '(25 36 49 64))

(progressive-squares? '(2 4 16))

#| 14.13 What does the pigl procedure from Chapter 11 do if you invoke 
it with a word like "frzzmlpt" that has no vowels? Fix it so that it returns "frzzmlptay."
|#

(define (no-vowels-in-wd? wd)
  (if (= (count wd) 0)
      #t
      (cond ((equal? (first wd) 'a) #f)
            ((equal? (first wd) 'e) #f)
            ((equal? (first wd) 'i) #f)
            ((equal? (first wd) 'o) #f)
            ((equal? (first wd) 'u) #f)
            (else (no-vowels-in-wd? (bf wd))))))

(no-vowels-in-wd? 'marshmellows )

(define (pigl wd)
  (if (no-vowels-in-wd? wd)
      (word wd 'ay)
      (if (member? (first wd) 'aeiou)
          (word wd 'ay)
          (pigl (word (bf wd) (first wd))))))



(pigl 'catt)
#| 14.14 Write a predicate same–shape? that takes two sentences as arguments. 
It should return #t if two conditions are met: The two sentences must have 
the same number of words, and each word of the first sentence must have 
the same number of letters as the word in the corresponding position 
in the second sentence.
> (same–shape? '(the fool on the hill) '(you like me too much))
#T
> (same–shape? '(the fool on the hill) '(and your bird can sing))
#F
|#


(define (same-shape? sent1 sent2)
  (if (or (= (count sent1) 0) (= (count sent2) 0))
      #f
      (if (and (= (count sent1) 1) (= (count sent2) 1))
          (if (= (count (first sent1)) (count (first sent2)))
              #t
              #f)
          (if (= (count sent1) (count sent2))
              (if (= (count (first sent1)) (count (first sent2)))
                  (same-shape? (bf sent1) (bf sent2))
                  #f)
              #f))))

(same-shape? '(the fool on the hill) '(two cats in the hats))

(same-shape? '(the fool on the hill) '(you like me too much))