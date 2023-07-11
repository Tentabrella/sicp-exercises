(load "p8-sum-of-squares.scm")
(load "3-bigger-smaller.rkt")

(define (bigger-square-sum x y z)
  (sum-of-squares (bigger x y) (another-bigger x y z))
  )