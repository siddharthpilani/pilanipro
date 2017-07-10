
function LotkaVolterra(a,b,c,d)   
syms T t u(t) v(t) u0 v0 Y 
Du = diff(u);
Dv = diff(v); 
ode1 = Du == a*u - b*u*v;
ode2 = Dv == c*u*v-d*v;
[ode_vf, ode_subs] = odeToVectorField(ode1,ode2);
ode_fcn = matlabFunction(ode_vf, 'vars',{t,Y});
tspan = linspace(0, 100, 500);
icv = [100; 10]+sqrt(eps);
[t,y] = ode45(ode_fcn, tspan, icv);
figure(1)
plot(t, y)
grid