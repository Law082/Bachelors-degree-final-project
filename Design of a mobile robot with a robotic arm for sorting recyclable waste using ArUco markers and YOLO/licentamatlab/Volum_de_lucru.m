n = 20;  % rezoluție
pozitii = [];

q1_vals = linspace(deg2rad(-90), deg2rad(90), n);  % semicerc complet la bază
q_vals  = linspace(deg2rad(-90), 0, n);            % q2–q4: doar în față
q5_vals = 0;  % prehensor nefolosit

for q1 = q1_vals
  for q2 = q_vals
    for q3 = q_vals
      for q4 = q_vals
        p5 = geometrie_directa_volum(q1, q2, q3, q4, q5_vals);
        p = p5(1:3);
        % Filtrare puncte din spate (opțional, extra siguranță)
        if p(2) >= -1e-4  % permite doar partea din față a robotului (Y ≥ 0)
            pozitii = [pozitii, p];
        end
      end
    end
  end
end

% Afișare
scatter3(pozitii(1,:), pozitii(2,:), pozitii(3,:), 5, 'filled');
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Volumul de lucru');
grid on
