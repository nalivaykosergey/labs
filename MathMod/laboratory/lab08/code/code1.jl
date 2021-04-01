using DifferentialEquations
using Plots
pyplot()

x0 = [2.6, 6.2];
t = (0.0, 30.0);
p_cr = 40;
N  = 43;
q = 1;
tau_1 = 20;
tau_2  = 14;
p_1 = 10.7;
p_2 = 19.1;

a1 = (p_cr) / (tau_1 * tau_1 * p_1 * p_1 * N * q);
a2 = (p_cr) / (tau_2 * tau_2 * p_2 * p_2 * N * q);
b = (p_cr) / (tau_1 * tau_1 * p_1 * p_1 * tau_2 * tau_2 * p_2 * p_2 * N * q);
c1 = (p_cr - p_1) / (tau_1 * p_1);
c2 = (p_cr - p_2) / (tau_2 * p_2);
theta = t./c1;
step = 0.01 / c1;

function syst(dx, x, p, t)
       a1,a2,b,c1,c2 = p;
       dx[1] = x[1] - b/c1 * x[1]*x[2] - a1/c1 * x[1]*x[1];
       dx[2] = c2/c1 * x[2] - b/c1 * x[1]*x[2] - a2/c1 * x[2]*x[2];
end

p = [a1, a2, b, c1,c2];

prob = ODEProblem(syst, x0, theta, p);
sol = solve(prob, saveat = step);
plot(sol, xlabel = "Theta", ylabel = "M", labels = ["M1(Theta)" "M2(Theta)"])
title!("Случай 1")
