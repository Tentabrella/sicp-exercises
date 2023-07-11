(define (bigger x y)
  (if (> x y)
      x
      y))

(define (smaller x y)
  (if (> x y)
      y
      x))

(define (another-bigger x y z)
  (bigger (smaller x y) z))