using Plots 
using DifferentialEquations
plotlyjs()


N = 3030;
x0 = 24;
step = 0.0001;
t = (0.0, 30.0);
a1(t) = 0.288;
a2(t) = 0.000018;

f(x, p, t) = (a1.(t) + a2.(t) * x)*(N - x);
prob = ODEProblem(f, x0, t);
sol = solve(prob, saveat = step);
plot(sol, xlabel = "t", ylabel = "n", labels = "n(t)")
title!("1й случай")
