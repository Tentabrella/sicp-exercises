(define (factorial n)
  (define (iter product x)
    (if (> x n)
        product
        (iter (* product x)
              (+ 1 x)
              )
        )
    )
  (iter 1 1)
  )

(factorial 5)