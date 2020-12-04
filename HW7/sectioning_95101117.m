function [alpha] = sectioning_95101117(phi,phiPrime,x,phi_0,phiPrime_0,a,b,c1,c2)
t2=0.1;
t3=0.5;
while(1)
    %minimum based on quadradic interpolation
    %alpha=min([a+t2*(b-a),b-t3*(b-1),a+(b-a)*phiPrime(x,a)/(2*(phi(x,b)-phi(x,a)-phiPrime(x,a)))]);
    %alpha=a+(b-a)*phiPrime(x,a)/(2*(phi(x,b)-phi(x,a)-phiPrime(x,a)));
    phi_a=phi(x,a);
    phiPrime_a=phiPrime(x,a);
    temp= phi(x,a-(b-a)^2*phiPrime_a/(2*phi_a));
    if (temp < phi_a)
        alpha = a  -(b-a)^2*phiPrime_a/(2*phi_a);
    else
        alpha = (a+b)/2;
    end
    phi_alpha=phi(x,alpha);
    phiPrime_alpha=phiPrime(x,alpha);
    if(phi_alpha>phi_0+c1*alpha*phiPrime_0 || phi_alpha >=phi_a)
        b=alpha;
    else
        if(abs(phiPrime_alpha)<=-c2*phiPrime_0) 
            return
        end
        if((b-a)*phiPrime_alpha>=0)
            b=a;
        end
        a=alpha;
    end
end
end

