;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; list-has-true : boolean -> list-of-booleans
;; consume a list of booleans and determines whether one of them is true.
(define (list-has-true lst)
  (foldl (lambda (x y)
           (or x y))
         false 
         lst))

;; tests
(list-has-true (list true true true false))
;; expected result
true

(list-has-true (list true))
;; expected result
true

(list-has-true empty)
;; expected result
false