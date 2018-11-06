#lang sicp
(define (and-clauses exp) (cdr exp))
(define (or-clauses exp) (cdr exp))
(define (first-exp exp) (car exp))
(define (rest-exps exp) (cdr exp))
(define (null-exp? exp) (null? exp))
(define (last-exp? exp) (null? (cdr exp)))

(define (and? exp)
  (tagged-list? exp 'and))
(define (eval-and exp env)
  (if (null-exp? exp)
      false
      (let ((first (first-exp exp))
            (rest (rest-exps exp)))
        (cond ((last-exp? exp) first)
              (first (eval-and rest env))
              (else false)))))

(define (or? exp)
  (tagged-list? exp 'or))
(define (eval-or exp env)
    (if (null-exp? exp)
        false
        (let ((first (first-exp exp))
              (rest (rest-exps exp)))
          (cond ((last-exp? exp) first)
                (first true)
                (else (eval-or rest env))))))


(define (and->if exp)
  (expand-and-clauses (and-clauses exp)))
(define (expand-and-clauses exp)
  (let ((first (first-exp exp))
        (rest (rest-exps exp)))
    (cond ((null-exp? exp) false)
          ((last-exp? exp) first)
          (else (make-if (cond-predicate first)
                         (and->if rest)
                         false)))))

(define (or->if exp)
  (expand-clauses (or-clauses exp)))
(define (expand-or-clauses exp)
  (let ((first (first-exp exp))
        (rest (rest-exps exp)))
    (cond ((null-exp? exp) false)
          ((last-exp? exp) first)
          (else (make-if (cond-predicate first)
                         true
                         (or->if rest))))))