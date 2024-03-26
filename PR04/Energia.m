function Ex = Energia(x)
% Ex
% Esta función obtiene la enerfía de un vector x 
    a = find(x,1,"first");
    b = find(x,1,"last");
    SumE = 0;
    for i = a:1:b
        SumE = SumE + ((abs(x(i)))^2);
    end
    Ex = SumE;
end
