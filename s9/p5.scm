;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; filter/lambda solution

;; order-toy : symbol number list-of-symbols -> number
;; consumes a symbol representing a toy, a number representing how many of
;; that particular toy you wish to have in stock, and a list of symbols
;; representing an inventory of toys. Produces the number copies that need
;; to be ordered.
(define (order-toy s n lst)
  (- n
     (length (filter (lambda (x) (if (symbol=? x s) true false))
                     lst))))

;; tests
(order-toy 'a 10 '(b c a d a a))
7

;; Recursive solution

(define (how-many-symbols s lst)
  (cond [(empty? lst) 0]
        [else
         (cond [(symbol=? s (first lst)) (+ 1 (how-many-symbols s (rest lst)))]
               [else                     (how-many-symbols s (rest lst))])]))

;; tests
(how-many-symbols 'a '(b c d a b a e))
2

(define (order-toy-rec s n lst)
  (- n (how-many-symbols s lst)))

;; tests
(order-toy-rec 'a 26 '(a b e c a))
24