
;copia e cola primeiro na IDE

(defglobal ?*g_resultado* = 0)

(deftemplate altura_onda
    0 300 altura_onda
    ((baixa (z 0 50))
    (media (50 0)(50 1)(130 1)(130 0))
    (alta (130 0)(130 1)(200 1)(200 0))
    (muito_alta (200 0)(300 1))
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
    0 40
    ((ruim (0 0)(5 1)(10 0))
    (razoavel (10 0)(15 1)(20 0))
    (boa (20 0)(25 1)(30 0))
    (muito_boa (30 0)(35 1)(40 0))
    )
)

(defrule Um
     (altura_onda baixa)
        (vento fraco)
    =>
    (assert (condicoes ruim))
)

(defrule Dois
(altura_onda media)
        (vento fraco)
    =>
    (assert (condicoes boa))
)

(defrule Tres
    (declare (salience 10))
    (or (altura_onda alta)
        (vento fraco))
    =>
    (assert (condicoes muito_boa))
)

(defrule Quatro
    (declare (salience 10))
    (or (altura_onda muito_alta)
        (vento fraco))
    =>
    (assert (condicoes razoavel))
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
    (altura_onda media)
    (vento fraco)
)

;(deffacts gorjeta
;    (servico (6 0)(6 1)(6 0))
;    (comida (8 0)(8 1)(8 0))
;)


;copia e cola depois na IDE
;(plot-fuzzy-value t "+*-" 0 50 (create-fuzzy-value vento fraco)
;(create-fuzzy-value vento medio)(create-fuzzy-value vento forte)(create-fuzzy-value vento muito_forte))

;(plot-fuzzy-value t "+*-" 0 10 (create-fuzzy-value comida regular)
;(create-fuzzy-value comida deliciosa))

;(plot-fuzzy-value t "+*-" 0 30 (create-fuzzy-value gorjeta pouca)
;(create-fuzzy-value gorjeta media)(create-fuzzy-value gorjeta generosa))