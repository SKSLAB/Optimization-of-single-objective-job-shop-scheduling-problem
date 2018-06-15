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

    % Gantt Chart subplot for both sets in each problem as shown in SKSJSSPUpload.pdf can 
    % be obtained by commenting function call plotfigure (line 21) and uncommenting function 
    % call subplotfigure (line 27). This function (subplotfigure) also shows how to set title, 
    % barWidth, xLabel and yLabel to Gantt Chart.
    % subplotfigure(FVAL(p,:), Sol, Nvars, p)
end
showResultTable(FVAL,nProblems,nRuns)
