function [mean,Var,Skewness,Kurtosis, Type] = Mean_Var(filename)

s=importdata(filename);
str=upper(s(:));
str=[str{:}];
AZ='A':'Z';
longs=sum(ismember(str,AZ));
k=0;
Let =[];
global let;
let=0;
Type='undefined';
%e=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26];
for k=1:26
    let=sum(ismember(str,AZ(k)));
    Let(k)=let;
    test(k)=Let(k)/longs;
    fx_x(k)=(Let(k)/longs)*k;
    fx_x_sqr(k)=fx_x(k)*k;
    fx_x_third(k)=fx_x_sqr(k)*k;
    fx_x_forth(k)=fx_x_third(k)*k;
end
SUM_fx_x=0;
SUM_fx_x_sqr=0;
SUM_fx_x_third=0;
SUM_fx_x_forth=0;
for w=1:26
    SUM_fx_x=SUM_fx_x+fx_x(w);
    SUM_fx_x_sqr=SUM_fx_x_sqr+fx_x_sqr(w);
    SUM_fx_x_third=SUM_fx_x_third+fx_x_third(w);
    SUM_fx_x_forth=SUM_fx_x_forth+fx_x_forth(w);
end
mean=SUM_fx_x;
Var=SUM_fx_x_sqr-(mean*mean);
Skewness=(SUM_fx_x_third-(3*mean*Var)-(mean^3))/(Var^(3/2));
Kurtosis=(SUM_fx_x_forth-(4*mean*SUM_fx_x_third)+(6*(mean^2)*Var)+(3*(mean^4)))/(Var^2);


%%%%%%%%%%%%% which type %%%%%%%%%%%%%%%%%%

if ( (Skewness >-1) && (Skewness < 1))
    if ((Kurtosis< 4) && (Kurtosis> 2))
        Type = 'Normal Distribution';
    end
end
if ( (Skewness >1.5) && (Skewness < 2.5))
 if ((Kurtosis< 7) && (Kurtosis> 5))
Type = 'Exponential Distribution';
 end
end
if ( (Skewness <1.5) && (Skewness > 1))
Type = 'Positive skewness (right)';
end
if ( (Skewness <0) && (Skewness > -3))
Type = 'Negative skewness (left)';
end
end
