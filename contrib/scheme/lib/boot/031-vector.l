(define-function vector args
  (list->array args))

(define-function make-vector (k . fill)
  (let ((v (array k)))
    (if (pair? fill)
	(let ((i 0) (e (car fill)))
	  (while (< i k)
	    (vector-set! v i e)
	    (set! i (+ i 1)))))
    v))

(define vector? array?)
 
(define-function vector-ref (v i)
  (array-at v i))

(define-function vector-set! (v i e)
  (set-array-at v i e))

