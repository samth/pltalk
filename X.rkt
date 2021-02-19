#lang racket

(provide #%module-begin #%top-interaction
         X S K I #%app #%datum)

(define (((S x) y) z) ((x z) (y z)))
(define ((K x) y) x)
(define (X x) ((x S) K))
(define (I x) x)

(module reader syntax/module-reader
  pltalk/X)
