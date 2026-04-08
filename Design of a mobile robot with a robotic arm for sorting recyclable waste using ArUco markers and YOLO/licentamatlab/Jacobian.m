function [J] = Jacobian(q1,q2,q3,q4,q5,T10,T21,T32,T43,T54,Te5)

    T01 = T10;
    T02 = T01 * T21;
    T03 = T02 * T32;
    T04 = T03 * T43;
    T05 = T04 * T54;
    T0e = T05 * Te5;

    % Poziția efectorului final
    pe = T0e(1:3,4);

    z0 = T01(1:3,3);          % q1: Z
    z1 = T02(1:3,1);          % q2: X
    z2 = T03(1:3,1);          % q3: X
    z3 = T04(1:3,1);          % q4: X
    z4 = T05(1:3,3);          % q5: Z

    % Jacobian liniar (viteză liniară)
    Jv1 = diff(pe,q1);
    Jv2 = diff(pe,q2);
    Jv3 = diff(pe,q3);
    Jv4 = diff(pe,q4);
    Jv5 = diff(pe,q5);

    % Jacobian unghiular (viteză unghiulară)
    Jw1 = z0;
    Jw2 = z1;
    Jw3 = z2;
    Jw4 = z3;
    Jw5 = z4;

    % Jacobian 6x5
    J = [Jv1, Jv2, Jv3, Jv4, Jv5;
         Jw1, Jw2, Jw3, Jw4, Jw5];
    disp('T01=')
    disp(T01)
    disp('Tw1=')
    disp(Jw1)
    disp('T02=')
    disp(T02)
    disp('Tw2=')
    disp(Jw2)
    disp('T03=')
    disp(T03)
    disp('Tw3=')
    disp(Jw3)
    disp('T04=')
    disp(T04)
    disp('Tw4=')
    disp(Jw4)
    disp('T05=')
    disp(T05)
    disp('Tw5=')
    disp(Jw5)
    disp('T0e=')
    disp(T0e)
    disp('pe=')
    disp(pe)

end
