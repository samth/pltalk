#lang racket
(begin-for-syntax
  (require racket/file racket/match syntax/parse)
  (define lines (file->lines "mime/mime.txt"))
  (define mapping
    (for*/hash ([i (in-list lines)]
                [v (in-value (regexp-match #px"([a-z/-]*)\\W*([a-z]*)" i))]
                #:when v)
      (match (cdr v)
        [(list a "") (values a #f)]
        [(list a b) (values a b)])))
  (define rmapping
    (for/hash ([v (in-hash-keys mapping)]
               #:when (hash-ref mapping v #f))
      (values (hash-ref mapping v) v))))
(define-syntax (def-mapping stx)
  (syntax-parse stx
    [(_ id ) #`(begin
                    (define id #,mapping)
                    (define rid #,rmapping))]))

(def-mapping mimes )
rid