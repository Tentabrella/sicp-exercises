;;1.5
(define (p) (p))
(define (test x y)
  (if (= x 0) x
           y))
(test 0 p)
;;normal order evaluation only evaluate value when needed
;;applicative order will evaluate as soon as it is in. why applicative? evaluated before apply!
;;as result is normal order evaluation