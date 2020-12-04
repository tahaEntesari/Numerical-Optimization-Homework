function y = powelHessian(x,varargin)
persistent f_count;
if isempty(varargin)
    if isempty(f_count)
        f_count=0;
    end
    y =     [2 + 120*(x(1)-x(4))^2, 20, 0, -120*(x(1)-x(4))^2;...
        20, 200 + 12*(x(2)-2*x(3))^2, -24*(x(2)-2*x(3))^2, 0;...
        0, -24*(x(2)-2*x(3))^2, 10 + 48*(x(2)-2*x(3))^2, -10;...
        -120*(x(1)-x(4))^2, 0, -10, 10 + 120*(x(1)-x(4))^2];
    
    f_count= f_count+ 1;
else 
    y=f_count;
end
end