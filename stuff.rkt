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



(define (up wd)
  (if (equal? (count wd) 0)
      '()
      (se (up (bf wd)) 
          (first wd))))
      
          
(up 'town)


#|(define (disjoint-pairs wd)
  (if (equal? (count wd) 0)
      '()
      (if (equal? (count wd) 1)
          wd
          (se (word 
               (first wd)
               (first (bf wd)))
              (disjoint-pairs (bf (bf wd)))))))
  |#




#| 14.3 
> (remdup '(ob la di ob la da))
(ob la di da)
(It's okay if your procedure returns (DI OB LA DA) instead, 
as long as it removes all but one instance of each 
duplicated word.) |#


(define (remdup sent)
  (if (equal? (count sent) 0) 
      '()
      (se (bf
 sent)))
        (else (se (first sent) (remove-once wd (bf sent))))))