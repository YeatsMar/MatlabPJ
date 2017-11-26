month_distribution = hist(month1, 1:12);
plot(1:12, month_distribution, '-ro');
set(gca, 'XTick', 1:12);
xlabel('month', 'Fontsize', 16);
ylabel('Number of stores', 'Fontsize', 16);
% per category
month_distribution_category = zeros(14, 12);
figure;
axis([1 12 0 450]);
ax = gca;
set(ax, 'XTick', 1:12);
hold on;
for j = 1:1:14
    this_category = [];
    for i=1:1:5000
    	if category(i) == j
            this_category = [this_category month1(i)];
        end
    end
    month_distribution_category(j,:) = hist(this_category, 1:12);
    plot(1:12, month_distribution_category(j,:), 'LineWidth', 2);
end
l = legend(categoryname, 'Location', 'NorthWest');
%set(l, 'FontSize', 16);
set(ax, 'FontSize', 16);
xlabel('Month', 'Fontsize', 16);
ylabel('Number of stores', 'Fontsize', 16);