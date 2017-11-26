open_days = zeros(5000, 1);
for x = 1:5000
    open_days(x) = datenum(2017,5,22) - datenum(year1(x), month1(x), day1(x));
end
X_ele = linspace(min(open_days), max(open_days), 10);
Z = zeros(2, 10);
for y = 1:9
    for z = 1:5000
        if open_days(z) >= X_ele(y) && open_days(z) < X_ele(y+1)
            if verified(z) == 0
                Z(1, y) = Z(1, y) + review(z);
            else
                Z(2, y) = Z(2, y) + review(z);
            end
        end
    end
end
for z = 1:5000
    if open_days(z) == X_ele(10)
        if verified(z) == 0
            Z(1, 10) = Z(1, 10) + review(z);
        else
            Z(2, 10) = Z(2, 10) + review(z);
        end
    end
end
% heatmap
fig = figure;
colormap('hot');
imagesc(Z);
colorbar;
set(gca, 'YTick', 1:2);
X = cell(1,2);
X{1,1} = 'Unverified';
X{1,2} = 'Verified';
set(gca, 'YTickLabel', X);
set(gca, 'XTickLabel', X_ele);