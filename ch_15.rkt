#| Exercises
15.1 Write a procedure to–binary:
> (to–binary 9)
1001
> (to–binary 23)
10111
|#

;
;(define (to-binary num)
;  (if (< num 1)
;      0
;      (if (odd? (first (dvd num)))
;          (se 
             
(define (odp num)
  (cond ((not (number? (first num))) '.0 )
        ((and (= (first num) 0) (not (number? (first (bf (num)))))) '.0 )
        ((number? (first num))
         (word (first num) (odp (bf num))))
        
        (else '.0 )))
        
     
(odp 8.4)
      


(define (dvd num)
  (if (< num 1)
      '()
      (se num (dvd (/ num 2)))))
(dvd 7)
       
       
(define (from–binary bits)
  (if (empty? bits)
      0
      (+ (* (from–binary (b1 bits)) 2) (last bits))))