#lang racket

(require "vanilla/count-changes.rkt")

(module+ main
  (require racket/cmdline)

  (command-line
   #:program "count-changes"
   #:args (amount)
   (let ((y (string->number amount)))
     (when y
       (solve y)))))
