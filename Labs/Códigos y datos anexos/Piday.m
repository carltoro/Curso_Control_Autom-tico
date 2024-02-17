% Créditos: https://blogs.mathworks.com/cleve/2018/03/14/happy-pi-day/

n = 100;

% Get pi from Symbolic Toolbox.
p = vpa(pi,n^2);

% Convert digits to characters, then to individual integers.
p = char(p);
p(2) = [];  % Decimal point
p = p - '0';
p(end+1:n^2) = 0;

% Square array
P = reshape(p,n,n)';

% Extra row and column to satisfy pcolor.
P(n+1,n+1) = NaN;

% Plot with pcolor.
pcolor(P)
axis square
axis off

% Title
title('\pi','fontsize',24)

% Make room for colorbar
pos = get(gca,'pos') - [.05 0 .0 0];
set(gca,'ydir','rev','pos',pos)

% Custom colorbar.
a = axes('pos',[.80 .60 .02 .30]);
y = (0:9)';
y(11,2) = NaN;
pcolor(y)
set(a,'xtick',[],'ydir','rev','ytick',(1.5:1:10.5)', ...
       'yaxislocation','right', ...
       'yticklabel',{' 0',' 1',' 2',' 3',' 4',' 5',' 6',' 7',' 8',' 9'})