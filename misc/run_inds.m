function [r1,r2] = run_inds(tot1,tot2,id)

if id < 0 || id > tot1*tot2
    error('Incorrect indeces.');
end
r2 = ceil(id/tot1);
r1 = id - (r2-1)*tot1;
end

