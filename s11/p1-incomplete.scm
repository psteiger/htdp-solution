(define (sub n1 n2)
  (if (zero? n2)
      n1
      (sub (sub1 n1) (sub1 n2))))

(sub 7 3)
4