#lang scheme
(define-struct file (name contents))
(define-struct node (address files neighbor))

;; to-list : node -> list
;; converts a P2P network to a list
(define (to-list network)
  (if (empty? network)
      empty
      (cons network 
            (to-list (node-neighbor network)))))

;; file=? : file file
;; returns true if file's name and contents are equal. false otherwise.
(define (file=? file1 file2)
  (and (string=? (file-name     file1)
                 (file-name     file2))
       (=        (file-contents file1)
                 (file-contents file2))))

;; file-in? : file node
;; check if file is in a node's list of files. returns #t if so, #f otherwise
(define (file-in? file node)
  (define (file-in-list? file file-lst)
    (if (empty? file-lst)
        #f
        (if (file=? file (first file-lst))
            #t
            (file-in-list? file (rest file-lst)))))
  (let ([file-lst   (if (empty? node) empty (node-files node))])
    (file-in-list? file file-lst)))

;; p2p-search : file network -> node-address
;; checks if network has a node that has a file. returns the address of
;; the first node found to have the file. false if file not found.
(define (p2p-search file network)
  (if (empty? network)
      #f
      (if (file-in? file network)
          (node-address network)
          (p2p-search file (node-neighbor network)))))

;; p2p-search-all : file network -> list-of-node-address
;; like p2p-search, but returns a list of all the nodes found.
(define (p2p-search-all file network)
  (let ([has-file-node-lst   (filter (lambda (x) (file-in? file x))
                                      (to-list network))])
    (map node-address has-file-node-lst)))

;; tests
(define file1 (make-file "Windows 7"           1010101110101))
(define file2 (make-file "The Who Discography" 1011111101111))
(define file3 (make-file "Slackware 13 DVD"    1011100000010))

(define node3 (make-node "10.0.0.1"  (list file1)       empty))
(define node2 (make-node "10.0.10.5" (list file1 file2) node3))
(define node1 (make-node "10.0.5.5"  (list file3)       node2))

(p2p-search file1 node1)
"10.0.10.5"                   ; expected
(p2p-search-all file1 node1)
(list "10.0.10.5" "10.0.0.1") ; expected