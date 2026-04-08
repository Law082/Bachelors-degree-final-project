function [punct]= incercarelicentageometriedirecta(q1,q2,q3,q4,q5)

l1 = 20;
l2 = 105;
l3 = 145;
l4 = 70;
l5 = 110;
P0 = [0; 0; 0; 1];

    % Transformarea T10
    T10 = [cos(q1), -sin(q1), 0, 0; 
           sin(q1),  cos(q1), 0, 0; 
               0,        0,   1, 0; 
               0,        0,   0, 1];

    % Transformarea T21
    T21 = [1, 0, 0, 0; 
           0, cos(q2), -sin(q2), 0; 
           0, sin(q2),  cos(q2), l1;
           0, 0, 0, 1];

     % Transformarea T32
   T32 =  [1, 0, 0, 0; 
           0,        cos(q3),     -sin(q3),   0;
           0, sin(q3),  cos(q3),l2;
           0, 0, 0, 1];


     T43 =[1, 0, 0, 0; 
           0,        cos(q4),     -sin(q4),   0; 
           0, sin(q4),  cos(q4),l3;
           0, 0, 0, 1];

     T54 = [cos(q5), -sin(q5), 0, 0; 
           sin(q5),  cos(q5), 0, 0; 
               0,        0,   1, l4; 
               0,        0,   0, 1];

   Te5 = [ 1, 0, 0, 0;...
           0, 1, 0, 0;...
           0, 0, 1, l5;...
           0, 0, 0, 1;];  
    
    T20 = T10 * T21;
    T30 = T10 *T21*T32;
    T40 = T10 *T21*T32*T43;
    T50 = T10 *T21*T32*T43*T54;
    Te0 = T10 * T21 * T32 * T43 * T54 * Te5;

   
    p0 = T10 * P0;    
    p1 = T20 * P0;
    p2 = T30 * P0;
    p3 = T40 * P0;
    p4 = T50 * P0;
    punct = Te0 * P0;
  disp("T10=")
  disp(T10)
  disp('T21=')
  disp(T21)
  disp('T32=')
  disp(T32)
  disp('T43=')
  disp(T43)
  disp('T54=')
  disp(T54)
  disp('Te5')
  disp(Te5)
  disp('Te0=')
  disp(Te0)
end
