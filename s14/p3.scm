#lang scheme

;; remove-wp : wp -> wp
;; remove all wps from wp which has '%remove in (car wp)
(define (remove-wp wp)
  (cond [(empty? wp)            empty]
        [(symbol? (first wp))   (if (symbol=? (first wp) '%remove) 
                                    empty
                                    (cons (first wp) (remove-wp (rest wp))))]
        [else                   (cons (remove-wp (first wp)) (remove-wp (rest wp)))]))

;; tests
(define wp (cons empty
                 (cons 'a
                       (cons 'd
                             (cons (cons 'b empty)
                                   (cons '%remove (cons (cons 'a empty)
                                                        (cons 'b empty))))))))

wp
'(() a d (b) %remove (a) b) ; expected

(remove-wp wp)
'(() a d (b))               ; expected
             