#lang racket

(require web-server/servlet
         web-server/servlet-env)

(define (app request)
  (response/xexpr
   `(html
     (head
      (meta ((charset "utf-8")))
      (meta ((name "viewport")
             (content "width=device-width,initial-scale=1")))
      (title "Count Changes"))
     (body
      (h1 "Count Changes")))))

(serve/servlet app
               #:launch-browser? #f
               #:port 3000
               #:servlet-path "/")
