;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; Recursive solution

;; string-append-n-rec* : list-string -> string
;; consumes a non-empty list of strings and produces a single string resulting
;; from appending all of the strings together.
(define (string-append-n-rec* lst)
  (cond [(<= (length lst) 1) 
         (first lst)]
        [else 
         (string-append-n-rec* (cons (string-append (first lst)
                                                (second lst))
                                 (rest (rest lst))))]))

;; tests
(string-append-n-rec* (list "a" "b" "c"))
"abc"

;; string-append* : list-of-strings -> string
;; consumes any list of strings (or empty) and produces a single string
;; resulting from appending all of the strings together.
(define (string-append-rec* lst)
  (if (empty? lst)
      ""
      (string-append-n-rec* lst)))

;; tests
(string-append-rec* empty)
""

;; FOLD solution
;; Note: the fold solution already works with empty lists

;; string-append* : list-string -> string
;; consumes a non-empty list of strings and produces a single string resulting
;; from appending all of the strings together.
(define (string-append* lst)
  (foldr string-append "" lst))

;; tests
(string-append* (list "a" "b" "c"))
"abc"

(string-append* empty)
""