;; symbol-count : lst -> number
;; computes the number of symbols in lst
(define (symbol-count lst)
  (if (empty? lst)
      0
      (if (symbol? (first lst))
          (+ 1 (symbol-count (rest lst)))
          (symbol-count (rest lst)))))

;; tests
(symbol-count '(a b 3 e symb 4))
4