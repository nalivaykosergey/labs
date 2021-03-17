using Plots 
using DifferentialEquations
pyplot();

N = 6666;
a = 0.01;
b = 0.02;
I0 = 83;
R0 = 6;
S0 = N - I0 - R0;
t = (0, 200);
p = [a,b];
x0 = [S0, I0, R0];
step = 0.01;

function syst1(dx, x, p, t)
       a, b = p;
       dx[1] = -a * x[1];
       dx[2] = a * x[1] - b * x[2];
       dx[3] = b * x[2];
end

prob = ODEProblem(syst1, x0, t, p);
sol = solve(prob, saveat = step);
plot(sol, xlabel = "t", ylabel = "population", labels = ["S(t)" "I(t)" "R(t)"])
title!("2й случай")
