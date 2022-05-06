//For sqaure wave and giving coefficients of Fourier series also
//for running first define function acc to yourself which can show sqaure wave feature using 'deff' in console and call the function Fplot in function.
funcprot(0);
clf;clc
function [A0,An,Bn]=Fplot(l,n,f3,f4)   //as function is divided in two parts so f3 and f4, as function limit id - l to l so 'l' is half of that period and 'n' is number of terms we needed.
    A0=(1/l)*(integrate('f3(x)', 'x', -l,0,1e-2)+integrate('f4(x)','x',0,l,1e-2)) // 1e-2 is for adjusting the error due to convergence of integration.
    for i=1:n;
        An(i)=(1/l)*(integrate('f3(x)*cos(i*%pi*x/l)','x',-l,0,1e-2)+integrate('f4(x)*cos(i*%pi*x/l)','x',0,l,1e-2));
        Bn(i)=(1/l)*(integrate('f3(x)*sin(i*%pi*x/l)','x',-l,0,1e-2)+integrate('f4(x)*sin(i*%pi*x/l)','x',0,l,1e-2));
    end
    function FS= sol(x)
        FS= A0/2;
        for i=1:n;
            FS=FS+An(i)*cos(i*%pi*x/l)+Bn(i)*sin(i*%pi*x/l);
        end
    endfunction
    x=-5*l:0.1:5*l;
    plot2d(x,sol(x),5);
    xlabel("x")
    ylabel("y")
    xtitle("Sqaurewave through fourier series")
    
endfunction

