function prg = lsm(a, b, c, d)

% Least Square Method
x=-10:1:10;
                                                 % Mastelis ir koordinaciu ribos
[X,Y] = meshgrid(x);                                        % X ir Y reiksmes sudaromos
Z=(-d- a * X - b * Y)/c;                                    % Randama Z reiksme, pagal lygty aX+bY+cZ+d=0
hSurface=surf(X,Y,Z);                                       % Plokštumos atvaizdavimas
shading flat                                                % Panaikinamas taškų sujungimas
xlabel('x'); ylabel('y'); zlabel('z')                       % Ašių pavadinimai
set(hSurface,'FaceColor',[0 0 0],'FaceAlpha',0.5);          % Nurodoma plokštumos spalva ir permatomumas
hold on                                                     % Įgalinama ant to paties paveikslo toliau piešti

% Vektoriai plokštumoje
k1=[-2 -2];
k2=[-5 4];

x1=-b*k1-c*k2;
y1=k1*a;
z1=k2*a;

v1 = [x1(1) y1(1) z1(1)];
v2 = [x1(2) y1(2) z1(2)];

% Vektorius erdvėje
v3=[-2 4 8];

% Vektoriaus erdvėje projekcija į plokštumą
A=[v1' v2']
proj=A*inv(A'*A)*A'*v3'

% Normalės vektorius 
% norm=[a b c];


vekt=[v1; v2; v3; proj'];                                   % Pridejus papildoma vektoriu, nepamirsti įtraukti ji cia

% Vektoriu atvaizdavimas
[eil, st]=size(vekt);                                       % Vektoriaus masyvo eiluciu ir stulpeliu skaiciaus nustatymas
starts = zeros(eil,st);                                     % Kiekvienam vektoriui suteikiama pradzios tasko koordinate [0 0 0]
quiver3(starts(:,1), starts(:,2), starts(:,3), vekt(:,1), vekt(:,2), vekt(:,3),'AutoScale','off','Color','green' ) % Vektorių atvaizdavimas

quiver3(proj(1),proj(2),proj(3),v3(1)-proj(1),v3(2)-proj(2),v3(3)-proj(3),'LineStyle','--','Color','k');
axis([-10 10 -10 10 -10 10])

texts = {'v1', 'v2', 'v3', 'proj'};
text(vekt(:,1), vekt(:,2), vekt(:,3), texts);
text(0, 0, 0, '0');