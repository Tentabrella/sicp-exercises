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
;;normal order evaluation only evaluate value when needed
;;applicative order will evaluate as soon as it is in. why applicative? evaluated before apply!
;;as result is normal order evaluation


;;1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))