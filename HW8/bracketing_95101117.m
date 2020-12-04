function [alpha]= bracketing_95101117(phi,phiPrime,C,x,c1,c2,varargin)
a=0;
fbar=0.001;
if(isempty(varargin))
    fbar=0.1*phi(C,x,0);
end
phi_0=phi(C,x,0);
phiPrime_0=phiPrime(C,x,0);

b=(fbar-phi_0)/(phiPrime_0*c1);
mu=b;
prevAlpha=0;
alpha=b/2;

while(1)
    
    if(phi(C,x,alpha)<=fbar) 
        break
    end
    if (phi(C,x,alpha)>phi_0+alpha*phiPrime_0 || phi(C,x,alpha) >= phi(C,x,prevAlpha))
        a=prevAlpha;
        b=alpha;
        alpha=sectioning_95101117(phi,phiPrime,C,x,phi_0,phiPrime_0,a,b,c1,c2);
        break
    end
    phiPrimealpha=phiPrime(C,x,alpha);
    if(abs(phiPrimealpha)<=-c2*phiPrime_0)
        break
    end
    if(phiPrimealpha>=0)
        a=alpha;
        b=prevAlpha;
        alpha=sectioning_95101117(phi,phiPrime,C,x,phi_0,phiPrime_0,a,b,c1,c2);
    end
    if (mu<=2*alpha-prevAlpha)
        prevAlpha=alpha;
        alpha=mu;  
    else
        temp=alpha;
        alpha=((2*alpha-prevAlpha)+min([mu,alpha+10*(alpha-prevAlpha)]))/2;
        prevAlpha=temp;
    end
end
end