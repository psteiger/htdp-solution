;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; search-lolos : symbol list : boolean
;; consumes a symbol and a list of list of symbols and returns true if
;; the symbol is found anywhere in the original list of lists; otherwise, 
;; it returns false.
(define (search-lolos s lst)
  (let ([joint-lists (foldl append '() lst)])
    (foldl (lambda (x bool) 
             (or (symbol=? s x) bool)) 
           #f 
           joint-lists)))

;; tests
(search-lolos 'a (list (list 'b 'c) (list 'd 'a 'c)))
true
(search-lolos 'a (list (list 'b 'c)))
false