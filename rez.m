% Residual error
function r_values = rez(A,b,it,x_values)
         r_values = [ ];
         norma = norm(b-A*x_values(:,1));


    for k = 1:(it+1)
        r = norm(b-A*x_values(:,k))/norma; % x_values(1)=x_0
        r_values = [r_values,r];
    end
end
