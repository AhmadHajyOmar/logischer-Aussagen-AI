
; Here declare propositions to show if the 1a sat
(declare-const Q1 Bool)
(declare-const P1 Bool)

; Here declare propositions to show if the 1a unsat and already sat for P and Q then it's tautology 
(declare-const Q2 Bool)
(declare-const P2 Bool)

; check if (P -> Q) V ( Q -> P) sat
(echo "(P -> Q) V ( Q -> P) =>  result : true")
(assert (or (= Q1 true) (= Q1 false)))
(assert (or (= P1 true) (= P1 false)))
(assert (= (or (implies P1 Q1) (implies Q1 P1)) true))
(echo "Is the formula satisfiable or unsatisfiable?")
(check-sat)
(get-value (P1))
(get-value (Q1))
(echo "If unsat in the first check ignore the second check, because the formula is unsatisfiable")

(echo "")



; check if (P -> Q) V ( Q -> P) sat and there is no case that sat if (P -> Q) V ( Q -> P) is eqaul to false
; if unsat then it's a tautology
(echo "(P -> Q) V ( Q -> P) =>  result : false")
(echo "Is the formula satisfiable or unsatisfiable?")
(assert (or (= Q2 true) (= Q2 false)))
(assert (or (= P2 true) (= P2 false)))
(assert (= (or (implies P2 Q2) (implies Q2 P2)) false))
(check-sat)
(echo "If sat in the first check and unsat in the second check, then the formula is a tautology")

; As we see here after checking if 1a sat, if yes then 
; we have to check if there is any case that sat if (P -> Q) V ( Q -> P) is eqaul to false,
; if there is no case then 1a is a tautology

; After runing the z3 file i found that  1a is a tautology,
; because the formula is satisfiable (i.e. if both P and Q are equal to false)  and there is no case {for (P -> Q) V ( Q -> P) =>  result : false) }
; that return false as a result .




