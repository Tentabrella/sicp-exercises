(define (success-close guess x)
  (< (abs (- x (* guess guess))) 0.01)
)
                               