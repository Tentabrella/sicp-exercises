(load "success-close.rkt")
(load "improve-guess.rkt")
(load "good-enough.rkt")

(define (square-x-iter guess x)
  (if (success-close guess x)
      guess
      (square-x-iter (improve-guess guess x) x)
      )
)

(define (square-x-iter-refine guess x)
  (let ((new-guess (improve-guess guess x)))
  (if (good-enough? guess new-guess)
       new-guess
      (square-x-iter-refine new-guess x)
      )
    )
)