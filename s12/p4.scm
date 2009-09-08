;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; list-of-n : number number -> list
;; consumes a number n and returns a list of n-times n
(define (list-of-n n n-times)
  (if (zero? n-times)
      '()
      (cons n (list-of-n n (sub1 n-times)))))

;; tests
(list-of-n 5 3)
(list 5 5 5)

;; expand-lon : list -> list
;; consumes a list of natural numbers and returns a new list of natural numbers
;; with each number in the original list replaced by a number of copies of that
;; number equal to its value.
;; example:
;; (expand-lon '(1 2 3)) -> '(1 2 2 3 3 3)
(define (expand-lon lst)
  (foldr (lambda (x l)
           (append (list-of-n x x) l))
         '()
         lst))

;; tests
(expand-lon '(1 2 3 4))
(list 1 2 2 3 3 3 4 4 4 4)