#lang scheme
;; search-lolos : symbol list : boolean
;; consumes a symbol and a list of list of symbols and returns true if
;; the symbol is found anywhere in the original list of lists; otherwise, 
;; it returns false.
(define (search-lolos s lst)
  (let ([joint-lists (foldl append '() lst)])
    (foldl (λ (x bool) 
             (or (symbol=? s x) bool)) 
           #f 
           joint-lists)))

;; tests
(search-lolos 'a (list (list 'b 'c) (list 'd 'a 'c)))
true
(search-lolos 'a (list (list 'b 'c)))
false