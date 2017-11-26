year_distribution = hist(year1, 2004:2015);
plot(2004:1:2015, year_distribution, '-ro');
set(gca, 'XTick', 2004:1:2015);
ax = gca;
set(gca, 'Fontsize', 16);
ax.XTickLabelRotation = 45;
xlabel('Year', 'Fontsize', 16);
ylabel('Number of stores', 'Fontsize', 16);
% per category
year_distribution_category = zeros(14, 12);
figure;
axis([2004 2015 0 1000]);
set(gca, 'XTick', 2004:1:2015);
hold on;
for j = 1:1:14
    this_category = [];
    for i=1:1:5000
    	if category(i) == j
            this_category = [this_category year1(i)];
        end
    end
    year_distribution_category(j,:) = hist(this_category, 2004:2015);
    plot(2004:1:2015, year_distribution_category(j,:), 'LineWidth', 2);
end
l = legend(categoryname, 'Location', 'NorthWest');
set(l, 'FontSize', 16);
ax = gca;
set(gca, 'Fontsize', 16);
ax.XTickLabelRotation = 45;