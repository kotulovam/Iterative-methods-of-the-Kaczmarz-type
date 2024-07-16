% True error
function err = true_error1(it, x_exact, x_values)
    err = [ ];

    for k = 1:(it+1)
        e = norm(x_exact-x_values(:,k))/norm(x_exact);
        err = [err, e];
       
    end   
end