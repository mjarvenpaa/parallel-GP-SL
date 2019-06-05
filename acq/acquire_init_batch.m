function init_ths = acquire_init_batch(nr_pts,grid_th) 
% Select intial locations by sampling from uniform density in the grid.
%
% (Alternatively, one could use quasi-MC or latin hypercube sampling or one could sample 
% from the prior of simulation model. These approaches are currently not implemented.)

init_ths = zeros(nr_pts, grid_th.dim);
for i = 1:grid_th.dim
    init_ths(:,i) = grid_th.theta(i,1) ...
        + (grid_th.theta(i,end)-grid_th.theta(i,1)) * rand(nr_pts,1);
end
end



