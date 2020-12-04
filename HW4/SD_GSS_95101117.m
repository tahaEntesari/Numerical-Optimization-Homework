function [x_min, f_min, iter]=SD_GSS(f, gf, x0, Stop_tol, GSS_tol,varargin)
x_k=x0;
iter=1;
gf_evaluated=gf(x_k);
[desiredAlpha,~]=GSS_95101117(@(t)f(x_k-t*gf_evaluated),0,100,GSS_tol,varargin{:});
x_kp1=x_k-desiredAlpha*gf_evaluated;
while norm(x_kp1-x_k)>Stop_tol
    x_k=x_kp1;
    iter=iter+1;
    gf_evaluated=gf(x_k);
    [desiredAlpha,~]=GSS_95101117(@(t)f(x_k-t*gf_evaluated),0,100,GSS_tol,varargin{:});
    %desiredAlpha=LineSearch_95101117(f,gf,x_k,GSS_tol);
    x_kp1=x_k-desiredAlpha*gf_evaluated;
end
x_min=x_kp1;
f_min=f(x_kp1);


end