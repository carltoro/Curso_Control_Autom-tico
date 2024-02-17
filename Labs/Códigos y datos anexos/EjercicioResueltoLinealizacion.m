% Simulaci�n de modelos lineales y su versi�n linealizada
clc;clear;close all

%% Ejemplo 1
% Modelo: x' = -sqrt(x) + u^2/3
% asumimos como C.I. el valor del punto de operaci�n

% se�al de prueba:
U        = @(t) double(t>=0);% se�al escal�n unitario
u        = @(t) 2.2*U(t)-0.4*U(t-2)+0.6*U(t-4)-0.8*U(t-6)+1.3*U(t-8);
t        = linspace(0,10,1e4);

figure
plot(t,u(t),'-r','LineWidth',1.5);grid on;
xlabel('Tiempo (u.a.)');ylabel('Amplitud (u.a.)');
axis([0 10 1 3]);
 
% punto de equilibrio:
x0       = 16/9; 
u0       = 2;

% soluci�n EDO modelo no lineal:
[~,ynl]  = ode45(@(t,x) -sqrt(x) + (u(t).^2)/3,t,x0);

% soluci�n EDO modelo linealizado:
[~,ylin] = ode45(@(t,x) -3*(x-x0)/8 + 4*(u(t)-u0)/3,t,x0);

figure
plot(t,u(t),'-r',t,ynl,'-b',t,ylin,':b','LineWidth',1.5);grid on;
xlabel('Tiempo (u.a.)');ylabel('Amplitud (u.a.)');
axis([0 10 1 3]);
legend('Se�al de entrada u(t)','y(t) Modelo No-Lin.','y(t) Modelo Lin.')