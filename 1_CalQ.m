%Autor: Carolina Cholango
%======================================
%Se pretende trasvasar agua entre dos depositos, cuyos niveles
%libres se encuentran respectivamente a las cotas de 50 y 25m. 
%Se instala una tuberia de rugosidad 0,02mm de diametrro 250mm 
%y longitud 350m. Despreciar perdidas menores de instalacion. 
%Viscosidad cinematica del agua 1.02*10.^-6 [m2/2]

L1 = 350; % Longitud de tuberia [m]
z1 = 50; % Cota inicial [m]
z2 = 20; % Cota final [m]
D1= 0.25; %Diametro de la tuberia [m]
e1 = 0.00002; % Rugosidad de la tuberi­a [m]
mu =0.00000102; %Viscosidad cinematica del agua[m2/s]
g1 = 9.81; %gravedad [m/s2]
%======================================
% Valores asumidos para ejercicio
%======================================
f1 = 0.0008; %Factor de Friccion
%======================================
% Valor de rugosidad relativa
%======================================
e_r=e/(D1); 
%======================================
% Por el valor de la rugosidad relativa
%el valor del numero de Reynolds debe 
%estar entre:
%======================================
Re_min=5*10.^3;
Re_max=10.^8;
%======================================
% Calculos inciales,numero de Reynolds y
%Caudal
%======================================
Q_c= Q_t(z1,g1,D1,f1,L1);
Rey = Re(Q_c,D1,mu);
%======================================
% Lazo de calculo para estimar Rey y Q_c
%======================================

for i = 0:50
    if  Rey < Re_min
        Q_c = Q_t(z1,g1,D1,fa,L1)+0.0001;
        f1  = fric(e,D1,Rey);
        Rey = Re(Q_c,D1,mu);
                
    elseif Rey > Re_min
        Q_c = Q_t(z1,g1,D1,f1,L1)-0.0001;
        Rey = Re(Q_c,D1,mu);
        f1  = fric(e,D1,Rey);
          
    else
        Rey = Rey;
        f1  = fric(e,D_c,Rey);
        Q_c = Q_t(z1,g1,D1,f1,L1);
        
    end
end
% Impresion de resultados
%======================================
fprintf('El valor de Reynols: %d\n',Rey);
disp(' ');
disp('--------------------');
fprintf('El valor de la friccion: %d\n',f1);
disp(' ');
fprintf('El valor del caudal: %d\n[Lit./s]',Q_c);
disp(' ');
disp('--------------------');