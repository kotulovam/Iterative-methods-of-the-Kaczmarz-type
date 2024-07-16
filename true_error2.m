% Reaching a given accuracy
function [err,time] = true_error2(it, x_exact, x_values, x_times, accuracy)
    err = [ ];

    for k = 1:(it+1)
        e = norm(x_exact-x_values(:,k))/norm(x_exact);
        err = [err, e];
        if e < accuracy
            time = x_times(:, k);
            return;
        end    
    end

    err = [];
    time = 0;
end
