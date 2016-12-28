function C = EuropeanCall(S0,K,T,r,sigma,N,b1,b2)
N = (mod(N,2)+N)/2;
u1 = Halton(b1,N);
u2 = Halton(b2,N);
z1 = sqrt(-2*log(u1)).*cos(2*pi*u2);
z2 = sqrt(-2*log(u1)).*sin(2*pi*u2);
S1 = S0*exp((r-sigma^2/2)*T+sigma*sqrt(T)*z1);
S2 = S0*exp((r-sigma^2/2)*T+sigma*sqrt(T)*z2);
C = exp(-r*T)*(mean(max(S1-K,0))+mean(max(S2-K,0)))/2;