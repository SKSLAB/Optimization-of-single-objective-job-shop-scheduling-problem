function [  ] = subplotfigure( FVAL, Sol, Nvars, p )

    [~, ind] = min(FVAL);   
    BSol = Sol(ind,:);
    
    Machine   = BSol(1:Nvars/2);
    StartTime = BSol(Nvars/2+1:end);
    [~,~,dur]   = ProblemData(p);
    ProcessTime = NaN(Nvars/2,1);
    for f=1:Nvars/2;  ProcessTime(f) = dur(f,BSol(f)); end;
    

    e = mod(p,2) == 0;
    opts.title = strcat('P',num2str(ceil(p/2)),'S',num2str(e*2+(1-e)));
    opts.barW = 0.04;
    opts.xLabel = 'Processing Time';
    opts.yLabel = 'Machines';
    
    if ~mod(p,2)==0
        figure
        subplot(1,2,1)
    else
        subplot(1,2,2)
    end
    plotgc(Machine, StartTime, ProcessTime, opts)


end

