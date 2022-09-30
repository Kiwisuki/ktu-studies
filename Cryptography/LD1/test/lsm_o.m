function lsm_o(plain_coeff, basis_vec1, basis_vec2, v, p)
  clf;
  hold on;
  bool = 0;
  if norm(plain_coeff) ~= 0
    bool = draw_plain(plain_coeff);
    if norm(basis_vec1) ~= 0 && norm(basis_vec2) ~= 0 && bool == 1
      bool = draw_basis(basis_vec1, basis_vec2, plain_coeff);
      if norm(v) ~= 0 && bool == 1
        bool = draw_vector(v, plain_coeff);
        if norm(p) ~= 0 && bool == 1
          % Calculating the correct answer
          P = [basis_vec1' basis_vec2'];
          proj = P * inv(P' * P) * P' * v'; % Calculating orhogonal projection
          bool = draw_solution(p, proj, basis_vec1, basis_vec2, v);
          if bool == 1
            disp('Program successfuly completed.')
          endif
        endif;
      endif;
    endif;
  else
    draw_plain(plain_coeff);
  endif;
endfunction;



function bool = draw_plain(plain_coeff)      % Drawing the plain
  if plain_coeff(4) == 0
    if norm(plain_coeff) ~= 0
      X = linspace(-5,5,100);           % Change the first two integers of linspace command to enlarge the plain graph
      Y = linspace(-5,5,100);           % Change the first two integers of linspace command to enlarge the plain graph
      Z = linspace(-5,5,100);
        if plain_coeff(1) == 0
            if plain_coeff(2) == 0
              [XX, YY] = meshgrid(X, Y);
              ZZ = 0 * XX + 0 * YY;
            elseif plain_coeff(3) == 0
              [XX, ZZ] = meshgrid(X, Z);
              YY = 0 * XX + 0 * ZZ;
            endif
            if plain_coeff(2) ~= 0 && plain_coeff(3) ~= 0
              [XX, YY] = meshgrid(X, Y);
              ZZ = (-plain_coeff(2) * YY) / plain_coeff(3);
            endif;           
        elseif plain_coeff(2) == 0
          if plain_coeff(3) == 0
            [YY, ZZ] = meshgrid(Y, Z);
            XX = 0 * YY + 0 * ZZ;           
          else
            [XX, YY] = meshgrid(X, Y);
            ZZ = (-plain_coeff(1) * XX) / plain_coeff(3);
          endif;
        elseif plain_coeff(3) == 0
          [XX, ZZ] = meshgrid(X, Z);
          YY = (-plain_coeff(1) * XX) / plain_coeff(2);
        endif
        if plain_coeff(1) ~= 0 && plain_coeff(2) ~= 0 && plain_coeff(3) ~= 0
          [XX, YY] = meshgrid(X, Y);
          ZZ = (-plain_coeff(1) * XX - plain_coeff(2) * YY) / plain_coeff(3);  % Calculate the value of coordinate z from plain equation ax + by + cz + d = 0        
        endif;        
      mesh(XX, YY, ZZ);
      bool = 1;
    else
      mesh(0, 0, 0);
      bool = 0;
    endif
    shading flat;
    colormap([1 1 0]);
    xlabel('x'); ylabel('y'); zlabel('z') % Axis labels
    text(0, 0, 0, '0');
    view(3);   
  else
    disp('Point [0 0 0] is not on a plain. Problem aborted')
    bool = 0;
    return;
  endif
endfunction;

function bool = draw_basis(basis_vec1, basis_vec2, plain_coeff)
  if dot(plain_coeff(1:3), basis_vec1) + plain_coeff(4) == 0
    if dot(plain_coeff(1:3), basis_vec2) + plain_coeff(4) == 0
      if cross(basis_vec1, basis_vec2) == 0
        disp('Selected vectors b1 and b2 do not form a basis. Problem aborted ');
        bool = 0;
        return;
      else
        b1 = quiver3(0, 0, 0, basis_vec1(1), basis_vec1(2), basis_vec1(3),'AutoScale','off' ,'Color','magenta', 'LineWidth', 2); % Drawing a vector
        b2 = quiver3(0, 0, 0, basis_vec2(1), basis_vec2(2), basis_vec2(3),'AutoScale','off' ,'Color','magenta', 'LineWidth', 2); % Drawing a vector
        k1 = scaling_factor(basis_vec1);
        k2 = scaling_factor(basis_vec2);
        set(b1, 'MaxHeadSize', k1);
        set(b2, 'MaxHeadSize', k2);
        text(0.1+basis_vec1(1)/2, 0.1+basis_vec1(2)/2, 0.1+basis_vec1(3)/2, 'b_1')
        text(0.1+basis_vec2(1)/2, 0.1+basis_vec2(2)/2, 0.1+basis_vec2(3)/2, 'b_2')
        bool = 1;
      endif
    else
        disp('Selected vector b2 is not on the plain. Problem aborted')
        bool = 0;
        return;
    endif  
  else
    disp('Selected vector b1 is not on the plain. Problem aborted')
    bool = 0;
    return;
  endif
endfunction

function bool = draw_vector(v, plain_coeff)
  if dot(plain_coeff(1:3), v) + plain_coeff(4) == 0
    bool = 0;
    disp('Selected vector v is on the plain. Problem aborted')
    return;
  else
    rnd_vec = quiver3(0, 0, 0, v(1), v(2), v(3),'AutoScale','off','Color','blue', 'LineWidth', 2); % Drawing a vector
    text(0.1+v(1)/2, 0.1+v(2)/2, 0.1+v(3)/2, 'v')
    set(rnd_vec, 'MaxHeadSize', scaling_factor(rnd_vec))
    bool = 1;
  endif
endfunction



function bool = draw_solution(p, proj, basis_vec1, basis_vec2, v)
  if length(p) == 2
    pr_v = p(1) * basis_vec1 + p(2) * basis_vec2;
    if norm(pr_v' - proj) < 0.001
      pr = quiver3(0, 0, 0, pr_v(1), pr_v(2), pr_v(3),'AutoScale','off','Color','green', 'LineWidth', 2 ); % Drawing a vector
      text(0.1+pr_v(1)/2, 0.1+pr_v(2)/2, 0.1+pr_v(3)/2, 'p')
      set(pr, 'MaxHeadSize', scaling_factor(pr_v))
      err = quiver3(pr_v(1), pr_v(2), pr_v(3), v(1) - pr_v(1), v(2) - pr_v(2), v(3) - pr_v(3), 'LineStyle', '--', 'LineWidth', 2, 'Color', 'k');
      text(0.1+(v(1) + pr_v(1))/2, 0.1+(v(2) + pr_v(2))/2, 0.1+(v(3) + pr_v(3))/2, 'err')
      set(err, 'MaxHeadSize', scaling_factor(v - pr_v))
      disp('Your answer is correct. Problem solved.')
      bool = 1;
    else
      pr = quiver3(0, 0, 0, pr_v(1), pr_v(2), pr_v(3),'AutoScale','off','Color','red', 'LineWidth', 2 ); % Drawing a vector
      text(0.1+pr_v(1)/1.5, 0.1+pr_v(2)/1.5, 0.1+pr_v(3)/1.5, 'pr_{(b_1, b_2)}v')
      set(pr, 'MaxHeadSize', scaling_factor(pr_v))
      pr_c = quiver3(0, 0, 0, proj(1), proj(2), proj(3),'AutoScale','off','Color','green', 'LineWidth', 2 ); % Drawing a vector
      text(0.1+proj(1)/1.5, 0.1+proj(2)/1.5, 0.1+proj(3)/1.5, 'pr_{(b_1, b_2)}v')
      set(pr_c, 'MaxHeadSize', scaling_factor(proj))
      err = quiver3(v(1), v(2), v(3), proj(1) - v(1), proj(2) - v(2), proj(3) - v(3), 'LineStyle', '--', 'LineWidth', 2, 'Color', 'k');
      text(0.1+(v(1) + proj(1))/2, 0.1+(v(2) + proj(2))/2, 0.1+(v(3) + proj(3))/2, 'err')
      set(err, 'MaxHeadSize', scaling_factor(v - pr_v))
      disp('The correct projection is drawn in green on the plain.')
      disp('Problem not solved.')
      bool = 1;
    endif
  else
    disp('Two coordinates required for projection. Program aborted')
    bool = 0;
    return;
  endif
endfunction

function k = scaling_factor(v)
  n = norm(v)^2
    if n <= 10
      k = 0.5;
    endif
    if 10 < n <= 20
      k = 0.4;
    endif
    if 20 < n <= 30
      k = 0.2;
    endif
    if 30 < n <= 40
      k = 0.1;
    endif
    if n > 40
      k = 0.05;
    endif
endfunction;