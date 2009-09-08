(define (which-toppings lst)
  (let* ([true-bs-lst   (filter (lambda (x) (second x)) lst)]
         [true-bs-names (map first true-bs-lst)])
    (foldr string-append "" true-bs-names)))

(which-toppings (list (list "oi" true)
                      (list ", " true)
                      (list "meu " true)
                      (list "amor" true)
                      (list "zinho" false)
                      (list "zao" true)))

(which-toppings  (list (list "lain " true)
        (list "patrick " false)
        (list "viado" true)))