clear, clc, close all

t = [-3.14:0.025:3.14]; 
x = [sin(pi*t)]; 
y = [1.5*cos(pi*t)];

i = 0.9; 
a = 0.05; 
while i > 0
    t = [-3.14:a:3.14]; 
    x = [x,i*sin(pi*t)]; 
    y = [y,1.5*i*cos(pi*t)]; 
    i = i - 0.1; 
    a = (i^-1)*.05; 
end 

z = 0.5*((x.^2) - (0.5*(y.^2))); 

points = [x
    y
    z];
save('pringle.dat','points');