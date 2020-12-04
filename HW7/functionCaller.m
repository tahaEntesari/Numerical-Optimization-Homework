%% Run powel with SD
clc
clear
clear powel_95101117  powelGradient_95101117

f=@powel_95101117;
gf=@powelGradient_95101117;
x0=[1,2,2,2]';
stop_tol=0.001;

[x_min,f_min,iter]=SD_strongWolfe_95101117(f,gf,x0,stop_tol);

fprintf('Solved Powel using Steepest descent\n');
fprintf('The minimum point:\n');
disp(x_min);
fprintf('The function''s value at this point: ');
disp(f_min);
fprintf('The number of iterations: %d\n',iter);

fprintf('number of function evaluations: %d',f(0,0))
fprintf('\n number of gradient evaluations: %d\n',gf(0,0))
%% Run Rosenbrock with SD

clc
clear
clear rosenbrock_95101117  rosenbrockGradient_95101117

f=@rosenbrock_95101117;
gf=@rosenbrockGradient_95101117;
x0=[1,2]';
stop_tol=0.001;

[x_min,f_min,iter]=SD_strongWolfe_95101117(f,gf,x0,stop_tol);

fprintf('Solved Powel using Steepest descent\n');
fprintf('The minimum point:\n');
disp(x_min);
fprintf('The function''s value at this point: ');
disp(f_min);
fprintf('The number of iterations: %d\n',iter);

fprintf('number of function evaluations: %d',f(0,0))
fprintf('\n number of gradient evaluations: %d\n',gf(0,0))
%% Run Powel with Newton
clc
clear
clear powel_95101117  powelGradient_95101117 powelHessian_95101117

f=@powel_95101117;
gf=@powelGradient_95101117;
hf=@powelHessian_95101117;
x0=[1,2,2,2]';
stop_tol=0.001;

[x_min,f_min,iter]=Newton_strongWolfe_95101117(f,gf,hf,x0,stop_tol);
fprintf('Solved Powel using Newton''s method\n');
fprintf('The minimum point:\n');
disp(x_min);
fprintf('The function''s value at this point: ');
disp(f_min);
fprintf('The number of iterations: %d\n',iter);

fprintf('number of function evaluations: %d',f(0,0))
fprintf('\n number of gradient evaluations: %d',gf(0,0))
fprintf('\nnumber of hessian evaluations: %d\n',hf(0,0))

%% Rosenbrock Newton

clc
clear
clear rosenbrock_95101117 rosenbrockGradient_95101117 rosenbrockHessian_95101117

f=@rosenbrock_95101117;
gf=@rosenbrockGradient_95101117;
hf=@rosenbrockHessian_95101117;
x0=[1,2]';
stop_tol=0.001;

[x_min,f_min,iter]=Newton_strongWolfe_95101117(f,gf,hf,x0,stop_tol);
fprintf('Solved Rosenbrock using Newton''s method\n');
fprintf('The minimum point:\n');
disp(x_min);
fprintf('The function''s value at this point: ');
disp(f_min);
fprintf('The number of iterations: %d\n',iter);

fprintf('number of function evaluations: %d',f(0,0))
fprintf('\n number of gradient evaluations: %d',gf(0,0))
fprintf('\nnumber of hessian evaluations: %d\n',hf(0,0))