function y = powelGradient(x,varargin)
persistent f_count;
if isempty(varargin)
    if isempty(f_count)
        f_count=0;
    end
    y = [2*(x(1)+10*x(2)) + 40*(x(1)-x(4))^3; ...
        20*(x(1)+10*x(2)) + 4*(x(2)-2*x(3))^3; ...
        10*(x(3)-x(4)) - 8*(x(2)-2*x(3))^3; ...
        -10*(x(3)-x(4)) - 40*(x(1)-x(4))^3];
    f_count= f_count+ 1;
else 
    y=f_count;
end
end