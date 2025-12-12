#lang racket
(require rackunit)

; Chemical Engineering Calculator
; Designed to assist teachings in programming lofic, math modeling, and engineering computation.
; Preforms:
;      - Unit Conversions
;      - Basic Stoichiometry
;      - Ideal Gas Law Solver
;      - Percent Yield Calculator
;      - Reaction Half-Life Caculator
;      - Determinant + Invertibility Checker

; Day 1: Unit Conversion Functions
; nm->angstrom: converts a lengthvalue in nanometeres (nm) to angstroms (A).
; number -> number
; Formula 1 nm = 10 A
 (define (nm->angstrom nm)
   (* nm 10))

(check-equal? (nm->angstrom 5)
              50)

; angstrom->nm: converts a lengthvalue in angstroms (A) to nanometers (nm).
; number -> number
; Formula 1 A = 0.1 nm
(define (angstrom->nm angstrom)
  (* angstrom 0.1))

(check-equal? (angstrom->nm 25)
              2.5)

; L->mL: converts liters (L) to mililiters (mL).
; number -> number
; Formula: 1 L = 1000 mL
(define (L->mL L)
  (* L 1000))

; mL->L: converts mililiters (mL) to liters (L).
; number -> number
; Formula: 1 mL = .001 L
(define (mL->L mL)
  (* mL .001))



; converts: converts a number from one unit to another.
; number string string -> number

(define (converts num str1 str2)
  (cond
    [(and (string=? str1 "nm") (string=? str2 "A"))          (nm->angstrom num)]
    [(and (string=? str1 "A") (string=? str2 "nm"))          (angstrom->nm num)]
    
    [(and (string=? str1 "L") (string=? str2 "mL"))          (L->mL num)]
    [(and (string=? str1 "mL") (string=? str2 "L"))          (mL->L num)]

    [else (error "Conversion from ~a to ~a is not defined.\n" str1 str2)]))


(check-equal? (converts 15 "nm" "A")
              150)
(check-within (converts 179 "A" "nm")
              17.9 .1)
(check-equal? (converts 300 "mL" "L")
              .300)
(check-within (converts .79 "L" "mL")
              790 1)
              