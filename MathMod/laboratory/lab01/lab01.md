---
# Front matter
lang: ru-RU
title: "Отчет по лабораторной работе № 1"
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

Получить основные навыки работы с системой контроля версий Git.

# Выполнение лабораторной работы

1. Сконфигурируем Git на локальном компьютере (рис. -@fig:001). 

  ![Конфигурация](screens/1.png){ #fig:001 width=70% }

2. Создадим репозиторий на github (рис. -@fig:002).
   
  ![github репозиторий](screens/2.png){ #fig:002 width=70% }

3. Произведем инициализацию git в директории и создадим файл index.html, который мы зальем на репозиторий github (рис. -@fig:003).

  ![Инициализация git](screens/3.png){ #fig:003 width=70% }

4. Настроим компьютер для работы с github по протоколу ssh (рис. -@fig:004).

  ![Установка ssh](screens/4.png){ #fig:004 width=70% }

5. Установим репозиторий на локальный компьютер по протоколу ssh (рис. -@fig:005).

  ![Установка репозитория через ssh](screens/5.png){ #fig:005 width=70% }

6. Создадим новую ветку разработки и сделаем изменения в проекте (рис. -@fig:006).

  ![Создание новой ветки разработки](screens/6.png){ #fig:006 width=70% }

7. Соединим ветки (master и new_branch) и удалим ветку new_branch (рис. -@fig:007).

  ![Работа с ветками разработки](screens/7.png){ #fig:007 width=70% }

8. Удалим тестовый репозиторий (рис. -@fig:008).
   
   ![Работа с ветками разработки](screens/8.png){ #fig:008 width=70% }

# Выводы

В ходе лабораторной работы мы получили основные навыки работы с системой контроля версий Git.
