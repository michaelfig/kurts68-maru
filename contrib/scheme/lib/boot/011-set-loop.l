
(define-form let-loop (name var-inits . body)
  (let-loop-form name var-inits body))

(define-function let-loop-form (name var-inits body)
  (let ((vars (let-loop-vars var-inits))
	(inits (let-loop-inits var-inits)))
    `(let ((,name '()))
       (set! ,name (lambda ,vars ,@body))
       (,name ,@inits))
    ))

(define-function let-loop-vars (var-inits)
  (if var-inits
    (cons (caar var-inits) (let-loop-vars (cdr var-inits)))
    '()
  ))

(define-function cadar (x)
  (car (cdr (car x))))

(define-function let-loop-inits (var-inits)
  (if var-inits
    (cons (cadar var-inits) (let-loop-inits (cdr var-inits)))
    '()
  ))

(let-loop 
 loop ((a 2) (b 0))
 (if (> a 0)
     (loop (- a 1) (+ b 1))
     b))
