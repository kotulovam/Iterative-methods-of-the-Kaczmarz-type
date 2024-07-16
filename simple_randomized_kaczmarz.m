% Simple-Randomized Kaczmarz method
% Input: A - matrix, b - the right-hand side vector, it - number of iterations, x_0 - initial guess
% Output: x - final approximation of the solution, 
%         x_values - approximations of the solution obtained from iterations
%         x_times - time taken to calculate approximations
function [x, x_values, x_times] = simple_randomized_kaczmarz(A, b, it, x_0)
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
            r_i = randi([1, m]); % row is chosen randomly in each iteration
            r_r = A(r_i,:);  
            s = dot(r_r',x);
            update = ((b(r_i) - s)*r_r')/v_norm(:,r_i);
            x = x + update;
            x_values = [x_values,x];
            time = toc(start_time);
            x_times = [x_times, time];
    end
    x_values = [x_0, x_values];
end
