verify_distribution = hist(verified, 2);
explode = [0 1];
pie(verify_distribution, explode);
legend('Unverified', 'Verified', 'Location', 'NorthEastOutside');
% ratio having reviews
this_category = [];
for i=1:1:5000
    if review(i) > 0
        this_category = [this_category verified(i)];
    end
end
verify_distribution = hist(this_category, 2);
pie(verify_distribution, explode);
l = legend('Unverified', 'Verified', 'Location', 'NorthEastOutside');
set(l, 'Fontsize', 16);
% ratio without any review
this_category = [];
for i=1:1:5000
    if review(i) == 0
        this_category = [this_category verified(i)];
    end
end
verify_distribution = hist(this_category, 0:1);
pie(verify_distribution, explode);
l = legend('Unverified', 'Verified', 'Location', 'NorthEastOutside');
set(l, 'Fontsize', 16);
title('Ratio of verified in stores without review', 'Fontsize', 16);
%per category
verified_distribution_category = zeros(14,2);
for j = 1:1:14
    this_category = [];
    for i=1:1:5000
    	if category(i) == j
            this_category = [this_category verified(i)];
        end
    end
    verified_distribution_category(j,:) = hist(this_category, 0:1);
    figure;
    pie(verified_distribution_category(j,:), explode);
    l = legend('Unverified', 'Verified', 'Location', 'NorthEastOutside');
    set(l, 'Fontsize', 16);
    title(strjoin(categoryname(j)), 'Fontsize', 16);
    saveas(gcf, strcat( strjoin(categoryname(j)), '_ratio'), 'jpg');
    close;
end
% per province
ratio_province = zeros(34, 2);
% initilize
for x=1:32
    states(x).class = 0;
end
for j = 1:34
    this_category = [];
    % pick out data of this category
    for i=1:5000
    	if province(i) == j
            this_category = [this_category verified(i)];
        end
    end
    ratio_province(j,:) = hist(this_category, 0:1);
    for y = 1:32
        if strcmp(states(y).NAME_1, provincename(j))
            states(y).class = ratio_province(j,2)/(ratio_province(j,1)+ratio_province(j,2));
            break
        end
    end
end
% draw
X = zeros(1,32);
for x = 1:32
    X(x) = states(x).class;
end
[Y, I] = sort(X, 'descend');
% initilize
for x=1:32
    states(x).rank = 34;
end
x = 1;
for i = I
    if Y(x) ~= 0
        states(i).rank = x;
    end
    x = x + 1;
end
figure;
symbols = makesymbolspec('Polygon', {'rank', [1 34], 'Facecolor', pink(32)});
geoshow(states, 'SymbolSpec', symbols);
xlabel('Longitude', 'FontSize', 16);
ylabel('Latitude', 'FontSize', 16);
set(gca, 'FontSize', 16);