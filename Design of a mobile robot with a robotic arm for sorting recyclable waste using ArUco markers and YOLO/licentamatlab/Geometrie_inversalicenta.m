function [Q]= Geometrie_inversalicenta(Pe)
%Marimi brate 
l1 = 0.1;
l2 = 0.2;
l3 = 0.3;
l4 = 0.4;
l5 = 0.5;
l6 = 0.6;

q1=pi/2;
q2=pi/2;
q3=pi/2;
q4=pi/2;
q5=pi/2;

n = 100;                % Numărul de pași pentru iterație.
alpha = 0.2;            % Mărimea pașilor de iterație.
epsilon = 10^-3;        % Precizia pentru a opri iterația când eroarea este suficient de mică

Q =  [q1;q2;q3;q4;q5];           
P0 = [0; 0; 0; 1];



for i=1:n
     J=[ 1, 0, l4*(-sin(q3)/5),0;
         0, 1, l4*(cos(q3)/5),0;
         0, 0, l4*(-sin(q3)),0;
         0, 0, l4*(cos(q3)),1;];
 T10 = [cos(q1), -sin(q1), 0, 0; ...
           sin(q1),  cos(q1), 0, 0; ...
               0,        0,   1, l1; ...
               0,        0,   0, 1];
    p0 = T10 * P0;

    % Transformarea T21
    T21 = [cos(q2), -sin(q2), 0, 0; ...
           0,        0,      -1, 0; ...
           sin(q2),  cos(q2), 0, l2; ...
           0,        0,       0, 1];
    p1 = T10 * T21 * P0;

    % Transformarea T32
    T32 = [cos(q3), -sin(q3), 0, 0; ...
           0,        0,       1, 0; ...
          -sin(q3), -cos(q3), 0, l3; ...
           0,        0,       0, 1];
    p2 = T10 * T21 * T32 * P0;

    % Transformarea T43
    T43 = [cos(q4), -sin(q4), 0, 0; ...
           0,        0,      -1, 0; ...
           sin(q4),  cos(q4), 0, l4; ...
           0,        0,       0, 1];
    p3 = T10 * T21 * T32 * T43 * P0;

    % Transformarea T54
    T54 = [cos(q5), -sin(q5), 0, 0; ...
           0,        0,       1, 0; ...
          -sin(q5), -cos(q5), 0, l5; ...
           0,        0,       0, 1];
    p4 = T10 * T21 * T32 * T43 * T54 * P0;

    % Transformarea Te5
    Te5 = [1, 0, 0, l6;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
    p5 = T10 * T21 * T32 * T43 * T54 * Te5 * P0;

   
    P = Pe - (T10*T21*T32*T43*T54*Te5*P0);

    cla
  pause(0.1);
    
      if abs(P) < epsilon
        break
      end
    Q = Q + alpha*transpose(J)*inv(J*transpose(J))*P;
    q1 = Q(1);
    q2 = Q(2);
    q3 = Q(3);
    q4 = Q(4);
    q5 = Q(5);
end
    P = Pe - (T10*T21*T32*T43*T54*Te5*P0);
    P1 = T10*P0;
    P2 = T10*T21*P0;
    P3=T10*T21*T32*P0;
    P4=T10*T21*T32*T43*P0
    P5=T10*T21*T32*T43*T54*P0
    Pe=T10*T21*T32*T43*T54*Te5*P0
   
    disp('P1=')
    disp(P1)
    disp('P2=')
    disp(P2)
end