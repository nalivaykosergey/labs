---
## Front matter
lang: ru-RU
title: Защита лабораторной работы № 7. Модель рекламной кампании"
author: Наливайко Сергей Максимович
institute: RUDN University, Moscow, Russian Federation
date: 1 April, 2021

## Formatting
toc: false
slide_level: 2
theme: metropolis
header-includes: 
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
aspectratio: 43
section-titles: true
---

# Цель работы

## Цель работы

$\quad$Научиться моделировать модель рекламной кампании. 

# Формулировка задачи. Вариант 45

## Формулировка задачи

$\quad$Постройте график распространения рекламы, математическая модель которой описывается
следующим уравнением:

$$1. \ \frac{\partial{n}}{dt} \ = \ (0.288 + 0.000018n(t))(N - n(t))$$

$$2. \ \frac{\partial{n}}{dt} \ = \ (0.000018 +  0.377n(t))(N - n(t))$$

$$3. \ \frac{\partial{n}}{dt} \ = \ (0.1t + 0.4\cos{t}n(t))(N - n(t))$$

$$x_0 = 24, N = 3030$$

# Решение задачи

## Решение задачи 1

![График решения уравнения модели для a1 < a2](../screens/1.png){ #fig:001 width=70% }

## Решение задачи 2

![График решения уравнения модели для a1 > a2](../screens/2.png){ #fig:002 width=70% }

## Решение задачи 3

![График решения уравнения модели для a1 = 0.1t и a2 = 0.4cos(t)](../screens/3.png){ #fig:003 width=70% }

# Вывод 

$\quad$В ходе лабораторной работы мы научились моделировать модель рекламной кампании.