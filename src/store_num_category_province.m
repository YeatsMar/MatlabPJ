%store# per province per category 
province_distribution_category = zeros(14, 34);
for j = 1:1:14
    % initilize
    for x=1:32
        states(x).class = 34;
    end
    this_category = [];
    % pick out data of this category
    for i=1:1:5000
    	if category(i) == j
            this_category = [this_category province(i)];
        end
    end
    province_distribution_category(j,:) = hist(this_category, 1:34);
    [Y, I] = sort(province_distribution_category(j,:), 'descend');
    X= [];
    for x = I
        X = [X provincename(x)];
    end
    for x = 1:34
        for y = 1:32
            if strcmp(states(y).NAME_1, X(x)) && Y(x)~=0
                states(y).class = x;
                break
            end
        end
    end
    figure;
    symbols = makesymbolspec('Polygon', {'class', [1 34], 'Facecolor', hot(32)});
    geoshow(states, 'SymbolSpec', symbols);
    title(categoryname(j), 'FontSize', 16);
    xlabel('Longitude', 'FontSize', 16);
    ylabel('Latitude', 'FontSize', 16);
    set(gca, 'FontSize', 16);
    saveas(gcf, strjoin(categoryname(j)), 'jpg');
end
close all;