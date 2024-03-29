
;copia e cola primeiro na IDE

(defglobal ?*g_resultado* = 0)

(deftemplate altura_onda
    0 300 altura_onda
    ((baixa (z 0 50))
    (media (51 0)(51 1)(130 1)(130 0))
    (alta (131 0)(131 1)(200 1)(200 0))
    (muito_alta (201 0)(300 1))
    )
)

(deftemplate vento
    0 50 vento
     ((fraco (z 0 10))
    (medio (10 0)(10 1)(18 1)(18 0))
    (forte (19 0)(29 1)(30 1)(30 0))
    (muito_forte (30 0)(50 1))
    )
)

(deftemplate condicoes
    0 4
    ((ruim (0 0)(0.5 1)(1 0))
    (razoavel (1.1 0)(1.5 1)(2 0))
    (boa (2.1 0)(2.5 1)(3 0))
    (muito_boa (3.1 0)(3.5 1)(4 0))
    )
)

(defrule ruim
		(declare (salience 10))
		(or(and (altura_onda baixa)(vento fraco))
		   (and (altura_onda baixa)(vento medio))
           (and (altura_onda baixa)(vento forte))
           (and (altura_onda baixa)(vento muito_forte))
           (and (altura_onda media)(vento muito_forte))
		   (and (altura_onda alta)(vento muito_forte))
           (and (altura_onda muito_alta)(vento muito_forte))
           (and (altura_onda muito_alta)(vento forte))
		)
		=>
		(assert (condicoes ruim))
	)

(defrule razoavel
		(declare (salience 10))
		(or(and (altura_onda media)(vento forte))
		   (and (altura_onda media)(vento medio))
           (and (altura_onda muito_alta)(vento medio))
           (and (altura_onda alta)(vento forte))
		)
		=>
		(assert (condicoes razoavel))
	)

(defrule boa
		(declare (salience 10))
		   (or(and (altura_onda alta)(vento medio))
           (and (altura_onda media)(vento fraco))
		)
		=>
		(assert (condicoes boa))
	)

(defrule muito_boa
		(declare (salience 10))
		   (or(and (altura_onda muito_alta)(vento fraco))
           (and (altura_onda alta)(vento fraco))
		)
		=>
		(assert (condicoes muito_boa))
	)

(defrule defuzifica
    (declare (salience 0))
    ?v_tmp <- (condicoes ?)
    =>
    (bind ?*g_resultado*(moment-defuzzify ?v_tmp))
    (plot-fuzzy-value t "*" nil nil ?v_tmp)
    (retract ?v_tmp)
    (printout t "Condição para surf: ")
    (printout t ?*g_resultado* crlf)
    (printout t ">>> TERMINOU <<<" crlf)
)

(deffacts condicoes
    (altura_onda baixa)
    (vento fraco)
)


;copia e cola depois na IDE
;(plot-fuzzy-value t "+*-" 0 50 (create-fuzzy-value vento fraco)
;(create-fuzzy-value vento medio)(create-fuzzy-value vento forte)(create-fuzzy-value vento muito_forte))

;(plot-fuzzy-value t "+*-" 0 4 (create-fuzzy-value condicoes ruim)
;(create-fuzzy-value condicoes razoavel)(create-fuzzy-value condicoes boa)(create-fuzzy-value condicoes muito_boa))

;(plot-fuzzy-value t "+*-" 0 300 (create-fuzzy-value altura_onda baixa)
;(create-fuzzy-value altura_onda media)(create-fuzzy-value altura_onda alta)(create-fuzzy-value altura_onda muito_alta))