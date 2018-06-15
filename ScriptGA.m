clc; clear;close all;

nProblems = 10;
nRuns = 4;

BObj = NaN(nProblems,1);

for  p = 1:nProblems
    
    [lb, ub,FITNESSFCN] = ProblemDetails(p);
    
    Nvars = length(lb); FVAL = NaN(nRuns,1); Sol = NaN(nRuns,Nvars);
    
    options = gaoptimset('PopulationSize', 100,'Generations',500, 'TolCon', 0, 'StallGen', 500);      
    
    for r = 1:nRuns
        rng(r, 'twister');
        [Sol(r,:),FVAL(r),EXITFLAG,OUTPUT] = ga(FITNESSFCN,Nvars,[],[],[],[],lb,ub,[],1:Nvars,options);
    end
    
    % This section is required only if the Gantt Charts are to be plotted
    [BObj(p), ind] = min(FVAL);   
    BSol = Sol(ind,:);
    
    Machine   = BSol(1:Nvars/2);
    StartTime = BSol(Nvars/2+1:end);
    [~,~,dur]   = ProblemData(p);
    ProcessTime = NaN(Nvars/2,1);
    for f=1:Nvars/2;  ProcessTime(f) = dur(f,BSol(f)); end;
     
    figure
    plotgc(Machine, StartTime, ProcessTime)
     
%     Gantt Chart subplot for both sets in each problem as shown in SKSJSSPUpload.pdf can 
%     be obtained by commenting line 31 & 32 and uncommenting line 39 to 51
%     This section also shows how to set title, barWidth, xLabel and yLabel
%     to Gantt Chart
%
%     e = mod(p,2) == 0;
%     opts.title = strcat('P',num2str(ceil(p/2)),'S',num2str(e*2+(1-e)));
%     opts.barW = 0.04;
%     opts.xLabel = 'Processing Time';
%     opts.yLabel = 'Machines';
%     
%     if ~mod(p,2)==0
%         figure
%         subplot(1,2,1)
%     else
%         subplot(1,2,2)
%     end
%     plotgc(Machine, StartTime, ProcessTime, opts)

end
