% Функция вычисления опорного напряжения типа "треугольник"

function y = reference_voltage_stud(t,a)

x = t-a;
y = 1-abs(1-2*x/a+2*floor(x/a));
end