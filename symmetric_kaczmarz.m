% Symmetric Kaczmarz method
% Input: A - matrix, b - the right-hand side vector, it - number of iterations, x_0 - initial guess
% Output: x - final approximation of the solution, 
%         x_values - approximations of the solution obtained from iterations
%         x_times - time taken to calculate approximations
function [x, x_values, x_times] = symmetric_kaczmarz(A, b, it, x_0)
    [m, n] = size(A); 
    x = x_0 ; 
    x_values = [ ];
    x_times  = [ ];
    v_norm = [ ];


    for i = 1:m % precomputation of the norms of row vectors
        r = A(i,:); 
        norma = norm(r)^2;
        v_norm = [v_norm, norma];
    end


    start_time = tic;
    for p = 1:it
        for i = 1:2*(m-1) % sweep over 2m-2 rows of A, from the first to the last then from the penultimate to the second row of A
            if i <= m 
                r_i = i;
            else
                r_i = m - mod(i,m);
            end            
            r = A(r_i,:);
            s = dot(r',x); 
            update = ((b(r_i) - s)*r')/v_norm(:,r_i);
            x = x + update;
        end
        time = toc(start_time);
        x_times = [x_times, time];
        x_values = [x_values,x];

    end
    x_values = [x_0, x_values];
end