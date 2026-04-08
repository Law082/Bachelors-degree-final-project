function [qt,viteza,acceleratie,t] =PickandPlace(Q_initial,Q_final,delta)
%delta=durata totala a traiectoriei
t=linspace(0,delta);
%Coeficienti
a0=Q_initial;
a1=0;                     
a2=3*(Q_final-Q_initial)/(delta^2);
a3=-2*(Q_final-Q_initial)/(delta^3);

qt=a3*t.^3+a2*t.^2+a1*t+a0;  %pozitie
viteza = 3*a3*t.^2 + 2*a2*t + a1;
acceleratie = 6*a3*t + 2*a2;

figure %pozitie in functie de timp
    subplot(3, 1, 1)
    plot(t, qt);
    xlabel('Time');
    ylabel('Pozitie');
    grid on
    
    subplot(3, 1, 2) %viteza in functie de timp
    plot(t, viteza);
    xlabel('Time');
    ylabel('Viteza');
    grid on
    
    subplot(3, 1, 3) %acceleratie in functie de timp
    plot(t, acceleratie);
    xlabel('Time');
    ylabel('Acceleratie');
    grid on
    
    
    disp('a0')
    disp(a0)
    disp('a1')
    disp(a1)
    disp('a2')
    disp(a2)
    disp('a3')
    disp(a3)
    

end