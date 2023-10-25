#lang racket

(provide (all-defined-out))

(require web-server/servlet
         web-server/servlet-env)

(define app-name "Count Changes")

(define (header title href)
  `(div
    (a ((alt ,app-name) (href ,href))
      (h1 ,app-name))))

(define give-an-amount
  `(div
    (label
     "How match?"
     (input ((id "amount") (type "number"))))))

; (define (give-an-amount amount)
;   (call/cc
;    (lambda (k)
;      (let go ()
;        (k
;         (lambda (embed/url)
;           (let ((
;           `(div
;             (label
;              "How match?"
;              (input ((id "amount")
;                      (type "number"))))))

(define contents
  `(main
    ,(header app-name "/")
    ,give-an-amount))

; (define (app request)
;   (define amount (make-web-cell 0))

;   (send/suspend/dispatch
;    (lambda (embed/url)
;      (response/xexpr
;       `(html
;         (head
;          (meta ((charset "utf-8")))
;          (meta ((name "viewport")
;                 (content "width=device-width,initial-scale=1")))
;          (title ,app-name))
;         (body
;          ,contents))))))

(define (app request)
   (response/xexpr
    `(html
      (head
       (meta ((charset "utf-8")))
       (meta ((name "viewport")
              (content "width=device-width,initial-scale=1")))
       (title ,app-name))
      (body
       ,contents))))

(define (main)
  (serve/servlet app
                 #:launch-browser? #f
                 #:port 3000
                 #:servlet-path "/"))

(module+ main
  (main))
