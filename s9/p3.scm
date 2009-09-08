;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; positivity-aux : List Number Number -> Number
;; auxiliar function for 'positivity', needed because PLT-Scheme
;; doesn't support default value (0, in that case) for pos and neg.
(define (positivity-aux lst pos neg)
  (if (empty? lst)
      (- pos neg)
      (if (>= (first lst) 0)
          (positivity-aux (rest lst) (+ pos 1) neg)
          (positivity-aux (rest lst) pos (+ neg 1)))))

;; tests:
(positivity-aux '(1 -2 3 -4) 0 0)
;; expected result
0

;; positivity : List -> Number
;; given a list of integer returns the number of positive elements 
;; minus the number of negative elements
(define (positivity lst)
  (positivity-aux lst 0 0))

;; tests:
(positivity '(1 -2 5 3 2 0))
;; expected result
4

;; positivity-with-map : List -> Number
;; same thing as positivity, although a much shorter version of it,
;; using map, lambda, foldl and such
(define (positivity-with-map lst)
  (foldl + 0 
         (map (lambda (x) (if (>= x 0) 1 -1)) 
              lst)))

;; tests:
(positivity-with-map '(1 0 -1))
;; expected result
1