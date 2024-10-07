
; Here declare propositions to show if the 1c sat
(declare-const Q1 Bool)
(declare-const P1 Bool)
(declare-const R1 Bool)

; Here declare propositions to show if the 1c unsat and already sat for P, R and Q then it's tautology 
(declare-const Q2 Bool)
(declare-const P2 Bool)
(declare-const R2 Bool)

; check if ((P-> R) ^ (Q -> R)) ^ ~(~Q ^(~R V P)) sat
(echo "((P-> R) ^ (Q -> R)) ^ ~(~Q ^(~R V P)) =>  result : true")

(assert (or (= Q1 true) (= Q1 false)))
(assert (or (= P1 true) (= P1 false)))
(assert (or (= R1 true) (= R1 false)))

(assert (= (and ( and (implies P1 R1) (implies Q1 R1)) (not(and (not Q1) (or (not R1) P1)))) true))

(echo "Is the formula satisfiable or unsatisfiable?")
(check-sat)
(get-value (P1))
(get-value (Q1))
(get-value (R1))
(echo "If unsat in the first check ignore the second check, because the formula is unsatisfiable")

(echo "")



; check if ((P-> R) ^ (Q -> R)) ^ ~(~Q ^(~R V P)) sat and there is no case that sat if ((P-> R) ^ (Q -> R)) ^ ~(~Q ^(~R V P)) is eqaul to false
; if unsat then it's a tautology

(echo "((P-> R) ^ (Q -> R)) ^ ~(~Q ^(~R V P)) =>  result : false")
(echo "Is the formula satisfiable or unsatisfiable?")

(assert (or (= Q2 true) (= Q2 false)))
(assert (or (= P2 true) (= P2 false)))
(assert (or (= R2 true) (= R2 false)))

(assert (= (and ( and (implies P2 R2) (implies Q2 R2)) (not(and (not Q2) (or (not R2) P2)))) false))
(check-sat)
(get-value (P2))
(get-value (Q2))
(get-value (R2))
(echo "If sat in the first check and unsat in the second check, then the formula is a tautology, otherwise it's satisfiable")

; As we see here after checking if 1c sat, if yes then 
; we have to check if there is any case that sat if ((P-> R) ^ (Q -> R)) ^ ~(~Q ^(~R V P)) is eqaul to false,
; if there is no case then 1c is a tautology

; After runing the z3 file i found that  1c is not a tautology,
; because the formula is satisfiable (i.e. if P = false, R = true and Q = false)and there is at least one case 
; {for ((P-> R) ^ (Q -> R)) ^ ~(~Q ^(~R V P)) : false) }
; that return false as a result , i.e. P = false, R = false and Q = true  => will return false as a result




