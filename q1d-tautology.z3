
; Here declare propositions to show if the 1d sat
(declare-const Q1 Bool)
(declare-const P1 Bool)
(declare-const R1 Bool)

; Here declare propositions to show if the 1d unsat and already sat for P, R and Q then it's tautology 
(declare-const Q2 Bool)
(declare-const P2 Bool)
(declare-const R2 Bool)

; check if ((P V Q) <-> R) V (~R V ~P) sat
(echo "((P V Q) <-> R) V (~R V ~P) =>  result : true")

(assert (or (= Q1 true) (= Q1 false)))
(assert (or (= P1 true) (= P1 false)))
(assert (or (= R1 true) (= R1 false)))

(assert (= (or (and (implies (or P1 Q1) R1) (implies R1 (or P1 Q1)))(or (not R1)(not P1))) true))

(echo "Is the formula satisfiable or unsatisfiable?")
(check-sat)
(get-value (P1))
(get-value (Q1))
(get-value (R1))
(echo "If unsat in the first check ignore the second check, because the formula is unsatisfiable")

(echo "")



; check if ((P-> R) ^ (Q -> R)) ^ ~(~Q ^(~R V P)) sat and there is no case that sat if ((P V Q) <-> R) V (~R V ~P) is eqaul to false
; if unsat then it's a tautology

(echo "((P V Q) <-> R) V (~R V ~P) =>  result : false")
(echo "Is the formula satisfiable or unsatisfiable?")

(assert (or (= Q2 true) (= Q2 false)))
(assert (or (= P2 true) (= P2 false)))
(assert (or (= R2 true) (= R2 false)))

(assert (= (or (and (implies (or P2 Q2) R2) (implies R2 (or P2 Q2)))(or (not R2)(not P2))) false))
(check-sat)

(echo "If sat in the first check and unsat in the second check, then the formula is a tautology, otherwise it's satisfiable")

; As we see here after checking if 1d sat, if yes then 
; we have to check if there is any case that sat if ((P V Q) <-> R) V (~R V ~P) is eqaul to false,
; if there is no case then 1d is a tautology

; After runing the z3 file i found that  1d is a tautology,
; because the formula is satisfiable (i.e. if all of P, R and Q take false as a value) and there is no case 
; {for ((P V Q) <-> R) V (~R V ~P) : false) }
; that return false as a result




