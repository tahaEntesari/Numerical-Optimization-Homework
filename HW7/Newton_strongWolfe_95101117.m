function [x_min,f_min,numberofiterations] = Newton_strongWolfe_95101117(f,gf,hf,x0,epsilon,varargin)
numberofiterations=1;
c1 = 0.0001;
c2 = 0.1;
p=@(x)-hf(x)\gf(x);
phi = @(x,a)f(x+a*p(x),varargin{:});
phiPrime=@(x,a)p(x)'*gf(x+a*p(x),varargin{:});
alpha=bracketing_95101117(phi,phiPrime,x0,c1,c2,1);
prevx=x0;
newx=prevx+alpha*p(prevx);
while(norm(newx-prevx)>epsilon)
    prevx=newx;
    alpha=bracketing_95101117(phi,phiPrime,prevx,c1,c2);
    newx=prevx+alpha*p(prevx);
    numberofiterations=numberofiterations+1;
end
x_min=newx;
f_min=f(x_min);
    end