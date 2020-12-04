function argmin = LineSearch_95101117(f, gf, x_k, LineSearchTolerence, varargin)
MaxSearchBound=100;
secondHandle=@(alpha)f(x_k-alpha*gf(x_k),varargin{:});
[argmin,~]=GSS_95101117(secondHandle,0,MaxSearchBound,LineSearchTolerence);
end