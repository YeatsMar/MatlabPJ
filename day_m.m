day_distribution = hist(day1, 1:31);
plot(1:31, day_distribution, '-ro');
set(gca, 'XTick', 1:31);
xlabel('day', 'Fontsize', 16);
ylabel('Number of stores', 'Fontsize', 16);
% per category
day_distribution_category = zeros(14, 31);
figure;
axis([1 31 0 250]);
set(gca, 'XTick', 1:31);
hold on;
for j = 1:1:14
    this_category = [];
    for i=1:1:5000
    	if category(i) == j
            this_category = [this_category day1(i)];
        end
    end
    day_distribution_category(j,:) = hist(this_category, 1:31);
    plot(1:31, day_distribution_category(j,:));% , 'LineWidth', 2
end
l = legend(categoryname, 'Location', 'Best');
xlabel('day', 'Fontsize', 16);
ylabel('Number of stores', 'Fontsize', 16);