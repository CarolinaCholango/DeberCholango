% Ecuacion de Darcy para calcular el factor de f

function [f] = fric(e,D,Re)
    e_r = e/D;
    L = (log10((e_r/3.7) + (5.74/(Re.^(0.9))))).^2;
    f = 0.25/L;
    return
endfunction
