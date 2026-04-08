function [viteza_liniara, omega] = Cinematica_Directa(Q, viteza)

% Dimensiuni robot (în mm sau ce unitate ai)
l1 = 20;
l2 = 105;
l3 = 145;
l4 = 70;
l5 = 110;

% Inițializare output
viteza_liniara = [];
omega = [];

% Verificare dimensiuni
if size(Q,1) ~= 5 || size(viteza,1) ~= 5
    error('Q și viteza trebuie să fie de dimensiune 5xN (pentru 5 DOF).');
end

% Iterăm prin fiecare coloană (set de unghiuri/viteze)
for i = 1:size(Q, 2)
    % Extragem unghiurile curente
    q1 = Q(1,i);
    q2 = Q(2,i);
    q3 = Q(3,i);
    q4 = Q(4,i);
    q5 = Q(5,i);

    % Jacobiana la pasul curent
    J = [
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

    % Separăm în Jv (viteza liniară) și Jw (viteza unghiulară)
    Jv = J(1:3, :);
    Jw = J(4:6, :);

    % Calculăm vitezele
    viteza_liniara = [viteza_liniara, Jv * viteza(:, i)];
    omega = [omega, Jw * viteza(:, i)];
end

end
