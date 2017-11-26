review_category = zeros(1,14);
for i=1:1:5000
    review_category(category(i)) = review_category(category(i)) + review(i);
end
[Y, I] = sort(review_category, 'descend');
bar(Y);
X= [];
for x = I
    X = [X categoryname(x)];
end
ax = gca;
set(ax, 'XTickLabel', X);
ax.XTickLabelRotation = 45;
xlabel('Category', 'Fontsize', 16);
ylabel('Number of reviews', 'Fontsize', 16);