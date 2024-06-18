%% Práctica 9: Sistemas diferenciales y en diferencias
%
%
%% Integrantes
%
% Portillo Martínez Arturo
%
%% Desarrollo
%
% Para sistemas diferenciales realiza un programa con las siguientes características:
%
% # Muestra la función de transferencia del sistema.
% # Muestra la respuesta al impulso (simbólico, gráfica). 
% # Muestra la respuesta a entrada cero (simbólico, gráfica).
% # Muestra la respuesta a estado cero (simbólico, gráfica).
% # Muestra la respuesta total (simbólico, gráfica).
% # La respuesta total al escalón con condiciones iniciales 0 (simbólico, gráfica).
% # Usando subplot, depliega una figura con 5 gráficas.
%
% Para sistemas en diferencias realiza un progra con las siguiente
% características :
%
% # Muestra la función de transferencia del sistema.
% # Muestra la respuesta al impulso (simbólico, gráfica, ver KroneckerDelta). 
% # Muestra la respuesta a entrada cero (simbólico, gráfica).
% # Muestra la respuesta a estado cero (simbólico, gráfica).
% # Muestra la respuesta total (simbólico, gráfica)).
% # La respuesta total al escalón con condiciones iniciales 0 (simbólico, gráfica).
% # Usando subplot, depliega una figura con 5 gráficas.
%
%% Sistemas Diferenciales
% A continuación se muestra el código realizado para cumplir las
% características solicitadas.
%
% <include>diferenciales.m</include>
%
%%
% Entonces si se quiere resolver la ecuación diferencial
%%
% 
% $$\ddot{y}(t)+3\dot{y}(t)+3y(t)=-\dot{x}(t)+x(t),\;\;y(0)=1,\;y'(0)=1$$
%
% Hasta t=10. 
%%
syms t
diferenciales([3 3 1],[1 -1],[1 1],cos(2*t)*heaviside(t),10)
%% Sistemas en diferencias
% A continuación se muestra el código realizado para cumplir las
% características solicitadas.
%
% <include>diferencias.m</include>
%
%%
% Entonces si se quiere resolver la ecuación diferencial
%%
% 
% $$2y[n]+y[n+1]=2x[n-1],\;\;y[-1]=3,\;x[n]=u[n]$$
%
% Hasta n=5. 
%%
syms n
diferencias([1 2],[2],[3],[0],heaviside(n),5)
%%
% Si se quiere resolver la ecuación diferencial
% 
% $$2y[n+2]-3y[n+1]+y[n]=4x[n+2]-3x[n+1],\;\;y[-1]=0,\;y[-2]=1,\;x[n]=(1/4)^n u[n]$$
%
% Hasta n=5. 
%%
syms n
diferencias([2 -3 1],[4 -3],[0 1],[0],((1/4)^n)*heaviside(n),5)
%%