;;; p8-sum-of-squares.scm

(define (square x)
  (* x x))

(define (sum-of-squares x y)
    (+ (square x) 
       (square y)))