%% Plotting Sierpinski's Triangle

close;
clear all;

x = 0;
y = 0;

h = animatedline(x,y,'LineStyle','none','Marker','.');
title('Sierpinski''s Triangle')
set(gca, 'xtick', [])
set(gca, 'ytick', [])
axis([0,1,0, 1])
for k = 1:100000
    c = randi([0 2]);
    switch c
        case 0
            x = 0.5*x;
            y = 0.5*y;
        case 1
            x = 0.5*x + 0.25;
            y = 0.5*y + sqrt(3)/4;
        case 2
            x = 0.5*x + 0.5;
            y = 0.5*y;
    end
    addpoints(h, x, y)
    drawnow
end
