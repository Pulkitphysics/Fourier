clc
a= input("lower limit=")
b= input("upper limit=")
n= input("number of coefficient needed= ")

function F=f(x)
    F= x;
    disp(F)
endfunction
disp("the amplitude of series =")
    a0=(2/(b-a))*intg(a,b,f,1e-2)   //here we have fourth argument for adjusting the error of converging integral
 disp(a0);
 disp("the cosine coefficients")
  for i=1:n
        function C=c(x)
            C=f(x)*cos(2*i*%pi*x/(b-a));
        endfunction
        A(i)=(2/(b-a))*intg(a,b,c,1e-2);
        disp(A(i))
    end
    disp("the sine coefficients")
    for i=1:n
        function S=s(x)
            S=f(x)*sin(2*i*%pi*x/(b-a));
        endfunction
        B(i)=(2/(b-a))*intg(a,b,s,1e-2);
        disp(B(i))
    end
    function Y=y(x)
        Y=a0
        for i=1:n
            Y=Y+A(i)*cos(2*i*%pi*x/(b-a))+B(i)*sin(2*i*%pi*x/(b-a));
        end
    endfunction
    x=[0:0.1:6*%pi]
    plot2d(x,y(x),5)
    xlabel("x")
    ylabel("y")
    xtitle("saw tooth wave through fourier series")

    

     
   
        
        
        
    
    


