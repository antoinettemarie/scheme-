;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname core) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (spp)
  ())

(define (eval exp env)
  (cond ((self-eval? exp)
         exp)
        ((variable? exp)
         (look-up exp env))
        ((quote? exp)
         (eval-quote exp))
        ((assignment? exp)
         (eval-assignment exp env))
        ((definition? exp)
         (eval-definition exp env))
        ((class-definition? exp)
         (eval-class-definition exp env))
        ((control-flow? exp)
         (eval-control-flow exp env))
        ((lambda? exp)
         (make-proc (proc-params exp)
                    (proc-body exp)
                    env))
        ((begin? exp)
         (eval-sequence exp env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (eval (list-of-values (operands exp) env) env)))
        (else (printf "UNKNOWN EXPRESSION TYPE: ~a" exp))))

(define (apply proc args)
  ())