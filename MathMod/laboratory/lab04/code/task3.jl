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
plot(y1, y2, xlabel = "X", ylabel = "X'", label = "График зависимости x'(x)")
title!("Фазовая зависимость")


