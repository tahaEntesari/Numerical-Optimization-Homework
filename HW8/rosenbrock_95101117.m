function y = rosenbrock(x,varargin)
persistent f_count;
if isempty(varargin)
    if isempty(f_count)
        f_count=0;
    end
    y = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
    f_count= f_count+ 1;
else
    y=f_count;
end
end