
; Here declare propositions to show what they will order
; 'G' for Greoger, 'N' for Natasha, 'B' for Bob, 'L' for Lisa, 'F' for Frank, 'S' for Seifred and 'I' for Ivan
; To get the solution i wrote formulas for all the conditions (1 .. to 8)
; for condition number 1 i let all the propositions take true or false as a value  (true means beer and false means wine)
; for condition number 2 to be sure that Seifred will definitely order a wine i used the only case of the implication that return false as result (~S -> S) in this way the only case that will return false as a result is to give 'S' the value false  [~(false ) -> false  => true -> false  will give false as a result].

; for condition number 3 i used the following formula using the equivalence accorfing to "if and only if"  F <-> B with the result value "true" which means  if 'F' orders a beer then  'B' also orders a beer, if 'F' does not order a beer then 'B' also does not ordera beer, but because i only can use the commands given in table 1 i wrote the followinf formula which will give the same results as the  equivalence (<->) : (f -> B) ^ (B -> F) so the only way to get true as a result is to give both F and B true as a value

; for condition number 4 i used the following formula  (B ^ L) -> ~N with the result value "false", so the only way to get false as a result is to give all of 'L', 'B' and 'N' true as a value, i.e. if  give 'L' false as a value  and both of 'B' and 'N' take false as a value then we will get (true ^ false) -> ~true => which will give true as a result.

; for condition number 5 i used the following formula  (G ^ L) V (~G ^ ~L) with the result value "true" so the only way to get true as a result we have to give both of 'G' and 'L' true or false  as a value this mean to get true as a result the value of 'G' must be equal to the value of 'L'

; for condition number 6 i used the following formula ~f -> ~G with the result vale "true", so the only case to avoid getting false as a result so my formula satisfied is not to give 'F' "false"  as a value  and give 'G' "true" as a value because in this case : ~false -> ~true => true -> false  which will return false as a result.

; for condition number 7  i used the easy formula  ( I v G v L ) with the result value true, this mean of at least one of them has the value true then we will get true as a result 

; for condition number 8 i used again instade of the equivalence(because of "if and only if") i wrote the following formula  (L -> ~s) ^ (~S -> L) with the result vale true which will return the same result as L <-> ~S, so if 'S' take the value false (wine) then the only way way to get true as a result  is to give 'L' the value true: (true -> ~false) ^ (~true -> true)  = > ( true -> true) ^ (true -> true) then we will get true as a result, to make it more clear let us give 'L' the value  "true" and 'S' the value "true", os both of them order beer: (true -> ~true) ^ (~true -> true) => (true -> false )  ^ (false -> true) => false ^ true which  will give fase as a result.

(declare-const G Bool)
(declare-const N Bool)
(declare-const B Bool)
(declare-const L Bool)
(declare-const F Bool)
(declare-const S Bool)
(declare-const I Bool)


; true => beer and false => wine

; 1. Everybody must order either beer, or wine

(assert (or (= G true) (= G false)))
(assert (or (= N true) (= N false)))
(assert (or (= B true) (= B false)))
(assert (or (= L true) (= L false)))
(assert (or (= F true) (= F false)))
(assert (or (= S true) (= S false)))
(assert (or (= I true) (= I false)))

; 2. Seifred will definitely order a wine 
(echo "Seifred will definitely order a wine ")
(assert (= (implies (not S) S) false))
(check-sat)

; 3. Bob orders a beer if and only if Frank orders a beer
(echo "Bob orders a beer if and only if Frank orders a beer ")
(assert (= (and (implies F B) (implies B F) ) true))
(check-sat)


; 4.If both Lisa and Bob order a beer, then Natasha also roder a beer
(echo "If both Lisa and Bob order a beer, then Natasha also roder a beer ")
(assert (= (implies (and B L) (not N)) false))
(check-sat)


; 5.Either Gregor and Lisa both order a beer, or they both order a wine
(echo "Either Gregor and Lisa both order a beer, or they both order a wine ")
(assert (= (or (and G L) (and (not G) (not L))) true))
(check-sat)


; 6.If Frank orders a wine, then Gregor does not order a beer
(echo "If Frank orders a wine, then Gregor does not order a beer ")
(assert (= (implies (not F) (not G)) true))
(check-sat)


; 7. At least one of Ivan, Gregor and Lisa orders a beer
(echo "At least one of Ivan, Gregor and Lisa orders a beer ")
(assert (=  (or I G L) true))
(check-sat)


; 8.Lisa orders a beer if and only if Seifred orders a wine
(echo "Lisa orders a beer if and only if Seifred orders a wine ")
(assert (=  (and (implies L (not S)) (implies (not S) L)) true))
(check-sat)

(echo "")

(echo "true means => Beer, false means => Wine") 
(echo "Gregor orders :")
(get-value (G))
(echo "Natasha orders :")
(get-value (N))
(echo "Bob orders :")
(get-value (B))
(echo "Lisa orders :")
(get-value (L))
(echo "Frank orders :")
(get-value (F))
(echo "Seifred orders :")
(get-value (S))
(echo "Ivan orders :")
(get-value (I))



