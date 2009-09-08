;; foldl solution
(define (cancel-sum lst)
  (let ([sum (foldl + 0 lst)])
    (append lst (list (- sum)))))

;; recursive solution
(define (sum-list lst)
  (if (empty? lst)
      0
      (+ (first lst) (sum-list (rest lst)))))

(define (cancel-sum-rec lst)
  (append lst
          (list (- (sum-list lst)))))

;; tests
(cancel-sum '(1 2 3 4 5))
(cancel-sum-rec '(1 2 3 4 5))