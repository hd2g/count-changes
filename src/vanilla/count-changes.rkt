#lang racket

(provide (all-defined-out))

(define (repeat n x)
  (map (const x) (range n)))

(define (trunc a b)
  (values (/ a b) (modulo a b)))

(define divisors (list 10000 5000 1000 500 100 50 10 5 1))

(define (calc% x divisor)
  (let-values (((r m) (trunc x divisor)))
    (values (repeat (truncate r) divisor) m)))

(define (fst lis)
  (unless (null? lis)
    (car lis)))

(define (calc x (divisors divisors))
  (let go ((x x) (divisors divisors) (acc (list)))
    (let ((divisor (fst divisors)))
      (unless (void? divisor)
        (let-values (((rs m) (calc% x divisor)))
          (if (zero? m)
              (append acc rs)
              (go m (cdr divisors) (append acc rs))))))))

(define (frequencies lis)
  (map (lambda (lis)
         (cons (car lis)
               (length lis)))
       lis))

(define (solve x (divisors divisors))
  (let ((calced (calc x divisors)))
    (unless (void? calced)
      (frequencies (group-by identity calced)))))

(module+ main
  (require racket/cmdline)

  (command-line
   #:program "change money calculater"
   #:args (x)
   ;; entry point
   (let ((y (string->number x)))
     (when y
       (solve y)))))

(module+ test
  (require rackunit)

  (for-each
   (lambda (x)
     (check (apply + (calc x)) x))
   (range 123456)))

