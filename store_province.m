province_distribution = hist(province, 34);
[Y, I] = sort(province_distribution, 'descend');
bar(Y);
X= [];
for x = I
    X = [X provincename(x)];
end
ax = gca;
set(ax, 'XTick', 1:34);
set(ax, 'XTickLabel', X);
ax.XTickLabelRotation = 45;
xlabel('province', 'Fontsize', 16);
ylabel('Number of stores', 'Fontsize', 16);
% initilize
states = shaperead('StatPlanet_China/map/map.shp', 'UseGeoCoords', true);
for x=1:32
    states(x).class = 34;
end
for x = 1:34
    for y = 1:32
        if strcmp(states(y).NAME_1, X(x))
            states(y).class = x;
            break
        end
    end
end
symbols = makesymbolspec('Polygon', {'class', [1 34], 'Facecolor', hot(31)});
geoshow(states, 'SymbolSpec', symbols);
xlabel('Longitude', 'Fontsize', 16);
ylabel('Latitude', 'Fontsize', 16);
hold on;
for i = 1:5000
    geoshow(latitude(i),longitude(i), 'Marker','.','Color','white');
end