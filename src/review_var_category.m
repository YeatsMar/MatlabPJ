review_var_category1 = zeros(1,14);
for j = 1:1:14
    this_category = [];
    for i=1:1:5000
    	if category(i) == j
            this_category = [this_category review(i)];
        end
    end
    review_var_category1(j) = var(this_category);
end
bar(review_var_category1);
ax = gca;
set(ax, 'XTickLabel', categoryname);
ax.XTickLabelRotation = 45;
% sort
[Y, I] = sort(review_var_category1, 'descend');
X= [];
for x = I
    X = [X categoryname(x)];
end
figure;
bar(Y);
ax = gca;
set(ax, 'XTickLabel', X);
ax.XTickLabelRotation = 45;
xlabel('Category', 'Fontsize', 16);
ylabel('Variance of review numbers', 'Fontsize', 16);