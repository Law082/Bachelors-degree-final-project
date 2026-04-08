function [Q]= geometrieinversalicentaincercare2(Pe)
%Marimi brate 
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


figure
for i=1:n

 J = [...
    cos(q1)*(l2*sin(q2) + l3*sin(q2 + q3) + (l4 + l5)*sin(q2 + q3 + q4)),  sin(q1)*(l2*cos(q2) + l3*cos(q2 + q3) + (l4 + l5)*cos(q2 + q3 + q4)),  sin(q1)*(l3*cos(q2 + q3) + (l4 + l5)*cos(q2 + q3 + q4)),  sin(q1)*cos(q2 + q3 + q4)*(l4 + l5),  0;
    sin(q1)*(l2*sin(q2) + l3*sin(q2 + q3) + (l4 + l5)*sin(q2 + q3 + q4)), -cos(q1)*(l2*cos(q2) + l3*cos(q2 + q3) + (l4 + l5)*cos(q2 + q3 + q4)), -cos(q1)*(l3*cos(q2 + q3) + (l4 + l5)*cos(q2 + q3 + q4)), -cos(q1)*cos(q2 + q3 + q4)*(l4 + l5), 0;
    0, -l2*sin(q2) - l3*sin(q2 + q3) - (l4 + l5)*sin(q2 + q3 + q4), -l3*sin(q2 + q3) - (l4 + l5)*sin(q2 + q3 + q4), -sin(q2 + q3 + q4)*(l4 + l5), 0;
    0, cos(q1), cos(q1), cos(q1), sin(q1)*sin(q2 + q3 + q4);
    0, sin(q1), sin(q1), sin(q1), -cos(q1)*sin(q2 + q3 + q4);
    1, 0, 0, 0, cos(q2 + q3 + q4)
];

    % Transformarea T10

    T10 = [cos(q1), -sin(q1), 0, 0; ...
           sin(q1),  cos(q1), 0, 0; ...
               0,        0,   1, 0; ...
               0,        0,   0, 1];
    p0 = T10 * P0;    
    
    % Transformarea T21
    T21 = [1, 0, 0, 0; ...
           0, cos(q2), -sin(q2), 0; ...
           0, sin(q2),  cos(q2), l1; ...
           0, 0, 0, 1];
     T20 = T10 * T21;
     p1 = T20 * P0;
  
     % Transformarea T32
   T32 = [1, 0, 0, 0; ...
           0,        cos(q3),     -sin(q3),   0; ...
           0, sin(q3),  cos(q3),l2; ...
           0, 0, 0, 1];
    T30 = T10 *T21*T32;
    p2 = T30 * P0;
 

     T43 = [1, 0, 0, 0; ...
           0,        cos(q4),     -sin(q4),   0; ...
           0, sin(q4),  cos(q4),l3; ...
           0, 0, 0, 1];
      T40 = T10 *T21*T32*T43;
       p3 = T40 * P0;
  
     T54 = [cos(q5), -sin(q5), 0, 0; ...
           sin(q5),  cos(q5), 0, 0; ...
               0,        0,   1, l4; ...
               0,        0,   0, 1];
       T50 = T10 *T21*T32*T43*T54;
      p4 = T50 * P0;
  
   Te5 = [ 1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];
    Te5 = T10 * T21 * T32 * T43 * T54 * Te5;
   p5 = Te5 * P0;
  
   P = Pe(1:3) - p5(1:3);

    cla
% Coordonatele cerculețului în 3D
x = 100;
y = 100;
z = 100;

% Desenarea cerculețului în 3D
scatter3(x, y, z, 10, 'red', 'filled'); % 100 reprezintă dimensiunea cerculețului



    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1), 30, 'r', 'LineWidth', 1.5); % X
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2), 30, 'g', 'LineWidth', 1.5); % Y
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3), 30, 'b', 'LineWidth', 1.5); % Z

    % Axele celei de-a doua articulații (în sistem global)
    quiver3(p1(1), p1(2), p1(3), T20(1,1), T20(2,1), T20(3,1), 30, 'r', 'LineWidth', 1.5); % X
    quiver3(p1(1), p1(2), p1(3), T20(1,2), T20(2,2), T20(3,2), 30, 'g', 'LineWidth', 1.5); % Y
    quiver3(p1(1), p1(2), p1(3), T20(1,3), T20(2,3), T20(3,3), 30, 'b', 'LineWidth', 1.5); % Z

    quiver3(p2(1), p2(2), p2(3), T30(1,1), T30(2,1), T30(3,1), 30, 'r', 'LineWidth', 1.5); % X
    quiver3(p2(1), p2(2), p2(3), T30(1,2), T30(2,2), T30(3,2), 30, 'g', 'LineWidth', 1.5); % Y
    quiver3(p2(1), p2(2), p2(3), T30(1,3), T30(2,3), T30(3,3), 30, 'b', 'LineWidth', 1.5); % Z

    quiver3(p3(1), p3(2), p3(3), T40(1,1), T40(2,1), T40(3,1), 30, 'r', 'LineWidth', 1.5); % X
    quiver3(p3(1), p3(2), p3(3), T40(1,2), T40(2,2), T40(3,2), 30, 'g', 'LineWidth', 1.5); % Y
    quiver3(p3(1), p3(2), p3(3), T40(1,3), T40(2,3), T40(3,3), 30, 'b', 'LineWidth', 1.5); % Z

    quiver3(p4(1), p4(2), p4(3), T50(1,1), T50(2,1), T50(3,1), 30, 'r', 'LineWidth', 1.5); % X
    quiver3(p4(1), p4(2), p4(3), T50(1,2), T50(2,2), T50(3,2), 30, 'g', 'LineWidth', 1.5); % Y
    quiver3(p4(1), p4(2), p4(3), T50(1,3), T50(2,3), T50(3,3), 30, 'b', 'LineWidth', 1.5); % Z

    quiver3(p5(1), p5(2), p5(3), Te5(1,1), Te5(2,1), Te5(3,1), 30, 'r', 'LineWidth', 1.5); % X
    quiver3(p5(1), p5(2), p5(3), Te5(1,2), Te5(2,2), Te5(3,2), 30, 'g', 'LineWidth', 1.5); % Y
    quiver3(p5(1), p5(2), p5(3), Te5(1,3), Te5(2,3), Te5(3,3), 30, 'b', 'LineWidth', 1.5); % Z

    % Linia între articulații
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'g', 'LineWidth', 3);
    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'g', 'LineWidth', 3);
    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'b', 'LineWidth', 3);

    grid on;
    hold on;
xlim([-600, 600]); ylim([-600, 600]); 


    
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
%    p0 = T10 * P0;
%    p2 = T10 * T21 * T32 * P0;
%    p3 = T10 * T21 * T32 * T43 * P0;
%    p4 = T10 * T21 * T32 * T43 * T54 * P0;
%    p5 = T10 * T21 * T32 * T43 * T54 * Te5 * P0;
%    P = Pe(1:3) - p5(1:3);
%    xlim([-600, 600]); ylim([-600, 600]); 
%
%
% % Coordonatele cerculețului în 3D
%x = 100;
%y = 100;
%z = 100;
%
%% Desenarea cerculețului în 3D
%scatter3(x, y, z, 10, 'red', 'filled'); % 100 reprezintă dimensiunea cerculețului
%
%
%    hold on
%    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1), 30, 'r', 'LineWidth', 1.5); % X
%    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2), 30, 'g', 'LineWidth', 1.5); % Y
%    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3), 30, 'b', 'LineWidth', 1.5); % Z
%
%    % Axele celei de-a doua articulații (în sistem global)
%    quiver3(p1(1), p1(2), p1(3), T20(1,1), T20(2,1), T20(3,1), 30, 'r', 'LineWidth', 1.5); % X
%    quiver3(p1(1), p1(2), p1(3), T20(1,2), T20(2,2), T20(3,2), 30, 'g', 'LineWidth', 1.5); % Y
%    quiver3(p1(1), p1(2), p1(3), T20(1,3), T20(2,3), T20(3,3), 30, 'b', 'LineWidth', 1.5); % Z
%
%    quiver3(p2(1), p2(2), p2(3), T30(1,1), T30(2,1), T30(3,1), 30, 'r', 'LineWidth', 1.5); % X
%    quiver3(p2(1), p2(2), p2(3), T30(1,2), T30(2,2), T30(3,2), 30, 'g', 'LineWidth', 1.5); % Y
%    quiver3(p2(1), p2(2), p2(3), T30(1,3), T30(2,3), T30(3,3), 30, 'b', 'LineWidth', 1.5); % Z
%
%    quiver3(p3(1), p3(2), p3(3), T40(1,1), T40(2,1), T40(3,1), 30, 'r', 'LineWidth', 1.5); % X
%    quiver3(p3(1), p3(2), p3(3), T40(1,2), T40(2,2), T40(3,2), 30, 'g', 'LineWidth', 1.5); % Y
%    quiver3(p3(1), p3(2), p3(3), T40(1,3), T40(2,3), T40(3,3), 30, 'b', 'LineWidth', 1.5); % Z
%
%    quiver3(p4(1), p4(2), p4(3), T50(1,1), T50(2,1), T50(3,1), 30, 'r', 'LineWidth', 1.5); % X
%    quiver3(p4(1), p4(2), p4(3), T50(1,2), T50(2,2), T50(3,2), 30, 'g', 'LineWidth', 1.5); % Y
%    quiver3(p4(1), p4(2), p4(3), T50(1,3), T50(2,3), T50(3,3), 30, 'b', 'LineWidth', 1.5); % Z
%
%    quiver3(p5(1), p5(2), p5(3), Te5(1,1), Te5(2,1), Te5(3,1), 30, 'r', 'LineWidth', 1.5); % X
%    quiver3(p5(1), p5(2), p5(3), Te5(1,2), Te5(2,2), Te5(3,2), 30, 'g', 'LineWidth', 1.5); % Y
%    quiver3(p5(1), p5(2), p5(3), Te5(1,3), Te5(2,3), Te5(3,3), 30, 'b', 'LineWidth', 1.5); % Z
%
%    % Linia între articulații
%    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
%    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
%    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'g', 'LineWidth', 3);
%    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'g', 'LineWidth', 3);
%    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'b', 'LineWidth', 3);
%    % Coordonatele cerculețului în 3D
%x =100;
%y =100;
%z =100;
%
%% Desenarea cerculețului în 3D
%scatter3(x, y, z, 10, 'red', 'filled'); % 100 reprezintă dimensiunea cerculețului
%
%    grid on;
end