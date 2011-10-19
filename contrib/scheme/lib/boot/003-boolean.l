(define %s-t (cons "#t" "#t"))
(define %s-f (cons "#f" "#f"))

(define-form %s-if (test t . f)
  `(if (eq? %s-f ,test)
       ,(if (pair? f) (car f) '())
       ,t))

(define-function boolean? (obj)
  (or (eq? obj %s-t) (eq? obj %s-f)))

(define-form not (obj)
  `(if (eq? ,obj %s-f) %s-t %s-f))

