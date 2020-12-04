function y = rosenbrockHessian(x,varargin)
persistent f_count;
if isempty(varargin)
    if isempty(f_count)
        f_count=0;
    end
    y = [-400*x(2)+1200*x(1)^2+2, -400*x(1); -400*x(1), 200];
    f_count= f_count+ 1;
else
    y=f_count;
end
end