function [x_min, N] = GSS(f,a0,b0,epsilon,varargin)
ro=(3-sqrt(5))/2;
N=0;
if(b0<a0)
    print('Error in input parameters')
    return
end
if(nargin(f)-1~=length(varargin))
    print('Error in input parameters required for the function handle');
    return
end
distance=b0-a0;
while distance>=epsilon
    a1=a0+distance*ro;
    b1=b0-distance*ro;
    if f(a1,varargin{:})<f(b1,varargin{:})
        b0=b1;
    else
        a0=a1;
    end
    N=N+1;
    distance=b0-a0;
end
x_min=vpa((b0+a0)/2);
end