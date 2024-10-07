
; Here declare propositions to show if the 1e sat
(declare-const Q Bool)
(declare-const P Bool)
(declare-const R Bool)


; check if (((P ^ Q) ^ (Q -> ~R)) ^ ((P -> R) ^ (~Q -> R))) sat
(echo "(((P ^ Q) ^ (Q -> ~R)) ^ ((P -> R) ^ (~Q -> R))) =>  result : true")

(assert (or (= Q true) (= Q false)))
(assert (or (= P true) (= P false)))
(assert (or (= R true) (= R false)))

(assert (= (and (and (and P Q) (implies Q (not R))) (and (implies P R) (implies (not Q) R))) true))

(echo "Is the formula satisfiable or unsatisfiable?")
(check-sat)

(echo "")

; After runing the z3 file i found that 1e is unsatisfiable ,
; because there is no case for (((P ^ Q) ^ (Q -> ~R)) ^ ((P -> R) ^ (~Q -> R))) : true) that return true as a result




