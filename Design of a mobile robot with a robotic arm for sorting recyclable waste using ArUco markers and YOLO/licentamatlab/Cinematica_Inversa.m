function [viteza_generalizata] = Cinematica_Inversa(Q, viteza)
% Cinematica inversa a vitezei pentru robot cu 5 DOF
% Intrare:
%   Q     - [5 x N] pozitii articulatii
%   viteza - [6 x N] viteze spatiale (3 liniare + 3 unghiulare)
% Iesire:
%   viteza_generalizata - [5 x N] viteze articulatii

% Dimensiuni robot
l1 = 20;
l2 = 105;
l3 = 145;
l4 = 70;
l5 = 110;

% Initializare rezultat
viteza_generalizata = [];

for i = 1:size(viteza, 2)
    % Extrage valorile articulatiilor
    q1 = Q(1, i);
    q2 = Q(2, i);
    q3 = Q(3, i);
    q4 = Q(4, i);
    q5 = Q(5, i);

    % Calcule unghiuri compuse pentru claritate
    q23 = q2 + q3;
    q234 = q2 + q3 + q4;

    % Jacobiana 6x5
    J = [
        cos(q1)*(l2*sin(q2) + l3*sin(q23) + l4*sin(q234) + l5*sin(q234)), ...
        sin(q1)*(l2*cos(q2) + l3*cos(q23) + l4*cos(q234) + l5*cos(q234)), ...
        sin(q1)*(l3*cos(q23) + l4*cos(q234) + l5*cos(q234)), ...
        cos(q234)*sin(q1)*(l4 + l5), ...
        0;

        sin(q1)*(l2*sin(q2) + l3*sin(q23) + l4*sin(q234) + l5*sin(q234)), ...
       -cos(q1)*(l2*cos(q2) + l3*cos(q23) + l4*cos(q234) + l5*cos(q234)), ...
       -cos(q1)*(l3*cos(q23) + l4*cos(q234) + l5*cos(q234)), ...
       -cos(q234)*cos(q1)*(l4 + l5), ...
        0;

        0, ...
       -l2*sin(q2) - l3*sin(q23) - l4*sin(q234) - l5*sin(q234), ...
       -l3*sin(q23) - l4*sin(q234) - l5*sin(q234), ...
       -sin(q234)*(l4 + l5), ...
        0;

        0, cos(q1), cos(q1), cos(q1), sin(q234)*sin(q1);

        0, sin(q1), sin(q1), sin(q1), -sin(q234)*cos(q1);

        1, 0, 0, 0, cos(q234)
    ];

    % Pseudo-inversa 5x6
    JP = pinv(J);

    % Calcule viteze articulatii
    viteza_generalizata = [viteza_generalizata, JP * viteza(:, i)];
end

end
