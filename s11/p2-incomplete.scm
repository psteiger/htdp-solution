;; recursivo
(define (divisible? n1 n2)
  (= 0 (remainder n1 n2)))

(define (mod-list no1 no2)
  (cond [(= no1 0) empty]
        [else
         (cond [(not (divisible? no1 no2))
                (cons no1 (mod-list (sub1 no1) no2))]
               [else
                (mod-list (sub1 no1) no2)])]))

;; filter
(define (list-from-to n1 n2)
  (if (= n1 (add1 n2))
      empty
      (cons n1 (list-from-to (add1 n1) n2))))

(define (mod-list* n1 n2)
  (filter (lambda (x) (not (divisible? x n2)))
          (list-from-to 0 n1))) 

(mod-list 10 2)
(list 9 7 5 3 1)
(mod-list* 10 2)
(list 1 3 5 7 9)