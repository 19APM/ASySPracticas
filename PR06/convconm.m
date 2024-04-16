function convconm(x,h)
  figure (1) % Se crea una figura para hacer las gráficas
  
  n1 = -1:0.001:0;
  n2 = 0:0.001:1;
  n3 = 1:0.001:2;
  x1 = @(t) (2.*exp(-1-t))+t-1;
  x2 = @(t) ((2-t).*exp(-1))+t-1;
  x3 = @(t) exp(-1).*(2-t);
  
  dtau = 0.005; % Base de los rectangulos para realizar la integral 
  tau = -3:dtau:3; % Intervalo de visualización del resultado
  ti = 0; % Indice para el vector de resultados
  tvec = -3:.1:3; % traslaciones de t, cuantas integrales se calulan  
  y = NaN*zeros(1, length (tvec)); % Resultados de acuerdo a cuantos t
    hFig = figure(1);
    set(hFig, 'Position', [0 0 1000 1000])
    filename = 'P1.gif';
    ttt=1;
  for t = tvec, % Cantidad de traslaciones
      ti = ti+1; % Indice para guardar el resultado (indice del tiempo)
      xh = x(t-tau).*h(tau); % resultado de la multiplicación 
      lxh = length(xh); % longitud del resultado
      y(ti) = sum(xh.*dtau); % Base por altura, aproximación de la integral
      subplot (2,1,1), % gráfica de 2 x 1 (primera)
      plot(tau, h(tau), 'r-', tau, x(t-tau), 'g--', t, 0, 'ob'); %graficas 
      axis ([tau(1) tau(end) -2.0 2.5]); % límites de los ejes
      patch([tau(1:end-1); tau(1:end-1); tau(2:end); tau(2:end)],...
      [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
      [.8 .8 .8], 'edgecolor', 'none');
      xlabel('\tau'); % Texto del eje X
      legend('h(\tau)', 'x(t-\tau)','t','h(\tau)x(t-\tau)')% Caja de Texto  
      subplot (2, 1, 2)  % gráfica de 2 x 1 (segunda)
      plot (n1,x1(n1),'b',n2,x2(n2),'r',n3,x3(n3),'g',tvec, y, 'k', tvec (ti), y(ti), 'ok');
      xlabel ('t'); 
      ylabel ('y(t) = \int h(\tau)x(t-\tau) d\tau');
      axis ([tau(1) tau(end) -1.0 1.0]); % límites del eje
      grid; % malla
      drawnow; % efecto de movimiento continuo
      pause(0.4)
        frame = getframe(hFig); 
        im = frame2im(frame); 
        [imind,cm] = rgb2ind(im,256); 
        % Write to the GIF File 
        if ttt == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
        else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
        end
        ttt=ttt+1;
  end
  end