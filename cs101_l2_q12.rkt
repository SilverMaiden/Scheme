;def bigger(num1, num2):
;    if num1 < num2:
;        return num2
;    return num1 
;
;def bigger(num1, num2):
;    if num1 < num2:
;        return num2
;    else:
;        return num1 
;
;def is_friend(s):
;    if s[0] == 'D'or s[0] == 'N':
;        return True
;    return False
;
;
;
;def bigger(a, b):
;    if a > b:
;        return a
;    else:
;        return b
;
;
;def biggest(a, b, c):
;    if bigger(a, b) > c:
;        return bigger(a, b)
;    else:
;        return c
;
;def print_numbers(num):
;while num != 0:
;num = num - 1
;return num
;
;
;
;
;def print_numbers(a):
;    i = 0
;    while i < a:
;        i = i + 1
;        print i   ;old answer
;
;def print_numbers(num):
;    c = 0
;    while c != num:
;        c = c + 1
;        print c * c   ;new answer





(define (factorial n)
  (if (or (= n 1) (= n 0))
      1
      (* n (factorial (- n 1)))))
  
(factorial 0)





