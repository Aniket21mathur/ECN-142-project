%the value of maxx should be increased with time as the graph becomes more
%dispersed with time.
%  tcal = 10^-15s :  maxx = 5*10^-8
%  tcal = 10^-14s :  maxx = 5*10^-7
%  tcal = 10^-13s :  maxx = 5*10^-7
%  tcal = 10^-12s :  maxx = 5*10^-6
%  tcal = 10^-11s :  maxx = 5*10^-6
%  tcal = 10^-10s :  maxx = 5*10^-5
%  tcal = 10^-09s :  maxx = 5*10^-4
%  tcal = 10^-08s :  maxx = 5*10^-4
%the value of tp=10^-7s and value of Na=10^16;
tcal=10^-10;
%max range should be changes with tcal
maxx=5*10^-4;
%in place of dx;
elementx=5*10^-6;
%dp=up*0.026;
%up at 300 450cm^2/v-s;
%Dp-diffusion coefficient;
Dp=11700*10^-7;
%conditions to get satisfactory deltaT;
if tcal > 10^-13
    deltaT=10^-17;
else
    deltaT=tcal/1000;
end
ele=int16(maxx/elementx);
array=zeros(1,2+ele);
%making the middle two elements Nin;
array(int16(ele/2))=10^18;
array(1+int16(ele/2))=10^18;
tmp=zeros(1,2+ele);
x=-int16(ele/2):1:1+int16(ele/2);
counts=tcal/deltaT;
for t=0:counts
    for i=2:(ele+1)
        tmp(i)=array(i)+(deltaT*Dp/(elementx^2))*(array(i+1)-2*array(i)+array(i-1))-(array(i)*deltaT)/10^-7;
    end
    array=tmp;
end
%p=10^16+p;
%graph of deltap;
plot(x,array)