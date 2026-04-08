function animatie(q1,q2,q3,q4,q5)
figure
l1 = 20;
l2 = 105;
l3 = 145;
l4 = 70;
l5 = 110;

P0 = [0; 0; 0; 1];

for Q1=0:0.01:q1
    Q2=0;
    Q3=0;
    Q4=0;
    Q5=0;
      M = [P0];

    T10 = [cos(Q1), -sin(Q1), 0, 0; ...
           sin(Q1),  cos(Q1), 0, 0; ...
               0,        0,   1, 0; ...
               0,        0,   0, 1];
    p0 = T10 * P0;    
    M = [M, p0];

    T21 = [1, 0, 0, 0; ...
           0, cos(Q2), -sin(Q2), 0; ...
           0, sin(Q2),  cos(Q2), l1; ...
           0, 0, 0, 1];
     T20 = T10 * T21;
     p1 = T20 * P0;
  M = [M, p1];

   T32 = [1, 0, 0, 0; ...
           0,        cos(Q3),     -sin(Q3),   0; ...
           0, sin(Q3),  cos(Q3),l2; ...
           0, 0, 0, 1];
    T30 = T10 *T21*T32;
    p2 = T30 * P0;
 M = [M, p2];

     T43 = [1, 0, 0, 0; ...
           0,        cos(Q4),     -sin(Q4),   0; ...
           0, sin(Q4),  cos(Q4),l3; ...
           0, 0, 0, 1];
      T40 = T10 *T21*T32*T43;
       p3 = T40 * P0;
  M = [M, p3];
     T54 = [cos(Q5), -sin(Q5), 0, 0; ...
           sin(Q5),  cos(Q5), 0, 0; ...
               0,        0,   1, l4; ...
               0,        0,   0, 1];
       T50 = T10 *T21*T32*T43*T54;
      p4 = T50 * P0;
  M = [M, p4];
   Te5 = [ 1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];
    Te5 = T10 * T21 * T32 * T43 * T54 * Te5;
   p5 = Te5 * P0;
  M = [M, p5];

  % Axele primei articulații
    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p1(1), p1(2), p1(3), T20(1,1), T20(2,1), T20(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p1(1), p1(2), p1(3), T20(1,2), T20(2,2), T20(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p1(1), p1(2), p1(3), T20(1,3), T20(2,3), T20(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p2(1), p2(2), p2(3), T30(1,1), T30(2,1), T30(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p2(1), p2(2), p2(3), T30(1,2), T30(2,2), T30(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p2(1), p2(2), p2(3), T30(1,3), T30(2,3), T30(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p3(1), p3(2), p3(3), T40(1,1), T40(2,1), T40(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p3(1), p3(2), p3(3), T40(1,2), T40(2,2), T40(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p3(1), p3(2), p3(3), T40(1,3), T40(2,3), T40(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p4(1), p4(2), p4(3), T50(1,1), T50(2,1), T50(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p4(1), p4(2), p4(3), T50(1,2), T50(2,2), T50(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p4(1), p4(2), p4(3), T50(1,3), T50(2,3), T50(3,3), 30, 'b', 'LineWidth', 1); % Z

   quiver3(p5(1), p5(2), p5(3), Te5(1,1), Te5(2,1), Te5(3,1), 30, 'r', 'LineWidth', 1); % X
   quiver3(p5(1), p5(2), p5(3), Te5(1,2), Te5(2,2), Te5(3,2), 30, 'g', 'LineWidth', 1); % Y
   quiver3(p5(1), p5(2), p5(3), Te5(1,3), Te5(2,3), Te5(3,3), 30, 'b', 'LineWidth', 1); % Z

    % Linia între articulații
    line([0, p0(1)], [0, p0(2)], [0, p0(3)], 'Color', 'y', 'LineWidth', 3);
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'g', 'LineWidth', 3);
    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'g', 'LineWidth', 3);
    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'b', 'LineWidth', 3);
    grid on;
    hold on;
    xlim([-600, 600]);
    ylim([-600, 600]);
    
    pause(0.1);
    cla
end

for Q2=0:0.01:q2
    Q1=q1;
    Q3=0;
    Q4=0;
    Q5=0;
    M = [P0];
 % Transformarea T10
    T10 = [cos(Q1), -sin(Q1), 0, 0; ...
           sin(Q1),  cos(Q1), 0, 0; ...
               0,        0,   1, 0; ...
               0,        0,   0, 1];
    p0 = T10 * P0;    
    M = [M, p0];
    % Transformarea T21
    T21 = [1, 0, 0, 0; ...
           0, cos(Q2), -sin(Q2), 0; ...
           0, sin(Q2),  cos(Q2), l1; ...
           0, 0, 0, 1];
     T20 = T10 * T21;
     p1 = T20 * P0;
  M = [M, p1];
     % Transformarea T32
   T32 = [1, 0, 0, 0; ...
           0,        cos(Q3),     -sin(Q3),   0; ...
           0, sin(Q3),  cos(Q3),l2; ...
           0, 0, 0, 1];
    T30 = T10 *T21*T32;
    p2 = T30 * P0;
 M = [M, p2];

     T43 = [1, 0, 0, 0; ...
           0,        cos(Q4),     -sin(Q4),   0; ...
           0, sin(Q4),  cos(Q4),l3; ...
           0, 0, 0, 1];
      T40 = T10 *T21*T32*T43;
       p3 = T40 * P0;
  M = [M, p3];
     T54 = [cos(Q5), -sin(Q5), 0, 0; ...
           sin(Q5),  cos(Q5), 0, 0; ...
               0,        0,   1, l4; ...
               0,        0,   0, 1];
       T50 = T10 *T21*T32*T43*T54;
      p4 = T50 * P0;
  M = [M, p4];
   Te5 = [ 1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];
    Te5 = T10 * T21 * T32 * T43 * T54 * Te5;
   p5 = Te5 * P0;
   M = [M, p5];


  

  % Axele primei articulații
    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    % Axele celei de-a doua articulații (în sistem global)105213
    quiver3(p1(1), p1(2), p1(3), T20(1,1), T20(2,1), T20(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p1(1), p1(2), p1(3), T20(1,2), T20(2,2), T20(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p1(1), p1(2), p1(3), T20(1,3), T20(2,3), T20(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p2(1), p2(2), p2(3), T30(1,1), T30(2,1), T30(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p2(1), p2(2), p2(3), T30(1,2), T30(2,2), T30(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p2(1), p2(2), p2(3), T30(1,3), T30(2,3), T30(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p3(1), p3(2), p3(3), T40(1,1), T40(2,1), T40(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p3(1), p3(2), p3(3), T40(1,2), T40(2,2), T40(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p3(1), p3(2), p3(3), T40(1,3), T40(2,3), T40(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p4(1), p4(2), p4(3), T50(1,1), T50(2,1), T50(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p4(1), p4(2), p4(3), T50(1,2), T50(2,2), T50(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p4(1), p4(2), p4(3), T50(1,3), T50(2,3), T50(3,3), 30, 'b', 'LineWidth', 1); % Z

   quiver3(p5(1), p5(2), p5(3), Te5(1,1), Te5(2,1), Te5(3,1), 30, 'r', 'LineWidth', 1); % X
   quiver3(p5(1), p5(2), p5(3), Te5(1,2), Te5(2,2), Te5(3,2), 30, 'g', 'LineWidth', 1); % Y
   quiver3(p5(1), p5(2), p5(3), Te5(1,3), Te5(2,3), Te5(3,3), 30, 'b', 'LineWidth', 1); % Z

    % Linia între articulații
    line([0, p0(1)], [0, p0(2)], [0, p0(3)], 'Color', 'y', 'LineWidth', 3);
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'g', 'LineWidth', 3);
    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'g', 'LineWidth', 3);
    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'b', 'LineWidth', 3);
    grid on;
    hold on;
    xlim([-600, 600]);
    ylim([-600, 600]);
    pause(0.1);
    cla
end

for Q3=0:0.1:q3
    Q1=q1;
    Q2=q2;
    Q4=0;
    Q5=0;
    M = [P0];
 % Transformarea T10
    T10 = [cos(Q1), -sin(Q1), 0, 0; ...
           sin(Q1),  cos(Q1), 0, 0; ...
               0,        0,   1, 0; ...
               0,        0,   0, 1];
    p0 = T10 * P0;    
    M = [M, p0];
    % Transformarea T21
    T21 = [1, 0, 0, 0; ...
           0, cos(Q2), -sin(Q2), 0; ...
           0, sin(Q2),  cos(Q2), l1; ...
           0, 0, 0, 1];
     T20 = T10 * T21;
     p1 = T20 * P0;
  M = [M, p1];
     % Transformarea T32
   T32 = [1, 0, 0, 0; ...
           0,        cos(Q3),     -sin(Q3),   0; ...
           0, sin(Q3),  cos(Q3),l2; ...
           0, 0, 0, 1];
    T30 = T10 *T21*T32;
    p2 = T30 * P0;
 M = [M, p2];

     T43 = [1, 0, 0, 0; ...
           0,        cos(Q4),     -sin(Q4),   0; ...
           0, sin(Q4),  cos(Q4),l3; ...
           0, 0, 0, 1];
      T40 = T10 *T21*T32*T43;
       p3 = T40 * P0;
  M = [M, p3];
     T54 = [cos(Q5), -sin(Q5), 0, 0; ...
           sin(Q5),  cos(Q5), 0, 0; ...
               0,        0,   1, l4; ...
               0,        0,   0, 1];
       T50 = T10 *T21*T32*T43*T54;
      p4 = T50 * P0;
  M = [M, p4];
   Te5 = [ 1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];
    Te5 = T10 * T21 * T32 * T43 * T54 * Te5;
   p5 = Te5 * P0;
  M = [M, p5];


  % Axele primei articulații
    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    % Axele celei de-a doua articulații (în sistem global)105213
    quiver3(p1(1), p1(2), p1(3), T20(1,1), T20(2,1), T20(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p1(1), p1(2), p1(3), T20(1,2), T20(2,2), T20(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p1(1), p1(2), p1(3), T20(1,3), T20(2,3), T20(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p2(1), p2(2), p2(3), T30(1,1), T30(2,1), T30(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p2(1), p2(2), p2(3), T30(1,2), T30(2,2), T30(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p2(1), p2(2), p2(3), T30(1,3), T30(2,3), T30(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p3(1), p3(2), p3(3), T40(1,1), T40(2,1), T40(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p3(1), p3(2), p3(3), T40(1,2), T40(2,2), T40(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p3(1), p3(2), p3(3), T40(1,3), T40(2,3), T40(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p4(1), p4(2), p4(3), T50(1,1), T50(2,1), T50(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p4(1), p4(2), p4(3), T50(1,2), T50(2,2), T50(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p4(1), p4(2), p4(3), T50(1,3), T50(2,3), T50(3,3), 30, 'b', 'LineWidth', 1); % Z

   quiver3(p5(1), p5(2), p5(3), Te5(1,1), Te5(2,1), Te5(3,1), 30, 'r', 'LineWidth', 1); % X
   quiver3(p5(1), p5(2), p5(3), Te5(1,2), Te5(2,2), Te5(3,2), 30, 'g', 'LineWidth', 1); % Y
   quiver3(p5(1), p5(2), p5(3), Te5(1,3), Te5(2,3), Te5(3,3), 30, 'b', 'LineWidth', 1); % Z

    % Linia între articulații
    line([0, p0(1)], [0, p0(2)], [0, p0(3)], 'Color', 'y', 'LineWidth', 3);
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'g', 'LineWidth', 3);
    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'g', 'LineWidth', 3);
    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'b', 'LineWidth', 3);
    grid on;
    hold on;
    xlim([-600, 600]);
    ylim([-600, 600]);
    
    pause(0.1);
    cla
end
for Q4=0:0.1:q4
    Q1=q1;
    Q2=q2;
    Q3=q3;
    Q5=0;
    M = [P0];
 % Transformarea T10
    T10 = [cos(Q1), -sin(Q1), 0, 0; ...
           sin(Q1),  cos(Q1), 0, 0; ...
               0,        0,   1, 0; ...
               0,        0,   0, 1];
    p0 = T10 * P0;    
    M = [M, p0];
    % Transformarea T21
    T21 = [1, 0, 0, 0; ...
           0, cos(Q2), -sin(Q2), 0; ...
           0, sin(Q2),  cos(Q2), l1; ...
           0, 0, 0, 1];
     T20 = T10 * T21;
     p1 = T20 * P0;
  M = [M, p1];
     % Transformarea T32
   T32 = [1, 0, 0, 0; ...
           0,        cos(Q3),     -sin(Q3),   0; ...
           0, sin(Q3),  cos(Q3),l2; ...
           0, 0, 0, 1];
    T30 = T10 *T21*T32;
    p2 = T30 * P0;
 M = [M, p2];

     T43 = [1, 0, 0, 0; ...
           0,        cos(Q4),     -sin(Q4),   0; ...
           0, sin(Q4),  cos(Q4),l3; ...
           0, 0, 0, 1];
      T40 = T10 *T21*T32*T43;
       p3 = T40 * P0;
  M = [M, p3];
     T54 = [cos(Q5), -sin(Q5), 0, 0; ...
           sin(Q5),  cos(Q5), 0, 0; ...
               0,        0,   1, l4; ...
               0,        0,   0, 1];
       T50 = T10 *T21*T32*T43*T54;
      p4 = T50 * P0;
  M = [M, p4];
   Te5 = [ 1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];
    Te5 = T10 * T21 * T32 * T43 * T54 * Te5;
   p5 = Te5 * P0;
  M = [M, p5];


   % Axele primei articulații
    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    % Axele celei de-a doua articulații (în sistem global)105213
    quiver3(p1(1), p1(2), p1(3), T20(1,1), T20(2,1), T20(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p1(1), p1(2), p1(3), T20(1,2), T20(2,2), T20(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p1(1), p1(2), p1(3), T20(1,3), T20(2,3), T20(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p2(1), p2(2), p2(3), T30(1,1), T30(2,1), T30(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p2(1), p2(2), p2(3), T30(1,2), T30(2,2), T30(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p2(1), p2(2), p2(3), T30(1,3), T30(2,3), T30(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p3(1), p3(2), p3(3), T40(1,1), T40(2,1), T40(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p3(1), p3(2), p3(3), T40(1,2), T40(2,2), T40(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p3(1), p3(2), p3(3), T40(1,3), T40(2,3), T40(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p4(1), p4(2), p4(3), T50(1,1), T50(2,1), T50(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p4(1), p4(2), p4(3), T50(1,2), T50(2,2), T50(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p4(1), p4(2), p4(3), T50(1,3), T50(2,3), T50(3,3), 30, 'b', 'LineWidth', 1); % Z

   quiver3(p5(1), p5(2), p5(3), Te5(1,1), Te5(2,1), Te5(3,1), 30, 'r', 'LineWidth', 1); % X
   quiver3(p5(1), p5(2), p5(3), Te5(1,2), Te5(2,2), Te5(3,2), 30, 'g', 'LineWidth', 1); % Y
   quiver3(p5(1), p5(2), p5(3), Te5(1,3), Te5(2,3), Te5(3,3), 30, 'b', 'LineWidth', 1); % Z

    % Linia între articulații
    line([0, p0(1)], [0, p0(2)], [0, p0(3)], 'Color', 'y', 'LineWidth', 3);
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'g', 'LineWidth', 3);
    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'g', 'LineWidth', 3);
    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'b', 'LineWidth', 3);
    grid on;
    hold on;
    xlim([-600, 600]);
    ylim([-600, 600]);
    
    pause(0.1);
    cla
end

for Q5=0:0.1:q5
    Q1=q1;
    Q2=q2;
    Q3=q3;
    Q4=q4;
    M = [P0];
 % Transformarea T10
    T10 = [cos(Q1), -sin(Q1), 0, 0; ...
           sin(Q1),  cos(Q1), 0, 0; ...
               0,        0,   1, 0; ...
               0,        0,   0, 1];
    p0 = T10 * P0;    
    M = [M, p0];
    % Transformarea T21
    T21 = [1, 0, 0, 0; ...
           0, cos(Q2), -sin(Q2), 0; ...
           0, sin(Q2),  cos(Q2), l1; ...
           0, 0, 0, 1];
     T20 = T10 * T21;
     p1 = T20 * P0;
  M = [M, p1];
     % Transformarea T32
   T32 = [1, 0, 0, 0; ...
           0,        cos(Q3),     -sin(Q3),   0; ...
           0, sin(Q3),  cos(Q3),l2; ...
           0, 0, 0, 1];
    T30 = T10 *T21*T32;
    p2 = T30 * P0;
 M = [M, p2];

     T43 = [1, 0, 0, 0; ...
           0,        cos(Q4),     -sin(Q4),   0; ...
           0, sin(Q4),  cos(Q4),l3; ...
           0, 0, 0, 1];
      T40 = T10 *T21*T32*T43;
       p3 = T40 * P0;
  M = [M, p3];
     T54 = [cos(Q5), -sin(Q5), 0, 0; ...
           sin(Q5),  cos(Q5), 0, 0; ...
               0,        0,   1, l4; ...
               0,        0,   0, 1];
       T50 = T10 *T21*T32*T43*T54;
      p4 = T50 * P0;
  M = [M, p4];
   Te5 = [ 1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];
    Te5 = T10 * T21 * T32 * T43 * T54 * Te5;
   p5 = Te5 * P0;
  M = [M, p5];


    % Axele primei articulații
    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    % Axele celei de-a doua articulații (în sistem global)105213
    quiver3(p1(1), p1(2), p1(3), T20(1,1), T20(2,1), T20(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p1(1), p1(2), p1(3), T20(1,2), T20(2,2), T20(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p1(1), p1(2), p1(3), T20(1,3), T20(2,3), T20(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p2(1), p2(2), p2(3), T30(1,1), T30(2,1), T30(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p2(1), p2(2), p2(3), T30(1,2), T30(2,2), T30(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p2(1), p2(2), p2(3), T30(1,3), T30(2,3), T30(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p3(1), p3(2), p3(3), T40(1,1), T40(2,1), T40(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p3(1), p3(2), p3(3), T40(1,2), T40(2,2), T40(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p3(1), p3(2), p3(3), T40(1,3), T40(2,3), T40(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p4(1), p4(2), p4(3), T50(1,1), T50(2,1), T50(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p4(1), p4(2), p4(3), T50(1,2), T50(2,2), T50(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p4(1), p4(2), p4(3), T50(1,3), T50(2,3), T50(3,3), 30, 'b', 'LineWidth', 1); % Z

   quiver3(p5(1), p5(2), p5(3), Te5(1,1), Te5(2,1), Te5(3,1), 30, 'r', 'LineWidth', 1); % X
   quiver3(p5(1), p5(2), p5(3), Te5(1,2), Te5(2,2), Te5(3,2), 30, 'g', 'LineWidth', 1); % Y
   quiver3(p5(1), p5(2), p5(3), Te5(1,3), Te5(2,3), Te5(3,3), 30, 'b', 'LineWidth', 1); % Z

    % Linia între articulații
    line([0, p0(1)], [0, p0(2)], [0, p0(3)], 'Color', 'y', 'LineWidth', 3);
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'g', 'LineWidth', 3);
    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'g', 'LineWidth', 3);
    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'b', 'LineWidth', 3);
    grid on;
    hold on;
    xlim([-600, 600]);
    ylim([-600, 600]);
    
    pause(0.1);
    cla
end

  hold on
   % Axele primei articulații
    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    % Axele celei de-a doua articulații (în sistem global)105213
    quiver3(p1(1), p1(2), p1(3), T20(1,1), T20(2,1), T20(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p1(1), p1(2), p1(3), T20(1,2), T20(2,2), T20(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p1(1), p1(2), p1(3), T20(1,3), T20(2,3), T20(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p2(1), p2(2), p2(3), T30(1,1), T30(2,1), T30(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p2(1), p2(2), p2(3), T30(1,2), T30(2,2), T30(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p2(1), p2(2), p2(3), T30(1,3), T30(2,3), T30(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p3(1), p3(2), p3(3), T40(1,1), T40(2,1), T40(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p3(1), p3(2), p3(3), T40(1,2), T40(2,2), T40(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p3(1), p3(2), p3(3), T40(1,3), T40(2,3), T40(3,3), 30, 'b', 'LineWidth', 1); % Z
   
    quiver3(p4(1), p4(2), p4(3), T50(1,1), T50(2,1), T50(3,1), 30, 'r', 'LineWidth', 1); % X
    quiver3(p4(1), p4(2), p4(3), T50(1,2), T50(2,2), T50(3,2), 30, 'g', 'LineWidth', 1); % Y
    quiver3(p4(1), p4(2), p4(3), T50(1,3), T50(2,3), T50(3,3), 30, 'b', 'LineWidth', 1); % Z

   quiver3(p5(1), p5(2), p5(3), Te5(1,1), Te5(2,1), Te5(3,1), 30, 'r', 'LineWidth', 1); % X
   quiver3(p5(1), p5(2), p5(3), Te5(1,2), Te5(2,2), Te5(3,2), 30, 'g', 'LineWidth', 1); % Y
   quiver3(p5(1), p5(2), p5(3), Te5(1,3), Te5(2,3), Te5(3,3), 30, 'b', 'LineWidth', 1); % Z

    % Linia între articulații
    line([0, p0(1)], [0, p0(2)], [0, p0(3)], 'Color', 'y', 'LineWidth', 3);
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'g', 'LineWidth', 3);
    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'g', 'LineWidth', 3);
    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'b', 'LineWidth', 3);
    grid on;
    hold on;
    xlim([-600, 600]);
    ylim([-600, 600]);
end