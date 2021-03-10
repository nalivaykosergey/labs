using Plots 
using DifferentialEquations
pyplot();
a = 0.32;
b = 0.04;
c = 0.42;
d = 0.02;

t = (0.0, 400.0);
step = 0.01;
p = [a,b,c,d];
x0 = [9,20];

function syst(dx,x,p,t)
    a,b,c,d = p;
    dx[1] = -a*x[1] + b*x[1] * x[2];
    dx[2] =  c*x[2] - d*x[1] * x[2];
end

prob = ODEProblem(syst, x0, t, p);
sol = solve(prob, saveat = step);

n = length(sol);
y1 = zeros(n);
y2 = zeros(n);

for i in 1:n
    y1[i] = sol.u[i][1];
    y2[i] = sol.u[i][2];
end

plot(y1,y2, xlabel = "Хищники", ylabel = "Жертвы", label = "График изменения количества жертв от количества хищников")
scatter!([c/d], [a/b], label = "Стац точка")
title!("Модель хищник-жертва")



plot(sol, xlabel = "t", ylabel = "Количество особей", label = ["Хищники" "Жертвы"])
title!("Модель хищник-жертва")



