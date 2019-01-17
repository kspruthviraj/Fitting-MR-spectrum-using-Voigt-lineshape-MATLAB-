function  [fV]= VOIGT_LW(Apod)
data=(real(Apod));
pars0=[100000 10 10];
[~, pars_fitted]= voigtFit_pk1(pars0,data);
%figure; plot(data,'b');hold on;plot(y_fitted,'r');hold off;
%legend('original','fitted');
L=pars_fitted(2);
G=pars_fitted(3);
fL= 1/(pi*L*0.001);
fG=1/(2*G*0.001*sqrt(2*log(2)));
fV=( 0.5346*fL + sqrt((0.2166*fL^2)+fG^2) );
end