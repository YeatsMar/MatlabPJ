%store# per province per year 
province_distribution_year = zeros(12, 34);
for j = 2004:2015
    % initilize
    for x=1:32
        states(x).class = 34;
    end
    this_year = [];
    % pick out data of this year
    for i=1:1:5000
    	if year1(i) == j
            this_year = [this_year province(i)];
        end
    end
    province_distribution_year(j,:) = hist(this_year, 1:34);
    [Y, I] = sort(province_distribution_year(j,:), 'descend');
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
    title(num2str(j), 'FontSize', 16);
    xlabel('Longitude', 'FontSize', 16);
    ylabel('Latitude', 'FontSize', 16);
    set(gca, 'FontSize', 16);
    saveas(gcf, num2str(j), 'jpg');
end
close all;