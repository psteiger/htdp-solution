(define-struct auction-bid (bidder-number item-number amount-bid))

(define (highest-bid n lst)
  (first (filter (lambda (x) 
                   (= n (auction-bid-item-number x))) 
                 lst)))

(define bidlist
  (list (make-auction-bid 1 2 5)
        (make-auction-bid 2 6 4)
        (make-auction-bid 6 9 66)))

(auction-bid-amount-bid (highest-bid 6 bidlist))
