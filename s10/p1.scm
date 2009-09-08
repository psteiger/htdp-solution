;; between? : number number number -> boolean
;; checks if n is between and including lower and upper
(define (between? lower upper n)
  (and (>= n lower) 
       (<= n upper)))
  
;; Recursive solution

;; filter-freq : lo hi lst
;; consumes two threshold frequencies (low and high) and a list of frequencies
;; and returns a list of those frequencies between and including the thresholds
(define (filter-freq low high lst)
  (cond [(empty? lst) empty]
        [else
         (cond [(between? low high (first lst))
                (cons (first lst) 
                      (filter-freq low high (rest lst)))]
               [else (filter-freq low high (rest lst))])]))

;; tests

(filter-freq 5 15 '(2 4 6 10 12 15 16))
(list 6 10 12 15)
(filter-freq 2 5 '(1 2 3 4 5 6 7))
(list 2 3 4 5)

;; filter solution

;; filter-freq* : lo hi lst
;; consumes two threshold frequencies (low and high) and a list of frequencies
;; and returns a list of those frequencies between and including the thresholds
(define (filter-freq* lo hi lst)
  (filter (lambda (freq)
            (between? lo hi freq))
          lst))

;; tests
(filter-freq* 5 15 '(2 4 6 10 12 15 16))
(list 6 10 12 15)