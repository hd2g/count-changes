#lang info
(define collection "count-changes-frontend")
(define deps '("base" "web-server"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/count-changes-frontend.scrbl" ())))
(define pkg-desc "spa frontend for count change")
(define version "0.0.1")
(define pkg-authors '(hd2g))
(define license '(BSD-3-Clause))
