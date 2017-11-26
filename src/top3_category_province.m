for x = 1: 34
    temp = province_distribution_category(:, x);
    [Y, I] = sort(temp, 'descend');
    X = [];
    for i = I(1:3)
        X = [X, categoryname(i)];
    end
    Y = Y(1:3);
    figure;
    bar(Y);
    ax = gca;
    set(ax, 'XTick', 1:3);
    set(ax, 'XTickLabel', X);
    set(ax, 'FontSize', 16);
    title(provincename(x), 'FontSize', 16);
    xlabel('Category', 'FontSize', 16);
    ylabel('Number of Stores', 'FontSize', 16);
    saveas(gcf, strjoin(provincename(x)), 'jpg');
    close;
end