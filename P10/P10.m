%% Práctica 4: Señales en tiempo discreto
%
%
%% Integrantes
%
% Portillo Martínez Arturo
%
%% Objetivos
%
% * Conocer los conceptos de respuesta en frecuencia.
% * Conocer los conceptos de filtros.
% * Realizar graficas de Bode (manual y con MATLAB).
% * Realizar simulaciones numéricas de sistemas con MATLAB.
%
%% Introducción
%
% 4.10 Diseño de filtro por colocación de polos y ceros de $$H(s)$$
% 
% La respuesta de la frecuencia de un sistema, que describe su capacidad de
% filtrado, depende de los polos y ceros de su función de transferencia $$H(s)$$.
% 
% Esta función puede expresarse en términos de sus polos $$(\lambda_i)$$ y
% ceros $$(Z_i)$$. La magnitud y el ángulo de $$H(s)$$ en una frecuencia
% específica $$s=p$$ se calculan usando las distancias y ángulos de los
% ceros y polos a ese punto $$p$$ en el plano complejo. La magnitud de
% $$H(s)$$ es el producto de las distancias de los ceros a $$p$$ dividido
% por el producto de las distancias de los polos a $$p$$. El ángulo de $$H(s)$$
% es la suma de los ángulos de los ceros a $$p$$ menos la suma de los
% ángulos de los polos a $$p$$. Este método se aplica para calcular la
% respuesta den frecuencia $$H(j\omega)$$ a lo largo del eje imaginario,
% repitiendo el procedimiento para todos los valores de $$\omega$$.
%
% AUMENTO DE GANANCIA POR UN POLO
%
% La ubicación de un polo complejo $$-\alpha + j\omega_0 $$ afecta la respuesta en frecuencia
% de un sistema. A medida que la frecuencia $$\omega$$ se aproxima a $$\omega_0$$ la
% respuesta en amplitud $$|H(j\omega)|$$ aumenta,alcanzando un máximo en $$\omega_0$$, y
% luego disminuye. Esto crea un comportamiento resonante, donde la ganancia
% es la máxima en $$\omega_0$$. Cuanto más cerca esté el polo del eje imaginario,
% mayor será la resonancia. En sistemas reales, cada polo commplejo debe
% tener su conjugado, lo que no afecta significativamente la selectividad
% en frecuencia cerca de $$\omega_0$$. Para estabilidad, los polos deben ubicarse
% en el semiplano izquierdo.
%
% La presencia de polos complejos y sus conjugados afecta la respuesta en frecuencia de un sistema.
% La ganancia se define como $$K/(d*d')$$, donde $$d$$ es la distancia al polo y
% $$d'$$ es la distancia al polo conjugado. Aunque el polo original afecta
% significativamente la ganancia cerca de $$\omega_0$$, el polo conjugado, que
% está más lejos de $$\omega_0$$, no cambia drásticamente la longitud $$d'$$ y, por
% lo tanto, la selectividad en frecuencia permanece prácticamente sin
% cambios con solo aumentos graduales en $$d'$$ a medida que $$\omega$$ crece.
%
% SUPRESIÓN DE GANANCIA POR UN CERO
%
% La ubicación de ceros complejos $$-\alpha \pm j\omega_0$$ afecta la
% respuesta en frecuencia de un sistema al suprimir la ganancia cerca de
% $$\omega_0$$. Un cero en $$j\omega_0$$ elimina completamente la ganancia
% en esa frecuencia, y ceros repetidos aumentan este efecto. Un par de polo
% y cero cercano tiende a cancelar sus efectos mutuos. La colocación
% estratégica de polos y ceros permite diseñar diversos filtros
% (pasa-bajos, pasa-altos, pasa-banda y elimina-banda9. Además, la
% respuesta en fase se puede analizar gráficamente observando los ángulos
% formados por los polos y ceros complejos a medida que $$\omega$$ varía.
%
% FILTROS PASA-BAJOS
%
% Los filtros pasa-bajos típicos tienen una ganancia máxima en
% $$\omega=0$$, lograda colocando un polo en el eje real opuesto al origen.
% La función de transferencia normalizada para estos filtros es
% $$H(s)=\frac{\omega_c}{s+\omega_c}$$. La ganancia disminuye a medida que
% $$\omega$$ aumenta, lo que se ilustra en la Fig. 4.50d para $$N=1$$.
%
% Un filtro pasa-bajos ideal tiene un a ganacia constante hasta $$\omega_c$$
% y luego cae a cero. Para aproximar este comportamiento, se coloca una
% "pared de polos" frente al eje imaginario hasta $$\omega_c$$. La
% disposición óptima es un semicírculo con polos infinitos, pero en la
% práctica se usa un número finitos de polos. Los filtros Butterworth
% tienen una respuesta máxima plana en la banda de paso y sus
% características mejoran al aumentar el número de polos (N). Los filtros
% Chebyshev, aunque tienen ondulaciones en la banda de paso, ofrecen una
% caída de ganancia más rápida en la banda de rechazo.
%
% FILTROS PASA-BANDA
% 
% En un filtro pasa-banda ideal, la ganancia se incrementa uniformemente en
% toda la banda de paso. Pra lograr esto, se requiere una pared de polos
% frente al eje imaginario centrada en la frecuancia de resonancia
% $$\omega_0$$, así como una pared de polos conjugados opuesta a
% %%-\omega_0$$. En la práctica, debido a limitaciones, se utilizan un
% número finito de polos, lo que resulta en características menos ideales
% pero funcionalmente aceptables.
% 
% FILTROS NOTCH (RECHAZO DE BANDA)
%
% La respuesta ideal en amplitud de un filtro notch (rechazo de banda) es
% el complemento de la de un filtro pasa-banda ideal, con ganancia cero en
% una banda centrada en $$\omega_0$$ y ganancia unitaria en las demás
% frecuancias. Para lograr esto prácticamente, se utiliza un filtro notch
% de segundo orden con ceros en %%\pm j\omega_0%% y polos colocados de
% manera que satisfagan condiciones de equidistancia. La rápida
% recupareción de la ganancia de 0 a 1 fuera de la frecuencia $$\omega_0$$
% se logra colocando los polos más cerca de los ceros en el semicírculo de
% radio $$\omega_0$$.
%
% FILTROS PRÁCTICOS Y SUS ESPECIFICACIONES
%
% En la práctica, los filtros ideales deben de aproximarse debido a las
% limitaciones del mundo real. Esto implica transiciones graduales entre
% las bandas de paso y rechazo, y especificaciones de ganancia en términos
% de decibelios. Los filtros prácticos no pueden tener una ganancia cero
% sobre una abnda finita, y por lo tanto, se define una banda de rechazo
% como aquella donde la ganancia está por debajo de cierto umbral $$(G_s).
% Los filtros de diferentes tipos se pueden derivar de un filtro pasa-bajos
% básico mediante transformaciones de frecuencia adecuadas.
%
%% Desarrollo
%
% Para el desarrollo se tienen que resolver cada uno de los siguientes problemas comenzando 
% una nueva sección (para la publicación) en cada uno de ellos.
%
% * *Problema 1.* El siguiente sistema es un ciruito electrico RLC en serie, donde la
% estrada es el voltaje suministrado al circuito y la salida es el voltaje
% en la resistencia,
% 
% <<RLC_schematic.PNG>>
% 
% realiza lo siguiente 
% 
% *1a.* Demuestra que la ecuación que modela el sistema es 
%
% $$\ddot{V}_o(t)+\frac{R}{L}\dot{V}_o(t)+\frac{1}{LC}V_o(t) = \frac{R}{L}\dot{V_i}(t)$$
%  
% Ayuda: Voltaje suministrado es igual a voltaje consumido, escribir las
% variables en terminos de la salida mediante las relaciones de voltaje
% corriente en cada elemento y utilizar el hecho de que es un circuito en
% serie
% 
% *1b.* Encuentre la función de transferencia. 
%
% En adelante suponga que $L=1 H$, $C=510\,\mu F$ y $R=50\, \Omega$
%
% *1c.* Reporta el código y la gráfica de la respuesta al impulso, para
% diferentes tiempos de simulación de tal manera que se muestre el
% comportamiento del sistema
%
% *1d.* Reporta el codigo y la gráfica de la respuesta al escalón, para
% diferentes tiempos de simulación de tal manera que se muestre el
% comportamiento del sistema
%
% Define $\omega_0=1/\sqrt(L*C)$
%
% *1e.* Presenta las simulaciones con una entrada seno de 
% de amplitud 1 con frecuencias, $\frac{1}{2}\omega_0$, $\omega_0$, y
% $2\omega_0$, para
% diferentes tiempos de simulación de tal manera que se muestre el
% comportamiento del sistema
%
% *1f.* Reporta las gráficas de Bode para los valores de $R$ y $C$ propuestos y
% varia $L$ de 1 a 1e-6 (en potencias de 10), ¿Qué sucede con la respuesta
% en frecuencia?
%
% *1g.* Reporta las gráficas de Bode para los valores de $L$ y $C$ propuestos y
% varia $R$ para $2,10,20 K\Omega$, ¿Qué sucede con la respuesta
% en frecuencia?
%
% * *Problema 2.* Consideremos el siguiente sistema
%
% $$G(s)=\omega_c/(s+\omega_c)$$
%
% *2a.* Muestra que $|G(0j)|=1$
%
% *2b.* Muestra que si se tiene una ganancia de
% $-3db$ entonces $\omega=\omega_c$
%
% *2c.* Para modificar el comportamiento del sistema, se realiza una
% retroalimentación negativa con $k=9$. ¿Para qué valor de $\omega$ se
% tiene una ganancia de $-3db$?, ¿Qué concluye?
%
% *2d.* Para modificar el comportamiento del sistema, se realiza una
% retroalimentación negativa con $k=0.9$. ¿Para qué valor de $\omega$ se
% tiene una ganancia de $-3db$?, ¿Qué concluye?
%
% *2e.* Reporte las graficas de bode (código) de los tres sistemas anteriores
% si $\omega_c=2$.
%
% <<Bloques1.png>>
%
% * *Problema 3* Para el siguiente sistema
%
% $$H(s)=\frac{(s+10)(s+20)}{s^2(s+100)}$$
%
% *3a.* Bosqueja las gráficas de Bode a mano paso a paso, puedes revisar el
% ejemplo 4.25 y 4.26 de Lathi
%
% *3b.* Utiliza la instrucción _bode_ para realizar las gráficas de bode
%
% * *Problema 4* Para el sistema 
%
% $$H(s)=\frac{10(s+2)}{s^2+8s+15}$$
%
% Simule la respuesta al escalón (CI=0), para
% diferentes tiempos de simulación de tal manera que se muestre el
% comportamiento del sistema y comparela con la solución
% analítica
%
% $$y(t)=1.33u(t)+1.67e^{-3t}u(t)-3e^{-5t}u(t)$$
%
% * *Problema 5* Se tiene el siguiente sistema 
%
% $$\ddot{x}+5x=f$$
%
% *5a.* ¿El sistema es BIBO estable? 
%
% *5b.* Encuentre la respuesta  (analítica) para condiciones iniciales cero del sistema si
% $f(t)=sen(\sqrt{5}t)u(t)$, recuerde aplicar el resultado de convolución si es
% necesario.
%
% *5c.* De acuerdo a 5a, ¿tiene sentido hablar de la respuesta en estado
% estacionario?
%
% *5d.* Presente las graficas de Bode del sistema utilizando la instrucción
% _bode_
%
% *5e.* ¿Cuáles son sus conclusiones al respecto?
% 
% *5f.* Encuentre la respuesta  (analítica) para condiciones iniciales cero del sistema si
% $f(t)=sen(\sqrt{5}/2t)u(t)$, compare con la simulación en MATLAB
%
% *5g.* Encuentre la respuesta  (analítica) para condiciones iniciales cero del sistema si
% $f(t)=sen(2\sqrt{5}t)u(t)$, compare con la simulación en MATLAB
%
% * *Problema 6* Investigue la instrucción _linearSystemAnalyzer_ (disposible a partir de 2015a)
% y con ayuda de esta, reporte las gráficas de 
%
% *6a.* Respuesta al Impulso
%
% *6b.* Respuesta al escalón
%
% *6c.* Respuesta a $x(t)=cos(2t)u(t)$
%
% *6d.* Graficas de Bode
%
% Para condiciones iniciales cero y 10 segundos de simulación, para el sistema.
%
% $$\ddot{y}+3\dot{y}+2y=x$$
%
% * *Problema 7* Reproduzca los resultados de la MATLAB session 4 del libro
% de Lathi.
%
%% Problema 1
% * *Problema 1.* El siguiente sistema es un ciruito electrico RLC en serie, donde la
% estrada es el voltaje suministrado al circuito y la salida es el voltaje
% en la resistencia,
% 
% <<RLC_schematic.PNG>>
% 
% realiza lo siguiente 
%
% *1a.* Demuestra que la ecuación que modela el sistema es 
%
% $$\ddot{V}_o(t)+\frac{R}{L}\dot{V}_o(t)+\frac{1}{LC}V_o(t) = \frac{R}{L}\dot{V_i}(t)$$
%  
% Tenemos primeramente que:
%
% $$V_i(t)=V_L(t)+V_C(t)+V_R(t)=L\frac{di_{(t)}}{dt}+\frac{1}{C}\int i_{(t)}\,dt+V_R(t)$$
%
% Sustituimos $$V_R(t)$$ con $$V_o(t)$$
%
% $$V_i(t)=L\frac{di_{(t)}}{dt}+\frac{1}{C}\int i_{(t)}\,dt+V_o(t)$$
% 
% Despejamos $$i(t)$$ en $$V_R(t)$$
%
% $$i(t)=\frac{1}{R}V_o(t)$$
%
% Sustituimos $$i(t)$$ en $$V_i(t)$$
%
% $$V_i(t)=L\frac{d}{dt}\frac{1}{R}V_o(t)+\frac{1}{C}\int\frac{1}{R}V_o(t)\,dt+V_o(t)$$
%
% Sacamos la primera derivada de $$V_i(t)$$
% 
% $$\dot{V}_i(t)=\frac{L}{R}\ddot{V}_o(t)+\frac{1}{CR}V_o(t)+\dot{V}_o(t)$$
%
% Sustituimos $$\dot{V}_i(t)$$
%
% $$\ddot{V}_o(t)+\frac{R}{L}\dot{V}_o(t)+\frac{1}{LC}V_o(t) = \frac{R}{L}(\frac{L}{R}\ddot{V}_o(t)+\frac{1}{CR}V_o(t)+\dot{V}_o(t))$$
%
% Reducimos
%
% $$\ddot{V}_o(t)+\frac{R}{L}\dot{V}_o(t)+\frac{1}{LC}V_o(t)=\ddot{V}_o(t)+\frac{R}{L}\dot{V}_o(t)+\frac{1}{LC}V_o(t)$$
%
% Por lo tanto La ecuación que modela el sistema está en lo correcto.
%
% *1b.* Encuentre la función de transferencia. 
%
% En adelante suponga que $L=1 H$, $C=510\,\mu F$ y $R=50\, \Omega$
%
% Sustituímos los valores en la ecuación
%
% $$\ddot{V}_o(t)+\frac{50\, \Omega}{1 H}\dot{V}_o(t)+\frac{1}{1 H * 510\,\mu F}V_o(t) = \frac{50\, \Omega}{1 H}\dot{V_i}(t)$$
%
% Donde:
%
% $$Q(j\omega)=(j\omega)^2 + \frac{50\, \Omega}{1 H}j\omega + \frac{1}{1 H * 510\,\mu F}$$
%
% $$P(j\omega)=\frac{50\, \Omega}{1 H}j\omega$$
%
% $$H(j\omega)=\frac{P(j\omega)}{Q(j\omega)}=\frac{\frac{50\, \Omega}{1 H}j\omega}{(j\omega)^2 + \frac{50\, \Omega}{1 H}j\omega + \frac{1}{1 H * 510\,\mu F}}=\frac{50j\omega}{(j\omega)^2 + 50j\omega + \frac{1}{510\,\mu}}$$
%
% *1c.* Reporta el código y la gráfica de la respuesta al impulso, para
% diferentes tiempos de simulación de tal manera que se muestre el
% comportamiento del sistema
%
syms s y(t);
imp = (50*s)/((s^2)+(50*s)+0.00051);
y(t) = ilaplace(imp);

t=0:0.001:0.5;
subplot(2,2,1)
plot(t,y(t),'LineWidth',2); title('IMPULSO DE 0 A 0.5'); xlabel('TIEMPO');
t=0:0.001:0.1;
subplot(2,2,2)
plot(t,y(t),'LineWidth',2); title('IMPULSO DE 0 A 0.1'); xlabel('TIEMPO');
t=0:0.001:0.05;
subplot(2,2,3)
plot(t,y(t),'LineWidth',2); title('IMPULSO DE 0.A 0.05'); xlabel('TIEMPO');
t=0:0.001:0.025;
subplot(2,2,4)
plot(t,y(t),'LineWidth',2); title('IMPULSO DE 0 A 0.025'); xlabel('TIEMPO');
%%
%
% *1d.* Reporta el codigo y la gráfica de la respuesta al escalón, para
% diferentes tiempos de simulación de tal manera que se muestre el
% comportamiento del sistema
%
% Define $\omega_0=1/\sqrt(L*C)$
%
syms s y(t);
imp = ((50*s)/((s^2)+(50*s)+0.00051))*laplace(heaviside(t));
y(t) = ilaplace(imp);

t=0:0.001:0.5;
subplot(2,2,1)
plot(t,y(t),'LineWidth',2); title('ESCALÓN DE 0 A 0.5'); xlabel('TIEMPO');
t=0:0.001:0.1;
subplot(2,2,2)
plot(t,y(t),'LineWidth',2); title('ESCALÓN DE 0 A 0.1'); xlabel('TIEMPO');
t=0:0.001:0.05;
subplot(2,2,3)
plot(t,y(t),'LineWidth',2); title('ESCALÓN DE 0 A 0.05'); xlabel('TIEMPO');
t=0:0.001:0.025;
subplot(2,2,4)
plot(t,y(t),'LineWidth',2); title('ESCALÓN DE 0 A 0.025'); xlabel('TIEMPO');
%%
