verified_reviews = 0;
unverified_reviews = 0;
verified_store_num = sum(verified);
unverified_store_num = 5000 - verified_store_num;
for i = 1:5000
    if verified(i) == 1
        verified_reviews = verified_reviews + review(i);
    else
        unverified_reviews = unverified_reviews + review(i);
    end
end
x = [0 1];
high = [unverified_store_num verified_store_num];
w1 = 0.5;
bar(x, high, w1, 'FaceColor', [0.2 0.2 0.5], 'EdgeColor', [1 0 1]);
low = [unverified_reviews verified_reviews];
w2 = 0.25;
hold on;
bar(x, low, w2, 'FaceColor', [0 0.7 0.7]);
ax = gca;
X{1,1} = 'Unverified';
X{1,2} = 'Verified';
set(ax, 'XTickLabel', X);
set(ax, 'Fontsize', 16);
l = legend('store#', 'review#', 'Location', 'NorthWest');
set(l, 'Fontsize', 16);
fprintf('average review numbers of unverified store: %d\n', unverified_reviews/unverified_store_num);
fprintf('average review numbers of verified store: %d\n', verified_reviews/verified_store_num);
