function desenMGDlicenta(q1,q2,q3,q4,q5)
    figure
    l1 = 0.1;
    l2 = 0.2;
    l3 = 0.3;
    l4 = 0.4;
    l5 = 0.5;
    P0 = [0; 0; 0; 1];

  % Transformarea T10
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
           sin(q5), cos(q5), 1, 0; ...
           0,         0,       0, l4; ...
           0,        0,        0, 1];
    p4 = T10 * T21 * T32 * T43 * T54 * P0;

    % Transformarea Te5
    Te5 = [1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];
    p5 = T10 * T21 * T32 * T43 * T54 * Te5 * P0;
    
    
    quiver3(p0(1), p0(2), p0(3), T10(1, 1), T10(2, 1), T10(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru prima cuplă
    quiver3(p0(1), p0(2), p0(3), T10(1, 2), T10(2, 2), T10(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru prima cuplă
    quiver3(p0(1), p0(2), p0(3), T10(1, 3), T10(2, 3), T10(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru prima cuplă
   
    quiver3(p1(1), p1(2), p1(3), T21(1, 1), T21(2, 1), T21(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(p1(1), p1(2), p1(3), T21(1, 2), T21(2, 2), T21(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(p1(1), p1(2), p1(3), T21(1, 3), T21(2, 3), T21(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă

    quiver3(p2(1), p2(2), p2(3), T32(1, 1), T32(2, 1), T32(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru a treia cuplă
    quiver3(p2(1), p2(2), p2(3), T32(1, 2), T32(2, 2), T32(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru a treia cuplă
    quiver3(p2(1), p2(2), p2(3), T32(1, 3), T32(2, 3), T32(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru a treia cuplă
  
    quiver3(p3(1), p3(2), p3(3), T43(1, 1), T43(2, 1), T43(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(p3(1), p3(2), p3(3), T43(1, 2), T43(2, 2), T43(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(p3(1), p3(2), p3(3), T43(1, 3), T43(2, 3), T43(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru efector
 
    quiver3(p4(1), p4(2), p4(3), T54(1, 1), T54(2, 1), T54(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(p4(1), p4(2), p4(3), T54(1, 2), T54(2, 2), T54(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(p4(1), p4(2), p4(3), T54(1, 3), T54(2, 3), T54(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru efector
   
    quiver3(p5(1), p5(2), p5(3), Te5(1, 1), Te5(2, 1), Te5(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(p5(1), p5(2), p5(3), Te5(1, 2), Te5(2, 2), Te5(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(p5(1), p5(2), p5(3), Te5(1, 3), Te5(2, 3), Te5(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru efector
 
    line([0, p0(1)], [0, p0(2)], [0, p0(3)], 'Color', 'r', 'LineWidth', 3);
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'r', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'r', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'Color', 'r', 'LineWidth', 3);
    line([p3(1), p4(1)], [p3(2), p4(2)], [p3(3), p4(3)], 'Color', 'r', 'LineWidth', 3);
    line([p4(1), p5(1)], [p4(2), p5(2)], [p4(3), p5(3)], 'Color', 'r', 'LineWidth', 3);
    

    grid on;
        
    xlim([-1, 1]);
    ylim([-1, 1]);
    zlim([-1, 1]);
end