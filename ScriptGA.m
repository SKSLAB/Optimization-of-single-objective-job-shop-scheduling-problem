clc; clear;close all;

nProblems = 10; nRuns = 4;
FVAL = NaN(nProblems,nRuns);

for  p = 1:nProblems

    [lb, ub,FITNESSFCN] = ProblemDetails(p);
    
    Nvars = length(lb);  Sol = NaN(nRuns,Nvars);
    
    options = gaoptimset('PopulationSize', 100,'Generations',500, 'TolCon', 0, 'StallGen', 500);      
    
    for r = 1:nRuns
        rng(r, 'twister');
        [Sol(r,:), FVAL(p,r)] = ga(FITNESSFCN,Nvars,[],[],[],[],lb,ub,[],1:Nvars,options);
    end
    
    % This section is required only if the Gantt Charts are to be plotted
    plotfigure(FVAL(p,:), Sol, Nvars, p)

    % comment line 20 and uncomment line 23 to have subplots of Gantt Chart
    % for both data set of each problem
    
%     subplotfigure(FVAL(p,:), Sol, Nvars, p)
end
showStatTable(FVAL,nProblems,nRuns)
