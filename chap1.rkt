;;1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;;1.3
(load "bigger-square-sum.scm")
"answer for 1.3 should be 13, result is " 
(bigger-square-sum 1 2 3)

;;1.4
(load "a-plus-abs-b.scm")
(a-plus-abs-b 1 -1)

;;1.5
(define (p) (p))
(define (test x y)
  (if (= x 0) x
      y))
(test 0 p)
;normal order evaluation only evaluate value when needed
;applicative order will evaluate as soon as it is in. why applicative? evaluated before apply!
;;as result if is normal order evaluation


;;1.6
(load "success-close.rkt")
(load "improve-guess.rkt")

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 2) 0 1)

(load "success-close.rkt")
(load "improve-guess.rkt")

#|
(define (square-iter guess x)
  (new-if (success-close guess x)
          guess
          (square-iter (improve-guess guess x) x)
          )
  )
|#
;(success-close 3 9)

;even define will cause infinite loop
;difference demonstrated by following
(display "\nnew-if:\n")
(new-if #t (display "true\t") (display "false\t"))
(display "\nif:\n")
(if #t (display "true\t") (display "false\t"))
(display "\n")

;;1.7
(load "square-x-iter.rkt")

;big -> infinite loop
;(square-x-iter 1 10000000)

;small -> wrong answer
;(square-x-iter 1 0.000001)
(square-x-iter-refine 1 0.000001)
(square-x-iter-refine 1 1000000)

;;1.8
(define (improve-cube y x)
  (/ (+ (/ x (square y)) (* 2 y)) 3)
  )

(define (cube-x-iter guess x)
  (let ((new-guess (improve-cube guess x)))
  (if (good-enough? guess new-guess)
       new-guess
      (cube-x-iter new-guess x)
      )
    )
)

(cube-x-iter 3 100)

;; 1.9
(define (plus a b)
    (if (= a 0)
        b
        (plus (dec a) (inc b))))


#|
def1:
(+ 5 2)
(inc (+ 4 2))
(inc ((inc 3 2)))
...递归
def2:
(+ 5 2)
(+ 4 3)
(+ 3 4)
...迭代
|#

;;1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(A 1 10)
(A 2 4)
(A 3 3)
#|
(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
...
(A 0 (A 0 (A 0 ... (A 0 (A 1 1)))))
(A 0 (A 0 (A 0 ... (A 0 2))))
---
(A 1 10) = 2 ^ 10 checked
2^10

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2))))
(A 1 (A 1 4))
(A 1 16)
...
(A 2 4) = (A 1 (A 1 4)) = 2 ^ (2 ^ 4) 

(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 4)
...
(A 3 3) = (A 2 (A 2 2))
|#
(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

;;1.11
(define (base-recur n)
  (if (< n 3)
      n
      (+ (base-recur (- n 1)) 
         (* 2 (base-recur (- n 2)))
         (* 3 (base-recur (- n 3)))
         )
      )
  )

(define (sf n)
  (define (iter-recur l3f l2f l1f n)
    (if (= n 2)
        l1f
        (iter-recur l2f l1f (+ l1f (* 2 l2f) (* 3 l3f)) (- n 1))
        )
    )
  (if (< n 3)
      n
      (iter-recur 0 1 2 n)
      )
  )

(base-recur 5)
(sf 5)

;;1.14
#|
count-change 的阶
和fib差不多，fib是平方，那么count同样是平方或者立方或者云云，小于阶乘，至少平方
theta n^k 没看证明
|#

;;1.15
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0))))
  )

(sine 12.15)

;;1.20
#|
若采用正则序
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40))
可以看到正则序有相当多重复计算,所以一般采用应用序
|#








