clear all
% mex cec20_func.cpp -DWINDOWS
Func_Num=[1:10];
D=20;
Max_FEs=50000;
Xmin=-100;
Xmax=100;
pop_size=100;
iter_max=fix(Max_FEs/pop_size);
runs=1;
fhd=str2func('cec20_func');
for i=1:10
    func_num=Func_Num(i);
    for j=1:runs
        i,j
        [gbest,gbestval,FES]= PSO_func(fhd,D,pop_size,iter_max,Xmin,Xmax,func_num);
        xbest(j,:)=gbest;
        fbest(i,j)=gbestval;
        fbest(i,j)
    end
    f_mean(i)=mean(fbest(i,:));
end



