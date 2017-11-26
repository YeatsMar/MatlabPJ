c = zeros(1, 14);
for x = category'
    c(x) = c(x) + 1;
end
[Y, I] = sort(c, 'descend');
bar(Y);
X= [];
for x = I
    X = [X categoryname(x)];
end
ax = gca;
set(ax, 'XTickLabel', X);
ax.XTickLabelRotation = 45;
xlabel('Category', 'Fontsize', 16);
ylabel('Number of stores', 'Fontsize', 16);
%pie
figure;
Y_new = [Y(1:9) sum(Y(10:14))];
X_new = [X(1:9) 'Others'];
title('Category propotion', 'Fontsize', 16);