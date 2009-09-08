;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define PI 3.14)

;; area-of-disk : Posn Posn -> number
;; to compute the area of a disk, given a point in it's circunference
;; and a point in it's center
(define (area-of-disk center farmost)
  (* PI
     (expt (- farmost center) 2)))

;; Tests
(area-of-disk 0 10)
;; expected result
314