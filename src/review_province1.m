review_province_distribution = zeros(1, 34);
for i = 1:34
    for j = 1:5000
        if province(j) == i
            review_province_distribution(i) = review_province_distribution(i) + review(j);
        end
    end
end
% draw
% initilize
for x=1:32
    states(x).class = 34;
end
[Y, I] = sort(review_province_distribution, 'descend');
X= [];
for x = I
    X = [X provincename(x)];
end
for x = 1:34
    for y = 1:32
        if strcmp(states(y).NAME_1, X(x)) && Y(x)~=0
            states(y).class = x;
            break
        end
    end
end
% bar
figure;
bar(Y);
ax = gca;
set(ax, 'XTick', 1:34);
set(ax, 'XTickLabel', X);
set(ax, 'Fontsize', 16);
ax.XTickLabelRotation = 45;
title('Review# of each province', 'Fontsize', 16);
% map
figure;
symbols = makesymbolspec('Polygon', {'class', [1 34], 'Facecolor', hot(32)});
geoshow(states, 'SymbolSpec', symbols);
title('Review# Distribution', 'FontSize', 16);
xlabel('Longitude', 'FontSize', 16);
ylabel('Latitude', 'FontSize', 16);
set(gca, 'FontSize', 16);
saveas(gcf, 'review_province', 'jpg');