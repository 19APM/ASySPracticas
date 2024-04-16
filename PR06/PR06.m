%% Práctica 6: Convolución y Correlación de señales
%
%
%% Integrantes
%
% Portillo Martínez Arturo
%
%% Objetivos
%
% * Conocer métodos básicos de integración numérica.
% * Manipulación de instrucciones en MATLAB.
% * Simular convoluciones y correlaciones de señales continuas.
% * Simular convoluciones y correlaciones de señales discretas.
%
%% Introducción
%
% Métodos numéricos de integración
%
% *1.* *Integración*
% 
% $$\int_a^bf(x)dx$$
%
% El teorema fundamental del cálculo (en una de sus funciones). Si f es
% integrable, y $$\frac {dF(x)} {dx} = f(x)$$
%
% $$\int_a^bf(x)dx = F(b) - F(a)$$
%
% Encontrar F es difícil o imposible.
% (técnicas de integración, cambio de variable, integración por parte,etc.)
%
% Se aproxima utilizando polinomios, por ejemplo:
%
% $$f(x) = e^{-x^2}$$
%
% $$\int_{-1}^1f(x)dx = \int_{-1}^1e^{-x^2}dx = F(1) - F(-1)$$  con  $$\frac {dF(x)} {dx} = f(x)$$
%
% Aproxiamremos con el polinomio $$P(x)=1$$  teniendo:
%
% $$\int_{-1}^1P(x)dx = \int_{-1}^1 1dx = x\Big|_{-1}^1 = 2$$
%
% $$\int_{-1}^1e^{-x^2}dx < 2$$
% 
% $$\int_{-1}^1e^{-x^2}dx \approx 1.4936$$
x = -1:0.001:1;
f = @(x) exp(-x.^2);
P = 1;
figure()
plot(x,f(x),'LineWidth',0.3); title('Ejemplo'); xlabel('x'); ylabel('Función'); grid; axis([-1 1, 0, 2])
hold on
yline(P,'r','LineWidth',0.3)
legend("f(x)","P(x)")
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
hold off
%%
%
% *2.* *Fórmulas cerradas de Newton-Cotes*
%
% Se utilizan los polinomiso de interpolación de lagrange
%
% $$f\epsilon C^{n+1}[a,b]$$ existe $$\varepsilon (x) \epsilon (a,b)$$
%
% $$f(x) = P(x) + \frac {f^{n+1}(\varepsilon (x))} {(n+1)!} (x-x_0)
% (x-x_1)...(x-x_n)$$ con $$x\epsilon [a,b] \;\; x_i\epsilon [a,b]$$
%
% Fórmula cerrada de (n+1) puntos de Newton-Cotes
%
% * $$x_0 = a$$
% * $$x_n = b$$
% * $$h = \frac {b-a} n$$
% * $$x_i = x_0 + ih \;\; i = 0,1,...,n$$
%
% *Regla del trapecio (n=1)* 
%
% $$\int_{x_0}^{x_1}f(x)dx = \frac h 2 [f(x_0)+f(x_1)]-\frac {h^3} {12} f''(\varepsilon) \;\; x_0<\varepsilon<x_1$$
%
% * $$x_0 = a \;\;\;\;\;\; x_0 = x_0$$
% * $$x_1 = b \;\;\;\;\;\; x_1 = a+b-a = b$$
% * $$h = b-a$$ (paso)
% * $$x_i = a + i(b-a) \;\; i = 0,1$$
%
% $$\int_{-1}^1e^{-x^2}dx = \frac 2 2 [e^{-1}+e^{-1}]-\frac 8 {12}[-2e^{-\varepsilon ^2}(1-2\varepsilon ^2)] \;\;\;\; -1<\varepsilon <1$$
%
% $$= 0.7357 + \frac 4 3 e^{-\varepsilon ^2}(1-2\varepsilon ^2) \;\;\;\; -1<\varepsilon <1$$
%
% *Regla de Simpson (n=2)* 
%
% $$\int_{x_0}^{x_2}f(x)dx = \frac h 3 [f(x_0)+4f(x_1)+f(x_2)]-\frac {h^5} {90} f^{(4)}(\varepsilon) \;\; x_0<\varepsilon<x_2$$
%
% * $$x_0 = a$$
% * $$x_2 = b$$
% * $$h = \frac {b-a} 2$$ (paso)
% * $$x_i = a + ih \;\; i = 0,1,2$$
% * $$x_1 = a + \frac {b-a} 2 = \frac {b+a} 2$$
%
% $$\int_{-1}^1e^{-x^2}dx = \frac 1 3 [e^{-1}+4e^{0}+e^{-1}]-\frac 1 {90}[-4e^{-\varepsilon ^2}(-4\varepsilon ^4 + 12\varepsilon ^2 - 3)] \;\;\;\; -1<\varepsilon <1$$
%
% $$= 1.5785 + \frac 2 {45} e^{-\varepsilon ^2}(-4\varepsilon ^4 + 12\varepsilon ^2 - 3)) \;\;\;\; -1<\varepsilon <1$$
%
% *Regla de tres octavos Simpson (n=3)* 
%
% $$\int_{x_0}^{x_3}f(x)dx = \frac 3 8 h[f(x_0)+3f(x_1)+3f(x_2)+f(x_3)]-\frac {3h^5} {80} f^{(4)}(\varepsilon) \;\; x_0<\varepsilon<x_3$$
%
% * $$x_0 = a$$
% * $$x_3 = b$$
% * $$h = \frac {b-a} 3$$ (paso)
% * $$x_i = a + ih \;\; i = 0,1,2,3$$
% * $$x_1 = a + \frac {b-a} 3 = \frac {2a+b} 3$$
% * $$x_2 = a + \frac {2b-2a} 3 = \frac {2b+a} 3$$
%
% $$\int_{-1}^1e^{-x^2}dx = \frac 3 8 (\frac 2 3)[e^{-1}+3e^{-\frac 1 9}+3e^{-\frac 1 9}+e^{-1}]-\frac 3 {80}(\frac 2 3)^5[-4e^{-\varepsilon ^2}(-4\varepsilon ^4 + 12\varepsilon ^2 - 3)] \;\;\;\; -1<\varepsilon <1$$
%
% $$= 1.5261 + \frac 8 {405} e^{-\varepsilon ^2}(-4\varepsilon ^4 + 12\varepsilon ^2 - 3)) \;\;\;\; -1<\varepsilon <1$$
%
% *3.* *Fórmulas cerradas de Newton-Cotes Compuestas*
% 
% *Regla compuesta del trapecio*
%
% $$\int_{a}^{b}f(x)dx = \frac h 2 [f(a)+2\sum_{j=1}^{n-1}f(x_j)+f(b)]-\frac
% {b-a} {12} h^2f''(\mu) \;\; \mu \epsilon(a,b)$$
%
% * n número de subintervalos.
% * $$h = \frac {b-a} n$$ (paso)
% * $$x_j = a + jh \;\; j = 0,1,2,...,n$$
%
% Con n = 10 tenemos h = 0.2
%
% $$\int_{-1}^1e^{-x^2}dx = \frac {0.2} 2 [e^{-1}+2\sum_{j=1}^{n-1}e^{-x_j^2}+e^{-1}]-\frac 2 {12}(0.2)^2[-2e^{-\mu ^2}(1-2\mu ^2)] \;\;\;\; -1<\mu <1$$
%
% $$= 1.4887 + 0.0133 e^{-\mu ^2}(1-2\mu ^2) \;\;\;\; -1<\mu <1$$
% 
% *Regla compuesta de Simpson*
%
% $$\int_{a}^{b}f(x)dx = \frac h 3 [f(a)+2\sum_{j=1}^{(\frac n 2)-1}f(x_{2j})+4\sum_{j=1}^{(\frac n 2)}f(x_{2j-1})+f(b)]-\frac
% {b-a} {180} h^4f^{(4)}(\mu) \;\; \mu \epsilon(a,b)$$
%
% * n par número de subintervalos.
% * $$h = \frac {b-a} n$$ (paso)
% * $$x_j = a + jh \;\; j = 0,1,2,...,n$$
%
% Con n = 10 tenemos h = 0.2
%
% $$\int_{-1}^1e^{-x^2}dx = \frac {0.2} 3 [e^{-1}+2\sum_{j=1}^4 e^{-x_{2j}^2}+4\sum_{j=1}^5 e^{-x_{2j-1}^2}+e^{-1}]-\frac 2 {180}(0.2)^4[-4e^{-\mu ^2}(-4\mu ^4+12\mu ^2 -3)] \;\;\;\; -1<\mu <1$$
%
% $$= 1.4936 + 0.000071 e^{-\mu ^2}(-4\mu ^4+12\mu ^2-3) \;\;\;\; -1<\mu <1$$
%
% *3.* *Cuadratura gaussiana*
%
% % $$\int_{a}^b f(x)dx \approx \sum_{i=1}^n C_i f(x_i);$$ 2n parámetros
%
% * Polinomios de Lagrange.
% * Polinomis de Legendre.
%
% $$\{1, x, x^2-\frac 1 3, x^3-\frac 3 5x,x^4-\frac 6 7x^2+\frac 3
% {35},...\}$$
%
% Teniedo:
%
% * $$P_n(x)$$ polinomio de Legendre de grado n
% * $$x_1,x_2,...,x_n$$ de $$P_n(x)$$
% * $$\int_{-1}^1P(x)dx = \sum_{i=1}^nC_iP(x_i)$$  P(x) con grado menos que 2n 
%
% Teniendo como resultado
%
% $$\int_a^b f(x)dx = \int_{-1}^1 f(\frac {(b-a)t+b+a} 2) \frac {b-a} 2
% dt$$
%
% Con n=2
%
% $$\int_{-1}^1 e^{-x^2}dx \approx e^{-(0.5773502692)^2} +
% e^{-(0.5773502692)^2}\approx 1.4331$$
%
% Con n=3
%
% $$\int_{-1}^1 e^{-x^2}dx \approx 0.5555555556e^{-(0.7745966692)^2} +
% 0.8888888889 + 0.5555555556e^{-(0.7745966692)^2} \approx 1.4986$$
%
%% Desarrollo
%
% Resolver cada uno de los siguientes problemas:
%
% # Para el PR04 reporte la grafica de la simulación númerica
% de la convolución y compare con el resultado análitico que obtuvo para el problema 1, esto
% es, su práctica tendrá que incluir una llamada a la funciónn
% _convconm_ y posteriormente se tendrá que mostrar (mediante el
% Publish) la gráfica tanto de las señales involucradas como el resultado de
% la convolución, y en esta última gráficara su resultado analitico, se
% tendrá que incluir el resultado analitico. 
% # Para el PR05 reporte la grafica de la simulación númerica
% de la correalción y compare con el resultado análitico que obtuvo para el problema e), esto
% es, su práctica tendrá que incluir una llamada a la funciónn
% _convconm_ y posteriormente se tendrá que mostrar (mediante el
% Publish) la gráfica tanto de las señales involucradas como el resultado de
% su correlación, y en esta última graficara su resultado analitico, se
% tendrá que incluir el resultado analitico. 
% # Realice la simuación de la convolución de las señales (c) con (d) del
% problema 3.1-1 
% # Realice la simuación de la correlación de las señales (c) con (d) del
% problema 3.1-1
% # Realice la  la convolución de las señales (c) con (d) del
% problema 3.1-1 utilizando el comando *conv* de MATLAB, muestre el código
% utilizado y gráfique el resultado, sugerencia: Utilice las propiedades de
% traslación de la convolución.
%
%% Problema 1
%
% Para el PR04 reporte la grafica de la simulación númerica
% de la convolución y compare con el resultado análitico que obtuvo para el problema 1, esto
% es, su práctica tendrá que incluir una llamada a la funciónn
% _convconm_ y posteriormente se tendrá que mostrar (mediante el
% Publish) la gráfica tanto de las señales involucradas como el resultado de
% la convolución, y en esta última gráficara su resultado analitico, se
% tendrá que incluir el resultado analitico.
%
% Realiza la convolución de las siguientes señales:
%
t =-2:0.001:2;
f = @(t) exp(-t).*(t>=0 & t<=1);
g = @(t) t.*(t>=-1 & t<=1);

figure()
plot(t,f(t),'LineWidth',1); title('Función f(t)'); xlabel('t'); ylabel('f(t)'); grid; axis([-2 2,-1,2])
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';

figure()
plot(t,g(t),'LineWidth',1); title('Función g(t)'); xlabel('t'); ylabel('g(t)'); grid; axis([-2 2,-2,2])
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';

%%
% Se tiene las siguientes 2 señales con su convolución en analítico:
%
% *f(t)*
%
% <<f(t).png>>
%
% *g(t)*
%
% <<g(t).png>>
%
% *y(t)*
%
% <<y(t).png>>
%
f = @(t) exp(-t).*(t>=0 & t<=1);
g = @(t) t.*(t>=-1 & t<=1);
convconm(f,g)
%%
%
% <<P1.gif>>
%
%% Problema 2
%
% Para el PR05 reporte la grafica de la simulación númerica
% de la correalción y compare con el resultado análitico que obtuvo para el problema e), esto
% es, su práctica tendrá que incluir una llamada a la funciónn
% _convconm_ y posteriormente se tendrá que mostrar (mediante el
% Publish) la gráfica tanto de las señales involucradas como el resultado de
% su correlación, y en esta última graficara su resultado analitico, se
% tendrá que incluir el resultado analitico. 
%
% Realiza la autocorrelación de
%
% $$x_1(t)=u(t)-2u(t-3)+u(t-4)$$
%
% Se tiene la señal con su autocorrelación en analítico:
%
% $$x_1(t)$$
%
% <<x1(t).png>>
%
% $$\Upsilon_{x_1x_1}(t)$$
%
% <<x11(t).png>>
%
f = @(t) 1*(t<=0)-2*(t<=-3)+1*(t<=-4);
g = @(t) 1*(t>=0)-2*(t>=3)+1*(t>=4);
convconm2(f,g)
%%
%
% <<P2.gif>>
%
%% Problema 3
%
% Realice la simulación de la convolución de las señales (c) con (d) del
% problema 3.1-1
%
% <<P3_1-1.png>> 
%
n=-3:3;
a=[-9 -6 -3 0 3 6 9];
b=[0 4 2 0 2 4 0];
convdisc([n;a],[n;b])
%%
%
% <<P3.gif>>
%
%% Problema 4
%
% Realice la simuación de la correlación de las señales (c) con (d) del
% problema 3.1-1
%
% <<P3_1-1.png>> 
%
n=-3:3;
a=[-9 -6 -3 0 3 6 9];
b=[0 4 2 0 2 4 0];
convdisc2([n;a],[n;b])
%%
%
% <<P4.gif>>
%
%
% Resulta ser que la convolución y la correlación tienen el mismo resultado
% ya que el espejo de la segunda función es la misma que la original.
%
%% Problema 5
%
% Realice la  la convolución de las señales (c) con (d) del
% problema 3.1-1 utilizando el comando *conv* de MATLAB, muestre el código
% utilizado y gráfique el resultado, sugerencia: Utilice las propiedades de
% traslación de la convolución.
figure()
a=[-9 -6 -3 0 3 6 9];
b=[0 4 2 0 2 4 0];
w=conv(a,b,"full");
m = (length(w) - 1)/2;
n= -m:m;
stem(n,w,'LineWidth',3); title('Función r(t)'); xlabel('t'); ylabel('r(t)'); grid;