%% Práctica 7: Series de Fourier en tiempo continuo
%
%
%% Integrantes
%
% Portillo Martínez Arturo
%
%% Objetivos
%
% * Realizar gráficas de series de Fourier exponenciales y trigonométricas en tiempo continuo.
% * Manipulación de instrucciones en MATLAB.
%
%% Desarrollo
%
% Resolver cada uno de los siguientes problemas:
%
% # Gráfica de la serie de Fourier en un intervalo que muestre 5
% repeticiones.
% # Gráfica de la señal y la serie de Fourier para 15 armónicos. 
% # Gráfica del error.
% # Gráfica de la energía del error.
% # Espectro de magnitud para 15 armónicos.
% # Espectro de fase para 15 armónicos.
%
% * *Ejemplo 6.2*  Agregar la expresión análitica
% de la serie en ambos formatos. Utilizar A = 1.
%
% * *Ejemplo 6.4* Agregar la expresión análitica
% de la serie en ambos formatos.
% 
% * *PR08* Agregar la expresión análitica
% de la serie en ambos formatos (hay dos series en esta tarea).
%
% * *PR10* Agregar la expresión análitica
% de la serie en ambos formatos (ejercicio 1 y $a=2$).
%
%% Ejemplo 6.2
%
% Se tiene la siguiente serie de Fourirer en forma trigonométrica compacta:
%
% $$ x(t) = \sum_{n=1}^\infty \frac {8} {n^2 \pi^2} sen(\frac {n\pi} {2}) cos(n \pi t) $$
%
% Y se tienen la siguiente serie de Fourier en forma exponencial compleja:
%
% $$ x(t) = \sum_{n=-\infty}^\infty -\frac {4} {n^2 \pi^2} sen(\frac {n \pi} {2})j e^{n \pi jt} $$
%
d0=0;
dn=@(n) -j*(4/((n^2)*(pi^2)))*sin((n*pi)/2);
t0=-0.5;
tf=1.5;
f=@(t) (2.*t).*(abs(t)<=0.5) + (2.*(1-t)).*((0.5<t)&(t<=1.5));
armo=15;
a=-6.5;
b=3.5;
sfc(t0,tf,dn,d0,f,armo,a,b)
%% Ejemplo 6.4
%
% Se tiene la siguiente serie de Fourirer en forma trigonométrica compacta:
%
% $$ x(t) = \frac 1 2 + \sum_{n=1}^\infty \frac {2} {n \pi} sen(\frac {n\pi} {2}) cos(nt) $$
%
% Y se tienen la siguiente serie de Fourier en forma exponencial compleja:
%
% $$ x(t) = \sum_{n=-\infty}^\infty \frac {1} {n \pi} sen(\frac {n \pi} {2}) e^{njt} $$
%
d0=0;
dn=@(n) (1/(n*pi))*sin((n*pi)/2);
t0=-pi;
tf=pi;
f=@(t) (1).*(((-pi/2)<t)&(t<(pi/2)))
armo=15;
a=-5*pi;
b=5*pi;
sfc(t0,tf,dn,d0,f,armo,a,b)
%% PR08.1
%
% Se tiene la siguiente serie de Fourirer en forma trigonométrica compacta:
%
% $$ x(t) = \sum_{n=1}^\infty (-\frac {2cos(\pi n)} {\pi n} + \frac {2sen(\pi n)} {(\pi n)^2}) cos(n \pi t) $$
%
% Y se tienen la siguiente serie de Fourier en forma exponencial compleja:
%
% $$ x(t) = \sum_{n=-\infty}^\infty (-\frac {cos(\pi n)} {\pi n} + \frac {sen(\pi n)} {(\pi n)^2}) e^{\pi njt} $$
%
%% PR08.2
%
% Se tiene la siguiente serie de Fourirer en forma trigonométrica compacta:
%
% $$ x(t) = \frac 4 3 + \sum_{n=1}^\infty \frac {8cos(\pi n)\sqrt {4+\pi ^4 n^4}} {\pi ^3 n^3} cos(n \frac {\pi} {2} t + tan^{-1}(\frac {\pi ^2 n^2 + 2} {2\pi n})) $$
%
% Y se tienen la siguiente serie de Fourier en forma exponencial compleja:
%
% $$ x(t) = \sum_{n=-\infty}^\infty \frac {4cos(\pi n)\sqrt {4+\pi ^4 n^4}} {\pi ^3 n^3} e^{tan^{-1}(\frac {\pi ^2 n^2 + 2} {2\pi n})j} e^{\frac {\pi} 2 n jt}  $$
%
%% PR10
%
% Se tiene la siguiente serie de Fourirer en forma trigonométrica compacta:
%
% $$ x(t) = \sum_{n=1}^\infty \frac {8(1-e^{-2}cos(\pi n))} {4 + n^2 \pi ^2} cos(n \pi t) $$
%
% Y se tienen la siguiente serie de Fourier en forma exponencial compleja:
%
% $$ x(t) = \sum_{n=-\infty}^\infty \frac {4(1-e^{-2}cos(\pi n))} {4 + n^2 \pi ^2} e^{\pi njt}  $$
%