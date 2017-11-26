review_avg_category = review_category ./ c;
[Y, I] = sort(review_avg_category, 'descend');
X= [];
for x = I
    X = [X categoryname(x)];
end
figure;
bar(Y);
ax = gca;
set(gca, 'XTickLabel', X);
set(gca, 'FontSize', 16);
ax.XTickLabelRotation = 45;
xlabel('Category', 'Fontsize', 16);
ylabel('Average number of reviews', 'Fontsize', 16);