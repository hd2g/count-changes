#lang typed/racket

(provide (all-defined-out))

(: repeat (All (a) (-> Natural a (Listof a))))
(define (repeat n x)
  (map (const x) (range n)))

(: trunc (-> Number Number (Values Number Number)))
(define (trunc a b)
  (values (/ a b)
          (cast (modulo (cast a Integer) (cast b Integer)) Number)))

(: fst (All (a) (-> (Listof a) (U a Void))))
(define (fst lis)
  (unless (null? lis)
    (car lis)))

(: *divisors* (Listof Natural))
(define *divisors* (list 10000 5000 1000 500 100 50 10 5 1))

(: calc% (-> Number Natural (Values (Listof Natural) Number)))
(define (calc% x divisor)
  (let-values (((r m) (trunc x divisor)))
    (values (repeat (cast (truncate (cast r Real)) Natural) divisor)
            m)))

(: calc (->* (Number) ((Listof Natural)) (U (Listof Natural) Void)))
(define (calc x (divisors *divisors*))
  (let go ((x : Number x)
           (divisors : (Listof Natural) divisors)
           (acc : (Listof Natural) (list)))
    (let ((divisor (fst divisors)))
      (unless (void? divisor)
        (let-values (((rs m) (calc% x divisor)))
          (if (zero? m)
              (append acc rs)
              (go m (cdr divisors) (append acc rs))))))))

(: frequencies (-> (Listof (Listof Any)) (Listof (Pairof Any Natural))))
(define (frequencies xss)
  (map
   (lambda (xs)
     (cons (car xs)
           (cast (length xs) Natural)))
   xss))

; (: solve (->* (Number) ((Listof Natural))
;               (U (Listof (Pair Natural Natural)) Void)))
; (define (solve x (divisors *divisors*))
;   (let ((calced (calc x divisors)))
;     (unless (void? calced)
;       (frequencies (group-by identity calced)))))

; (module+ main
;   (require racket/cmdline)

;   (command-line
;    #:program "change money calculater"
;    #:args (x)
;    ;; entry point
;    (let ((y (string->number x)))
;      (when y
;        (solve y)))))
