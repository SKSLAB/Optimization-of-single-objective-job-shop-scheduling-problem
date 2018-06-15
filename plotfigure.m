function [  ] = plotfigure( FVAL, Sol, Nvars, p )

    [~, ind] = min(FVAL);   
    BSol = Sol(ind,:);
    
    Machine   = BSol(1:Nvars/2);
    StartTime = BSol(Nvars/2+1:end);
    [~,~,dur]   = ProblemData(p);
    ProcessTime = NaN(Nvars/2,1);
    for f=1:Nvars/2;  ProcessTime(f) = dur(f,BSol(f)); end;
     
    figure
    plotgc(Machine, StartTime, ProcessTime)
end

