% Por Bernoulli despejando tenemos que 
%z1=(8*f1*L1*Q.^2)/(pi.^2*g*D1.^5)
%despejando Q:
function [Q] = Q_t(z,g,D,f,L)
    Q = ((z*pi.^2*g*D.^5)/(8*f*L)).^(1/2);
    return 
endfunction
