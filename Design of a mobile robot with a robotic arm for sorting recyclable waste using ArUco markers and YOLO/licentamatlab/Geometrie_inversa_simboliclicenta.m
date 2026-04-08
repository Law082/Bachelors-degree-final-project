function [Q]= Geometrie_inversa_simboliclicenta(Pe)
l1 = 20;
l2 = 105;
l3 = 145;
l4 = 70;
l5 = 110;

q1=pi/4;
q2=pi/4;
q3=pi/4;
q4=pi/4;
q5=pi/4;

n = 100;                % Numărul de pași pentru iterație.
alpha = 0.05;            % Mărimea pașilor de iterație.
epsilon = 10^-3;        % Precizia pentru a opri iterația când eroarea este suficient de mică

Q =  [q1;q2;q3;q4;q5];          
P0 = [0; 0; 0; 1];


for i=1:n
     J=   [ ...
    cos(q1)*(l2*sin(q2) + l3*sin(q2 + q3) + l4*sin(q2 + q3 + q4) + l5*sin(q2 + q3 + q4)), ...
    sin(q1)*(l2*cos(q2) + l3*cos(q2 + q3) + l4*cos(q2 + q3 + q4) + l5*cos(q2 + q3 + q4)), ...
    sin(q1)*(l3*cos(q2 + q3) + l4*cos(q2 + q3 + q4) + l5*cos(q2 + q3 + q4)), ...
    cos(q2 + q3 + q4)*sin(q1)*(l4 + l5), ...
    0;

    sin(q1)*(l2*sin(q2) + l3*sin(q2 + q3) + l4*sin(q2 + q3 + q4) + l5*sin(q2 + q3 + q4)), ...
   -cos(q1)*(l2*cos(q2) + l3*cos(q2 + q3) + l4*cos(q2 + q3 + q4) + l5*cos(q2 + q3 + q4)), ...
   -cos(q1)*(l3*cos(q2 + q3) + l4*cos(q2 + q3 + q4) + l5*cos(q2 + q3 + q4)), ...
   -cos(q2 + q3 + q4)*cos(q1)*(l4 + l5), ...
    0;

    0, ...
   -l2*sin(q2) - l3*sin(q2 + q3) - l4*sin(q2 + q3 + q4) - l5*sin(q2 + q3 + q4), ...
   -l3*sin(q2 + q3) - l4*sin(q2 + q3 + q4) - l5*sin(q2 + q3 + q4), ...
   -sin(q2 + q3 + q4)*(l4 + l5), ...
    0;

    0, cos(q1), cos(q1), cos(q1), sin(q2 + q3 + q4)*sin(q1);

    0, sin(q1), sin(q1), sin(q1), -sin(q2 + q3 + q4)*cos(q1);

    1, 0, 0, 0, cos(q2 + q3 + q4)
];
  T10 = [cos(q1), -sin(q1), 0, 0; ...
           sin(q1),  cos(q1), 0, 0; ...
               0,        0,   1, 0; ...
               0,        0,   0, 1];
    p0 = T10 * P0;

    % Transformarea T21
     T21 = [1, 0, 0, 0; ...
           0,        cos(q2),     -sin(q2),   0; ...
           0, sin(q2),  cos(q2),l1; ...
           0, 0, 0, 1];
    p1 = T10 * T21 * P0;

    % Transformarea T32
   T32 = [1, 0, 0, 0; ...
           0,        cos(q3),     -sin(q3),   0; ...
           0, sin(q3),  cos(q3),l2; ...
           0, 0, 0, 1];
    p2 = T10 * T21 * T32 * P0;

    % Transformarea T43
      
     T43 = [1, 0, 0, 0; ...
           0,        cos(q4),     -sin(q4),   0; ...
           0, sin(q4),  cos(q4),l3; ...
           0, 0, 0, 1];
    p3 = T10 * T21 * T32 * T43 * P0;

    % Transformarea T54
      T54 = [cos(q5), -sin(q5), 0, 0; ...
           sin(q5), cos(q5), 0, 0; ...
           0,         0,       1, l4; ...
           0,        0,        0, 1];
    p4 = T10 * T21 * T32 * T43 * T54 * P0;

    % Transformarea Te5
    Te5 = [1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];
    p5 = T10 * T21 * T32 * T43 * T54 * Te5 * P0;
   
     P = Pe(1:3) - p5(1:3);

    cla
    
    pause(0.1);
    
      if abs(P) < epsilon
        break
      end
    J_pos = J(1:3, :); % primele 3 rânduri pentru poziție

    Q = Q + alpha * (J_pos' * inv(J_pos * J_pos')) * P;
    q1 = Q(1);
    q2 = Q(2);
    q3 = Q(3);
    q4 = Q(4);
    q5 = Q(5);
end
   P = Pe - (T10 * T21 * T32 * T43 * T54 * Te5 * P0);
   p0 = T10 * P0;
   p2 = T10 * T21 * T32 * P0;
   p3 = T10 * T21 * T32 * T43 * P0;
   p4 = T10 * T21 * T32 * T43 * T54 * P0;
   p5 = T10 * T21 * T32 * T43 * T54 * Te5 * P0;

end