#lang racket
(require (for-syntax syntax/parse))
(define-syntax-rule (my-if tst thn els) (cond [tst thn]
                                              [else els]))

(define (jean-if tst thn els)
  (cond [tst thn]
        [else els]))

(my-if true 1 2)
(my-if (even? (random 20)) (displayln 'yes) (displayln 'no))