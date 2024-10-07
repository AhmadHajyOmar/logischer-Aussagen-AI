
; Here declare propositions to show if the 1b sat
(declare-const P1 Bool)
(declare-const R1 Bool)

; Here declare propositions to show if the 1b unsat and already sat for P and Q then it's tautology 
(declare-const P2 Bool)
(declare-const R2 Bool)

; check if R -> ((R V P) ^ ~P) sat
(echo "R -> ((R V P) ^ ~P) =>  result : true")

(assert (or (= P1 true) (= P1 false)))
(assert (or (= R1 true) (= R1 false)))

(assert (= (implies  R1 (and  (or R1 P1) (not P1))) true))

(echo "Is the formula satisfiable or unsatisfiable?")
(check-sat)
(get-value (P1))
(get-value (R1))
(echo "If unsat in the first check ignore the second check, because the formula is unsatisfiable")

(echo "")



; check if R -> ((R V P) ^ ~P) sat and there is no case that sat if R -> ((R V P) ^ ~P) is eqaul to false
; if unsat then it's a tautology

(echo "R -> ((R V P) ^ ~P) =>  result : false")
(echo "Is the formula satisfiable or unsatisfiable?")

(assert (or (= P2 true) (= P2 false)))
(assert (or (= R2 true) (= R2 false)))

(assert (= (implies  R2 (and  (or R2 P2) (not P2))) false))
(check-sat)
(get-value (P2))
(get-value (R2))
(echo "If sat in the first check and unsat in the second check, then the formula is a tautology, otherwise it's satisfiable")

; As we see here after checking if 1b sat, if yes then 
; we have to check if there is any case that sat if R -> ((R V P) ^ ~P) is eqaul to false,
; if there is no case then 1b is a tautology

; After runing the z3 file i found that  1b is not a tautologie but it's satisfiable,
; because the formula is satisfiable  (i.e. if both P and R are equal to false)and there is a case {for R -> ((R V P) ^ ~P) =>  result : false) }
; that return false as a result  when both R and P take true as a value .




