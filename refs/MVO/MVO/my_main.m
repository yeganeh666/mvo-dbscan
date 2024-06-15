
clc
clear
close all

Universes_no=60; %Number of search agents (universes)

Function_name='F17'; %Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=500; %Maximum numbef of iterations

%Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);


% Problem Definition
prob.CostFunction = fobj; % Cost Function
prob.VarMin = lb; % Lower Bound of Variables
prob.VarMax = ub; % Upper Bound of Variables
prob.nVar = dim;

% MVO Parameters
params.MaxIt = Max_iteration;       % Maximum Number of Iterations
params.nPop = Universes_no;   % Population Size (Swarm Size)
params.dispFlag = 1;


best_sol=MVO_(prob,params);
