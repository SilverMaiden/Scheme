;Practice Questions:

(define (explode wd)
  (if (equal? (count wd) 0)
      '()
      (se (first wd)
          (explode (bf wd)))))
(explode 'blah)


(define (letter-pairs ltrs)
  (if (<= (count ltrs) 1)
      '()
      (se (word (first ltrs) (first (bf ltrs)))
          (letter-pairs (bf ltrs)))))
            
(letter-pairs 'george)

#|Boring Exercises
11.1 Write downup4 using only the word and sentence primitive procedures.
|#

(define (downup4 wd)
  (se wd
      (bl wd)
      (bl (bl wd))
      (first wd)
      (bl (bl wd))
      (bl wd)
      wd))
(downup4 'cate)

#| 11.2 [8.12]* When you teach a class, people will get distracted 
if you say "um" too many times. Write a count–ums that counts the 
number of times "um" appears in a sentence:

> (count–ums '(today um we are going to um talk about the combining um method))
3
Here are some special-case count–ums procedures for sentences of 
particular lengths: 
|#

;(define (count–ums0 sent) 
;  0)
;
;(define (count–ums1 sent)
;  (if (equal? 'um (first sent))
;      10))
;
;(define (count–ums2 sent)
;  (if (equal? 'um (first sent))
;      (+ 1 (count–ums1 (bf sent)))
;      (count–ums1 (bf sent))))
;
;(define (count–ums3 sent)
;  (if (equal? 'um (first sent))
;      (+ 1 (count–ums2 (bf sent)))
;      (count–ums2 (bf sent))))
;;Write count–ums recursively.\



(define (count-ums sent)
  (if (equal? (count sent) 0)
      0
      (+ (if (equal? (first sent) 'um)
             1
             0)
         (count-ums (bf sent)))))

      
      
  
 
  

(count-ums '(today um we are um um um um goint to um))
  

  
  
  
  
  
  
  
  
  
  
  
  
  
