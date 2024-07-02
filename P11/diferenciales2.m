function diferenciales2(a,b,ciy,xi,t0)
% Portillo Martínez Arturo
% 2MV1
% Análisis de Señales y Sistemas
% Sistemas diferenciales

% ejemplo: resolver y^(2)+3y^(1)+3y = -x^(1)+x con y^(1)=1
% y(0)=1, x(t)=cos(2t)u(t), para 10 segundos, se resuleve como
% syms t
% diferenciales([3 3 1],[1 -1],[1 1],cos(2t)*heaviside(t),10)

sympref('HeavisideAtOrigin', 1);
close all
tam=size(a);
tami=size(b);
syms y(t) Y(s) x(t) X(s) Yy fp trans imp(t) enCe(t) esCe(t) To(t) Te(t);
syms edd edi 
edd=0;
edi=0;

% Función de transferencia
for i=1:tam(2)
   edd=edd+a(i)*s^(i-1);
end
for i=1:tami(2)
   edi=edi+b(i)*s^(i-1);
end
% mensaje('FUNCIÓN DE TRANSFERENCIA')
% disp('H(s)=')
trans=edi/edd;
% pretty(trans)

% Respuesta al impulso
% mensaje('RESPUESTA AL IMPULSO')
% disp('Respuesta al impulso=')
imp(t)=ilaplace(trans);
% pretty(imp(t))

% Respuesta a entrada cero
edd=0;
edi=0;
for i=1:tam(2)
   edd=edd+a(i)*s^(i-1)*Y(s);
   for k=1:i-1
       edd=edd-a(i)*(s^(i-1-k)*ciy(k));
   end
end
edd=collect(edd,Y(s));
edd=subs(edd,Y(s),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
% mensaje('RESPUESTA A ENTRADA CERO')
% disp('Respuesta a entrada cero=')
enCe(t)=ilaplace(edd);
% pretty(enCe(t))

% Respuesta a estado cero
edd=0;
edi=0;
for i=1:tam(2)
   edd=edd+a(i)*s^(i-1)*Y(s);
end
for i=1:tami(2)
   edi=edi+b(i)*s^(i-1)*X(s);
end
edi=subs(edi,X(s), laplace(xi));
edd=collect(edd,Y(s));
edd=subs(edd,Y(s),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
% mensaje('RESPUESTA A ESTADO CERO')
% disp('Respuesta a estado cero=')
esCe(t)=ilaplace(edd);
% pretty(esCe(t))

% Respuesta total
edd=0;
edi=0;
for i=1:tam(2)
   edd=edd+a(i)*s^(i-1)*Y(s);
   for k=1:i-1
       edd=edd-a(i)*(s^(i-1-k)*ciy(k));
   end
end
for i=1:tami(2)
   edi=edi+b(i)*s^(i-1)*X(s);
end
edi=subs(edi,X(s), laplace(xi));
edd=collect(edd,Y(s));
edd=subs(edd,Y(s),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
mensaje('RESPUESTA TOTAL')
disp('y(t)=')
To(t)=ilaplace(edd);
pretty(To(t))

% Respuesta total al escalón con codiciones iniciales 0
edd=0;
edi=0;
for i=1:tam(2)
   edd=edd+a(i)*s^(i-1)*Y(s);
end
for i=1:tami(2)
   edi=edi+b(i)*s^(i-1)*X(s);
end
edi=subs(edi,X(s), laplace(heaviside(t)));
edd=collect(edd,Y(s));
edd=subs(edd,Y(s),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
% mensaje('RESPUESTA TOTAL AL ESCALÓN UNITARIO CON CONDICIONES INICIALES 0')
% disp('y(t)=')
Te(t)=ilaplace(edd);
% pretty(Te(t))

% Gráficas
t=0:0.001:t0;
t2=2:0.001:t0;
t3=4:0.001:(t0+4);
figure(4)
plot(t,To(t),'LineWidth',2); title('RESPUESTA TOTAL'); xlabel('TIEMPO');
end

function mensaje(texto)
disp( ' ')
disp(texto)
disp( ' ')
end