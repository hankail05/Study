#lang sicp
(define (install-raise-package)
  (define (raise-integer-to-rational n) (make-rational (contents n) 1))
  (define (raise-rational-to-real x) (make-real (/ (numer x) (denom x))))
  (define (raise-real-to-complex x) (make-compelx-from-real-imag (contents x) 0))

  (put 'raise '(integer) raise-integer-to-rational)
  (put 'raise '(rational) raise-rational-to-real)
  (put 'raise '(real) raise-real-to-complex)
  'done)

(define (raise x) (apply-generic 'raise x))