clear all
clf
clickerdefaults

rgb = imread('sfuquadgoogle.png');
[m,n,p] = size(rgb);
imshow(rgb);
%set(gca, 'YDir', 'normal')

xpath = [189, 285, 357, 415, 499, 571, 671, 821, 931, 1121 ];
ypath = [594, 620, 680, 728, 704, 670, 686, 728, 772, 816 ];
xpath = [189, 331, 381, 499, 571, 671, 821, 931, 1121 ];
ypath = [594, 623, 719, 704, 670, 686, 728, 772, 816 ];
xpath = [189, 339, 434, 521, 547, 671, 890, 931+30, 1121 ];
ypath = [594, 662, 716, 694+5, 678, 686, 750, 772, 816 ];
%xpath = xpath([1:3,5:end]);
%ypath = ypath([1:3,5:end]);

iskip = 200;
hold on
xticks = [0 :  iskip : n];
yticks = [m : -iskip : 0]; 
for k = yticks, 
  plot([1,n], [k,k], 'Color', 'w', 'LineStyle','-');
  plot([1,n], [k,k], 'Color', 'k', 'LineStyle',':');
end
for k = xticks,
  plot([k,k], [1,m], 'Color', 'w', 'LineStyle','-');
  plot([k,k], [1,m], 'Color', 'k', 'LineStyle',':');
end
plot( xpath, ypath, 'wo', 'MarkerFaceColor', 'r', 'MarkerSize', 16 );
hold off
axis on
set(gca, 'XTick', xticks+1, 'YTick', sort(yticks-1))
set(gca, 'XTickLabel', num2str(xticks') );
set(gca, 'YTickLabel', flip(num2str(m-yticks')) );
xlabel('x'), ylabel('y')

set(gca, 'YLim', m-[1220,400], 'XLim', [100,1200]);
print -depsc 'sfuquad1.eps'
savefig('sfuquad1.fig') % too big
print -djpeg -r150 'sfuquad1.jpg'

set(gca, 'YLim', [0,m]);

% Polynomial interpolant (degree npath-1)
npath = length(xpath);
xx = [100:1220];
xx2= [180:1127];
pp = polyfit( xpath, ypath, npath-1 );
ypoly = polyval( pp, xx2 );
hold on
h1 = plot( xx2, ypoly, 'm-' );

% Piecewise spline interpolant (npath-1 intervals)
pp = spline( xpath, ypath );
yspline = ppval( pp, xx );
h2 = plot( xx, yspline, 'c--' );

% Least squares fit (degree 3)
deg = 3;
Alsq = xpath .^ ([0:deg]');
clsq = (Alsq*Alsq') \ (Alsq*ypath');
ylsq = polyval( flip(clsq)', xx );
h3 = plot( xx, ylsq, 'g:' );

% Plot data points again
h0 = plot( xpath, ypath, 'wo', 'MarkerFaceColor', 'r', 'MarkerSize', 16 );
text(1020, m-160, 'Math!', 'Color', 'm', 'Rotation', -15)
hold off
shg

legend( [h0,h1,h2,h3], 'Data', 'Interpolant', 'Spline', 'LSQ fit', ...
        'Location', 'North' )

print -depsc 'sfuquad2.eps'
savefig('sfuquad2.fig') % too big
print -djpeg -r150 'sfuquad2.jpg'

