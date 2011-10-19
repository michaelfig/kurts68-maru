(define-form set-car! (c v)
  `(set-oop-at ,c 0 ,v))

(define-form set-cdr! (c v)
  `(set-oop-at ,c 1 ,v))

(define x (cons 'a 'd))
(set-car! x '1)
(set-cdr! x '2)
x
