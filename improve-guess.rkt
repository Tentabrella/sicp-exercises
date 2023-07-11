(define (improve-guess guess x)
  (/ (+ guess (/ x guess)) 2)
  )