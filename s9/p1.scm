;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; between? : number number number -> boolean
;; check if n is between lower and upper bounds
(define (between? lower upper n)
  (and (>= n lower)
       (<= n upper)))
  
;; tests:
(between? 2 5 3)
;; expected result
true
  
;; three-between? : number number list-of-3-number -> boolean
;; check if all number in list-of-3-numbers is between lower and upper bounds
(define (three-between? lower upper lst)
  (foldl (lambda (n bool)
           (and (between? lower upper n) bool))
         true
         lst))
  
;; tests:
(three-between? 0 10 '(2 4 6))
;; expected result
true

(three-between? 0 10 '(2 4 6 12))
;; expected result
false