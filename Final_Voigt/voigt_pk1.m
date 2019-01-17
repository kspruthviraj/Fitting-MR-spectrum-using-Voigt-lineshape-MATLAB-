function y = voigt_pk1(t,A,L,G)
    
    %y= (A* exp( -((G.^2 * t.^2)/2) -(L * abs(t)))) ; % Voigt old
    %y= (A* exp( -(( t.^2/(G.^2 * 2))) -(t/L))) ;
    y= (A* exp( -(( (2*t.^2)/G.^2)) -(t/L))) ;
    
    
    %y = (A* exp(-(t/L))) ; %Lorentzian
    %y= A* exp( -(( t.^2/G.^2)/2)); %Gaussian
    
end
