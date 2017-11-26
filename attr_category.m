m_category = [c' review_category' review_avg_category' review_var_category1'];
bar(m_category);
ax = gca;
set(ax, 'XTickLabel', categoryname);
ax.XTickLabelRotation = 45;
legend('store#', 'review#', 'review avg', 'review var');