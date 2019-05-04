# Sistema Especialista Surf - IA
## Gabriel Civinski; William Lohn

**1. Introdução**  
Neste relatório será detalhada a implementação de um Sistema Especialista Fuzzy utilizando a ferramenta FuzzyClips. A finalidade do sistema é determinar as condições para SURF em um local específico, considerando como variáveis auxiliares a altura média das ondas e a velocidade do vento. As variáveis linguísticas de entrada e saída são mostradas na Tabela 1:

 | | | Velocidade vento | | |
------------|-----------------|------------|-----------------|-----------------
**Altura onda** | **Fraco** | **Médio** | **Forte** | **Muito forte**
Baixa | ruim | ruim | ruim | ruim
Média | boa | razoavel | razoavel | ruim
Alta | muito boa | boa | razoavel | ruim
Muito alta | muito boa | razoavel | ruim | ruim

Na primeira coluna estão relacionados os valores referentes à altura média das ondas, enquanto na primeira linha, estão os valores para determinar a velocidade/força do vento. Cruzando os valores, temos definida a condição para surf.

**2. Implementação e testes**  
Para cada variável linguística foi definido um template, conforme a seguir. Para a variável linguística “altura_onda” teremos uma função pré-definida (z) e três trapezoidal.

![Figura 1](/img/1.PNG)

Na figura 2 temos a representação gráfica dos possíveis valores para a altura da onda, definidos em seu template (valores em cm).

![Figura 2](/img/2.PNG)

Na figura 3 podemos observar o template definido para a força do vento.

![Figura 3](/img/3.PNG)

E a seguir, na figura 4, podemos observar a representação gráfica deste template (valores em km/h).

![Figura 4](/img/4.PNG)

Na figura 5 podemos observar o template definido para as condições de surf

![Figura 5](/img/5.PNG)

Abaixo, na figura 6, podemos observar a representação gráfica do mesmo.

![Figura 6](/img/6.PNG)

As regras que vão definir a condição para surf foram codificadas em quatro defrule’s distintos, um para cada variável linguística e condição. A utilização da declaração “salience” foi a solução adotada para garantir que essas regras fossem executadas antes da regra de defuzzificação.

![Figura 7-1](/img/7_1.PNG)
![Figura 7-2](/img/7_2.PNG)

Para a defuzzificação foi definida uma variável global (g_resultado) e foi criada uma outra regra (defrule defuzifica) com salience 0, para que dessa forma, ela seja executada após todas as demais regras declaradas com salience 10, para assim, podermos ter o resultado das condições.

![Figura 8 e 9](/img/8-9.PNG)

Para testes, definimos fatos fixos com a função “deffacts”

![Figura 10](/img/10.PNG)

A seguir, podemos ver o resultado gerado pela aplicação.

![Figura 11](/img/11.PNG)

Podemos observar que a condição foi categorizada como “RUIM”, pelo fato de a altura das ondas ser baixa.

**3. Conclusão**  
Uma implementação como essa pode ser implementada em aplicações simples, voltadas para surfistas. Em um futuro com melhorias também é possível adicionar outras variáveis para a execução de um cálculo mais preciso, como o clima (seco, chuvoso), força e altura da maré, etc.
