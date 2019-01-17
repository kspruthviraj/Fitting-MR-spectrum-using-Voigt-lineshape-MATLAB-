function  [y_fitted, pars_fitted]= voigtFit_pk1(pars0,data)
%function  [y_fitted, pars_fitted]= voigtFit_pk1(pars0,pars1,data)
t=(0:0.25:((length(data)/4)-0.25))';
% pars0 = initial values of parameters to be estimated ([A L G])
    options = optimset('TolX',1e-10,'MaxFunEvals',1e10, 'MaxIter',1e10);
    [pars_fitted, ~] = fminsearch(@(pars) se_fun(pars, data, t), pars0,options);
    
    %[pars_fitted, ~] = fminsearchbnd(@(pars) se_fun(pars, data, t), pars0,[],pars1,options);
    %[pars_fitted, ~] = fminsearchbnd(Quadraticfun,[1 2 3 4 5],LB,[],opts)

    
    y_fitted = voigt_pk1( t, pars_fitted(1), pars_fitted(2), pars_fitted(3));
end

function se = se_fun(pars,data,t)
% SE_FUN defines the objective function to be minimised 
% se = squared error
 
    A=pars(1);
    L=pars(2);
    G=pars(3); 

    % Voigt model
    est_peak= voigt_pk1(t,A,L,G);
    
    % squared error
    se = sum((est_peak-data).^2);
end