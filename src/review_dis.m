% review
% box
boxplot(review);
ylabel('review#', 'Fontsize', 16);
title('Review# Distribution', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
% cdf
figure;
cdfplot(review);
ylabel('review#', 'Fontsize', 16);
title('Review# Distribution', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
% semilogx cdf
figure;
x = min(review):max(review);
[n,bins] = hist(review, min(review):max(review));
p = n/length(review);
P = cumsum(p);
x = min(review):max(review);
semilogx(x, P, 'ro')
xlabel('review#', 'Fontsize', 16);
ylabel('F(x)', 'Fontsize', 16);
title('CDF of review#', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
% review verification
figure;
boxplot(review, verified);
set(gca, 'XTickLabel', X);
ylabel('review#', 'Fontsize', 16);
title('Review#-Verification Distribution', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
% review category
figure;
boxplot(review, category);
ylabel('review#', 'Fontsize', 16);
title('Review#-Category Distribution', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
set(gca, 'XTickLabel', categoryname);
ax = gca;
ax.XTickLabelRotation = 45;
% open_days
figure;
boxplot(open_days);
ylabel('open days', 'Fontsize', 16);
title('Open Days Distribution', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
% cdf
figure;
cdfplot(open_days);
xlabel('open days', 'Fontsize', 16);
title('Open Days Distribution', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
% verified
figure;
boxplot(open_days, verified);
set(gca, 'XTickLabel', X);
ylabel('open days', 'Fontsize', 16);
title('Open Days - Verification Distribution', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
figure;
boxplot(open_days, category);
set(gca, 'XTickLabel', categoryname);
ylabel('open days', 'Fontsize', 16);
title('Open Days - Category Distribution', 'Fontsize', 16);
set(gca, 'Fontsize', 16);
ax = gca;
ax.XTickLabelRotation = 45;