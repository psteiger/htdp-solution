;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define-struct ice-cube (mass velocity))

;; momentum : Cube -> number
;; computes the momentum of the cube.
(define (momentum cube)
  (* (ice-cube-mass cube)
     (ice-cube-velocity cube)))

;; join-ice-cubes : Cube Cube -> Cube
;; creates a new Cube, based on the momentum of the previous cubes
(define (join-ice-cubes cube1 cube2)
  (let* ([new-mass     (+ (ice-cube-mass cube1) 
                          (ice-cube-mass cube2))]
         [new-momentum (+ (momentum cube1)
                          (- (momentum cube2)))]
         [new-velocity (/ new-momentum new-mass)])
    (make-ice-cube new-mass new-velocity)))

;; Tests
(join-ice-cubes (make-ice-cube 10 25)
                (make-ice-cube 10 15))
;; expected result
(make-ice-cube 20 5)

