function diferencias(a,b,ciy,cix,xi,n0)
% Portillo Martínez Arturo
% 2MV1
% Análisis de Señales y Sistemas
% Sistemas en diferencias

% ejemplo: resolver 2y[n]+y[n+1] = 2x[n-1] con y[-1]=3 
%x[n]=u[n], para 5 segundos, se resuleve como
% syms n
% diferencias([1 2],[2],[3],[0],heaviside(n),5)

sympref('HeavisideAtOrigin', 1);
close all
tam=size(a);
tami=size(b);
syms y(n) n z Y(z) x(n) X(z) Yy fp trans imp(n) enCe(n) esCe(n) To(n) Te(n);
syms edd edi
edd=0;
edi=1;

% Función de transferencia
for i=1:tam(2)
   yd(i)=y(n+tam(2)-i);
   edd=edd+ a(i)*ztrans(yd(i));   
end
mensaje('FUNCIÓN DE TRANSFERENCIA')
edd=subs(edd,ztrans(y(n),n,z), Y(z));
edi=subs(edi,ztrans(x(n),n,z), X(z));
for j=1:tami(2)-1
edi=subs(edi,x(tami(2)-1-j),0);
end
for j=1:tam(2)-1
edd=subs(edd,y(tam(2)-1-j),0);
end
edd=collect(edd,Y(z));
edd=subs(edd,Y(z),Yy);
eq1=edd==edi;
disp('H[Z]=')
trans=solve(eq1, Yy);
pretty(trans)

% Respuesta al impulso
mensaje('RESPUESTA AL IMPULSO')
disp('Respuesta al impulso=')
imp(n)=iztrans(trans);
pretty(imp(n))

% Respuesta a entrada cero
edd=0;
edi=0;
for i=1:tam(2)
   yd(i)=y(n+tam(2)-i);
   edd=edd+ a(i)*ztrans(yd(i));   
end
edd=subs(edd,ztrans(y(n),n,z), Y(z));
edi=subs(edi,ztrans(x(n),n,z), X(z));
for j=1:tami(2)-1
edi=subs(edi,x(tami(2)-1-j),cix(j));
end
for j=1:tam(2)-1
edd=subs(edd,y(tam(2)-1-j),ciy(j));
end
edi=subs(edi,X(z), 0);
edd=collect(edd,Y(z));
edd=subs(edd,Y(z),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
mensaje('RESPUESTA A ENTRADA CERO')
disp('Respuesta a entrada cero=')
enCe(n)=iztrans(edd);
pretty(enCe(n))

% Respuesta a estado cero
edd=0;
edi=0;
for i=1:tam(2)
   yd(i)=y(n+tam(2)-i);
   edd=edd+ a(i)*ztrans(yd(i));   
end
for i=1:tami(2)
   xd(i)=x(n+tami(2)-i);
   edi=edi+ b(i)*ztrans(xd(i));   
end
edd=subs(edd,ztrans(y(n),n,z), Y(z));
edi=subs(edi,ztrans(x(n),n,z), X(z));
for j=1:tami(2)-1
edi=subs(edi,x(tami(2)-1-j),0);
end
for j=1:tam(2)-1
edd=subs(edd,y(tam(2)-1-j),0);
end
edi=subs(edi,X(z), ztrans(xi));
edd=collect(edd,Y(z));
edd=subs(edd,Y(z),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
mensaje('RESPUESTA A ESTADO CERO')
disp('Respuesta a estado cero=')
esCe(n)=iztrans(edd);
pretty(esCe(n))

% Respuesta total
edd=0;
edi=0;
for i=1:tam(2)
   yd(i)=y(n+tam(2)-i);
   edd=edd+ a(i)*ztrans(yd(i));   
end
for i=1:tami(2)
   xd(i)=x(n+tami(2)-i);
   edi=edi+ b(i)*ztrans(xd(i));   
end
edd=subs(edd,ztrans(y(n),n,z), Y(z));
edi=subs(edi,ztrans(x(n),n,z), X(z));
for j=1:tami(2)-1
edi=subs(edi,x(tami(2)-1-j),cix(j));
end
for j=1:tam(2)-1
edd=subs(edd,y(tam(2)-1-j),ciy(j));
end
edi=subs(edi,X(z), ztrans(xi));
edd=collect(edd,Y(z));
edd=subs(edd,Y(z),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
mensaje('RESPUESTA TOTAL')
disp('y(n)=')
To(n)=iztrans(edd);
pretty(To(n))

% Respuesta total al escalón con codiciones iniciales 0
edd=0;
edi=0;
for i=1:tam(2)
   yd(i)=y(n+tam(2)-i);
   edd=edd+ a(i)*ztrans(yd(i));   
end
for i=1:tami(2)
   xd(i)=x(n+tami(2)-i);
   edi=edi+ b(i)*ztrans(xd(i));   
end
edd=subs(edd,ztrans(y(n),n,z), Y(z));
edi=subs(edi,ztrans(x(n),n,z), X(z));
for j=1:tami(2)-1
edi=subs(edi,x(tami(2)-1-j),cix(j));
end
for j=1:tam(2)-1
edd=subs(edd,y(tam(2)-1-j),ciy(j));
end
edi=subs(edi,X(z), ztrans(heaviside(n)));
edd=collect(edd,Y(z));
edd=subs(edd,Y(z),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
mensaje('RESPUESTA TOTAL AL ESCALÓN UNITARIO CON CONDICIONES INICIALES 0')
disp('y(n)=')
Te(n)=iztrans(edd);
pretty(Te(n))

figure (2)
hFig = figure(2);
set(hFig, 'Position', [0 0 900 2250])
n=0:1:n0;
subplot(5,1,1)
stem(n,imp(n),'LineWidth',2); title('RESPUESTA AL IMPULSO'); xlabel('TIEMPO');
subplot(5,1,2)
stem(n,enCe(n),'r','LineWidth',2); title('RESPUESTA A ENTRADA CERO'); xlabel('TIEMPO');
subplot(5,1,3)
stem(n,esCe(n),'k','LineWidth',2); title('RESPUESTA A ESTADO CERO'); xlabel('TIEMPO');
subplot(5,1,4)
stem(n,To(n),'m','LineWidth',2); title('RESPUESTA TOTAL'); xlabel('TIEMPO');
subplot(5,1,5)
stem(n,Te(n),'c','LineWidth',2); title('RESPUESTA TOTAL AL ESCALÓN UNITARIO CON CONDICIONES INICIALES 0'); xlabel('TIEMPO');
grid on
end

function mensaje(texto)
disp( ' ')
disp(texto)
disp( ' ')
end