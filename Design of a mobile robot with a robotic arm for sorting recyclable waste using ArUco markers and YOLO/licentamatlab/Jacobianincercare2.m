function [Jz] = Jacobianincercare2(q1,q2,q3,q4,q5,T10,T21,T32,T43,T54,Te5)

    T01 = T10;
    T02 = T01 * T21;
    T03 = T02 * T32;
    T04 = T03 * T43;
    T05 = T04 * T54;
    T0e = T05 * Te5;

    % Poziția efectorului final
    pe = T0e(1:3,4);

    z0 = [0;0;1]; % axa z global
    x1 = T01(1:3,1); % axa x dupa T10
    x2 = T02(1:3,1);
    x3 = T03(1:3,1);
    z4 = T04(1:3,3); % axa z la T43 (deoarece q5 este Rz)

    % Jacobian liniar (viteză liniară)
    Jv1 = diff(pe,q1);
    Jv2 = diff(pe,q2);
    Jv3 = diff(pe,q3);
    Jv4 = diff(pe,q4);
    Jv5 = diff(pe,q5);

    % Jacobian unghiular (viteză unghiulară)
    Jw1 = z0;
    Jw2 = x1;
    Jw3 = x2;
    Jw4 = x3;
    Jw5 = z4;

    % Jacobian 6x5
    Jz = [Jv1, Jv2, Jv3, Jv4, Jv5;
         Jw1, Jw2, Jw3, Jw4, Jw5];

end
