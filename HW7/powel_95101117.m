function y = powel(x,varargin)
persistent f_count;
if isempty(varargin)
    if isempty(f_count)
        f_count=0;
    end
    y = (x(1)+10*x(2))^2 + 5*(x(3)-x(4))^2 + (x(2)-2*x(3))^4 + 10*(x(1)-x(4))^4;
    f_count= f_count+ 1;
else
    y=f_count;
end
end
