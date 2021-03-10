---
# Front matter
lang: ru-RU
title: "Отчет по лабораторной работе № 4. Модель гармонических колебаний"
subtitle: "дисциплина: Математическое моделирование"
author: "Наливайко Сергей Максимович"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
lof: false # List of figures
lot: false # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: lualatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Научиться моделировать гармонические колебания.

# Выполнение лабораторной работы

## Краткая теоретическая справка

Движение грузика на пружинке, маятника, заряда в электрическом контуре, а также эволюция во времени многих систем в физике, химии, биологии и других науках при определенных предположениях можно описать одним и тем же дифференциальным уравнением, которое в теории колебаний выступает в качестве основной модели. Эта модель называется линейным гармоническим осциллятором.

Уравнение свободных колебаний гармонического осциллятора имеет
следующий вид:

  $$\frac{\partial^2 x}{\partial t^2} + 2\gamma \frac{\partial x}{\partial t} + w_0^2x = 0$$

  где $x$ -  переменная, описывающая состояние системы, $\gamma$ – параметр, характеризующий потери энергии, $w_0$ – собственная частота колебаний, $t$ – время. Это уравнение есть линейное однородное дифференциальное уравнение второго порядка и оно является примером линейной динамической системы.

Для однозначной разрешимости уравнения второго порядка необходимо задать два начальных условия вида 

  $$
    \begin{cases} 
    x(t_0) = x_0 \\ 
    x''(t_0) = y_0 \\ 
    \end{cases}
  $$

Отталкиваясь от этого, можно решить данное уравнение с помощью системы 

  $$
      \begin{cases} 
      x'(t) = y \\ 
      y'(t) = -2 \gamma y - w^2_0x \\ 
      \end{cases}
  $$

## Формулировка задачи. Вариант 45

Постройте фазовый портрет гармонического осциллятора и решение уравнения
гармонического осциллятора для следующих случаев:

1. Колебания гармонического осциллятора без затуханий и без действий внешней силы $x''(t) + 17x = 0$,
2. Колебания гармонического осциллятора c затуханием и без действий внешней силы $x''(t) + 22x'(t) + 23x = 0$,
3. Колебания гармонического осциллятора c затуханием и под действием внешней силы $x''(t) + 5x'(t) + 8x = 0.25\sin{8t}$,

На интервале $t \in [0; 58]$ (шаг 0.05) с начальными условиями $x_0 = 0.2$, $y_0 = -0.3$.

## Решение задачи

1. Напишем программный код и выведем график зависимости $x$ от $x'$ (рис. -@fig:001).

  ```
  using Plots 
  using DifferentialEquations
  pyplot();

  w_sqr = 17.00;
  step = 0.05;
  t = (0.0,58.0);
  x0 = [0.2; -0.3];
  p = [w_sqr];

  function syst(dx,x,p,t)
      w = p[1];
      dx[1]  = x[2];
      dx[2] =  - w * x[1];
  end

  prob = ODEProblem(syst, x0, t, p);
  sol = solve(prob, saveat = step);
  n = length(sol.u);
  y1 = zeros(n);
  y2 = zeros(n);
  for i in 1:n
      y1[i] = sol.u[i][1];
      y2[i] = sol.u[i][2];
  end

  plot(y1, y2, xlabel = "X", ylabel = "X'", label = "График зависимости x(x')")
  title!("Фазовая зависимость")
  ```

  ![Фазовый портрет колебания гармонического осциллятора без затуханий и без действий внешней силы](screens/1.png){ #fig:001 width=70% }

2. Напишем программный код и выведем график зависимости $x$ от $x'$ (рис. -@fig:002).

  ```
  using Plots 
  using DifferentialEquations
  pyplot();

  w_sqr = 23.00;
  g = 22.00;
  step = 0.05;
  t = (0.0,58.0);
  x0 = [0.2; -0.3];
  p = [w_sqr,g];


  function syst(dx,x,p,t)
      w,g = p
      dx[1]  = x[2];
      dx[2] =  - w * x[1]  - g * x[2];
  end


  prob = ODEProblem(syst, x0, t, p);
  sol = solve(prob, saveat = step);
  n = length(sol.u);
  y1 = zeros(n);
  y2 = zeros(n);
  for i in 1:n
      y1[i] = sol.u[i][1];
      y2[i] = sol.u[i][2];
  end
  plot(y1, y2, xlabel = "X", ylabel = "X'", label = "График зависимости x(x')")
  title!("Фазовая зависимость")

  ```

  ![Фазовый портрет колебания гармонического осциллятора c затуханием и без действий внешней силы](screens/2.png){ #fig:002 width=70% }

3. Напишем программный код и выведем график зависимости $x$ от $x'$ (рис. -@fig:003).

  ```
  using Plots 
  using DifferentialEquations
  pyplot();

  w_sqr = 8.00;
  g = 5.00;
  step = 0.05;
  t = (0.0,58.0);
  x0 = [0.2; -0.3];
  p = [w_sqr,g];

  f(t) = 0.25 * sin(8*t);
  function syst(dx,x,p,t)
      w,g = p
      dx[1]  = x[2];
      dx[2] =  - w * x[1]  - g * x[2] + f(t);
  end


  prob = ODEProblem(syst, x0, t, p);
  sol = solve(prob, saveat = step);
  n = length(sol.u);
  y1 = zeros(n);
  y2 = zeros(n);
  for i in 1:n
      y1[i] = sol.u[i][1];
      y2[i] = sol.u[i][2];
  end
  plot(y1, y2, xlabel = "X", ylabel = "X'", label = "График зависимости x(x')")
  title!("Фазовая зависимость")

  ```

  ![Фазовый портрет колебания гармонического осциллятора c затуханием и под действием внешней силы](screens/3.png){ #fig:003 width=70% }

# Вывод

В ходе лабораторной работы мы научились моделировать гармонические колебания.