function [ T ] = showStatTable( FVAL, nProblems, nRuns )
VariableNames = cell(1,nRuns+5);
for c = 2:nRuns+1
    VariableNames{1,c} = strcat('Run',num2str(c-1));
end
VariableNames{1,1}   = 'Problem';
VariableNames{1,c+1} = 'Mean';
VariableNames{1,c+2} = 'Median';
VariableNames{1,c+3} = 'Std';
VariableNames{1,c+4} = 'Best';
VariableNames{1,c+5} = 'Worst';
data = [(1:nProblems)', FVAL, mean(FVAL,2), median(FVAL,2), std(FVAL,0,2), min(FVAL,[],2), max(FVAL,[],2)];
T = array2table(data,'VariableNames', VariableNames);
end

