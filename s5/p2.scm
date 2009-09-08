;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; op : symbol number -> number
;; to compute the operation, defined by symbol, in n
(define (op symbol n)
  (cond [(symbol=? symbol 'squareroot) (sqrt n)]
        [(symbol=? symbol 'tangent)    (tan n)]
        [else                          n]))

;; Tests
(op 'squareroot 4)
;; expected result
2

(op 'tangent 90)
;; expected result
#i-2 ; (aproximately)

(op 'any 5000)
;; expected result
5000