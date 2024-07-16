% Controlled-Randomized Kaczmarz method
% Input: A - matrix, b - the right-hand side vector, it - number of iterations, x_0 - initial guess
% Output: x - final approximation of the solution, 
%         x_values - approximations of the solution obtained from iterations
%         x_times - time taken to calculate approximations
function [x, x_values, x_times] = controlled_randomized_kaczmarz(A, b, it, x_0)
   [m, n] = size(A); 
    x = x_0 ; 
    x_values = [ ]; 
    x_times = [ ];
    v_norm = [ ];


    for i = 1:m % precomputation of the norms of row vectors
        r = A(i,:); 
        norma = norm(r)^2;
        v_norm = [v_norm, norma];
    end

    start_time = tic;
    for p = 1:it  % rows are chosen in random order without repetition
        random_rows = randperm(m); % vector of permutation of the row indices
        for i = 1:m 
            r = A(random_rows(i),:); 
            s = dot(r',x); 
            update = ((b(random_rows(i)) - s)*r')/v_norm(:,random_rows(i));
            x = x + update;
        end
        time = toc(start_time);
        x_times = [x_times, time];
        x_values = [x_values,x];
    end
    x_values = [x_0, x_values];
end
