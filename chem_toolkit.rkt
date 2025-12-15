#lang racket
(require rackunit)

; Green Chemical Process Modeling Toolkkit (Racket)
; (Function Programming / Engineering Systems / Sustainability)
; Designed to assist teachings in programming lofic, math modeling, and engineering computation.
; Preforms:
;      - Unit Conversions
;      - Basic Stoichiometry
;      - Ideal Gas Law Solver
;      - Percent Yield Calculator
;      - Reaction Half-Life Caculator
;      - Determinant + Invertibility Checker
;      - Material Balances
;      - Concentrations
;      - Yields
;      - Simple Process Flows

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

; g->Kg: converts grams (g) to kilograms (Kg).
; number -> number
(define (g->Kg g)
  (* g .001))

(check-equal? (g->Kg 212)
              .212)

; Kg->g: converts kilograms (Kg) to grams (g).
; number -> number
(define (Kg->g Kg)
  (* Kg 1000))

(check-equal? (Kg->g 32)
              32000)


; converts: converts a number from one unit to another.
; number string string -> number

(define (converts num str1 str2)
  (cond
    [(and (string=? str1 "nm") (string=? str2 "A"))          (nm->angstrom num)]
    [(and (string=? str1 "A") (string=? str2 "nm"))          (angstrom->nm num)]
    
    [(and (string=? str1 "L") (string=? str2 "mL"))          (L->mL num)]
    [(and (string=? str1 "mL") (string=? str2 "L"))          (mL->L num)]

    [(and (string=? str1 "g") (string=? str2 "Kg"))           (g->Kg num)]
    [(and (string=? str1 "Kg") (string=? str2 "g"))            (Kg->g num)]

    [else (error "Conversion from ~a to ~a is not defined.\n" str1 str2)]))


(check-equal? (converts 15 "nm" "A")
              150)
(check-within (converts 179 "A" "nm")
              17.9 .1)
(check-equal? (converts 300 "mL" "L")
              .300)
(check-within (converts .79 "L" "mL")
              790 1)

(check-within (converts 12.001 "g" "Kg")
              0.012 .01)
(check-within (converts (* 9.109 1000) "Kg" "g")
              9109000 .01)

; average: takes a list of measurements, and returns an average.
; (lst of num) -> num
(define (average lst)
  (/ (apply +
          lst)
     (length lst)))

(check-equal? (average (list 2 3 4))
              3)
(check-equal? (average '(98 100 102))
             100)

; material-balance: models a simple single-step chemical process.
; Applied conservation of mass with process losses.
; num (0-1) -> (lst of num)
(define (material-balance feed-mass loss-fraction)
  (let ([waste
           (* feed-mass loss-fraction)]
        [product
           (- feed-mass (* feed-mass loss-fraction))])
         (list product waste)))

(check-within (material-balance 100 0.1)
              '(90 10) 1)
(check-within (material-balance 50 .2)
              '(40 10) 1)

; percent-yield: calculates percent yield of a process.
; Measures process efficiency relative to ideal output.
; num num -> num
(define (percent-yield actual ideal)
  (* (/ actual ideal) 100))

(check-within (percent-yield 23 86)
              26.7 .1)
(check-within (percent-yield 45 50)
              90 .1)

; material-efficiency: computes fraction of material converted to prodct.
; num num -> num
(define (material-efficiency product feed)
  (/ product feed))

(check-within (material-efficiency 90 100)
              .9 .001)
(check-within (material-efficiency 73 85)
              .858 .001)
  
; run-process: simulates a green chemical process and returns key metrics.
; num num -> (lst of num)
(define (run-process feed-mass loss-fraction)
  (let* ([results (material-balance feed-mass loss-fraction)]
        [product (first results)]
        [waste (second results)]
        [efficiency (material-efficiency product feed-mass)])
    (list product waste efficiency)))

(check-within (run-process 100 0.1)
              '(90 10 0.9) 0.1)
(check-within (run-process 50 0.2)
              '(40 10 0.8) 0.1)