function Px = Poder(x,n)
% Px
% Esta función obtiene el valor del poder de un vector x en un periodo
% definido siendo x perdiódico.
    a = find(x,1,"first");
    b = find(x,1,"last");
    SumP = 0;
    for i = a:1:b
        SumP = SumP + ((abs(x(i)))^2);
    end
    Indi = find(n,1,"last");
    Np = n(Indi);
    syms N
    Px = limit((1/((2*N)+1))*SumP,N,Np);
end
