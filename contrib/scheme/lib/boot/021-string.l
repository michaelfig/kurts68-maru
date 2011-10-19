(define-form string-ref (s i)
  `(string-at ,s ,i))

(define-form string-set! (s i e)
  `(set-string-at ,s ,i ,e))

