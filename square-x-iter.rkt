(load "success-close.rkt")
(load "improve-guess.rkt")

(define (square-x-iter guess x)
  (if (success-close guess x)
      guess
      (square-x-iter (improve-guess guess x) x)
      )
)

(square-x-iter 1 9998)