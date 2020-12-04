function  [x_min,f_min,numberofiterations] = BFGS_95101117(f,gf,x0,epsilon, varargin)
c1 = 0.0001;
c2 = 0.1;
numberofiterations=1;
dimention=length(x0);
identitymatrix=eye(dimention,dimention);
C=identitymatrix;
prevx=x0;
p=@(C,x)-C*gf(x);
phi = @(C,x,a)f(x+a*p(C,x),varargin{:});
phiPrime=@(C,x,a)p(C,x)'*gf(x+a*p(C,x),varargin{:});
alpha=bracketing_95101117(phi,phiPrime,C,prevx,c1,c2,1);
newx=prevx+alpha*p(C,prevx);
%C=gamma'*delta/(delta'*delta)*identitymatrix;

% I used this new x. Maybe I should use the original x0
while norm(newx-prevx)>epsilon
    prevx=newx;
    direction=p(C,prevx);
    alpha=bracketing_95101117(phi,phiPrime,C,x0,c1,c2,1);
    newx=prevx+alpha*direction;
    delta=newx-prevx;
    gamma=gf(newx)-gf(prevx);
    a=1/(gamma'*delta);
    C=(identitymatrix-a*delta*gamma')*C*(identitymatrix-a*gamma*delta')+a*delta*delta';
    numberofiterations=numberofiterations+1;
end
x_min=newx;
f_min=f(x_min);
end