% initilize
for x=1:32
    states(x).class = 0;
end

for j = 1:34
    this_category = [];
    % pick out data of this category
    for i=1:5000
    	if province(i) == j
            this_category = [this_category review(i)];
        end
    end
    reviews = sum(this_category);
    for y = 1:32
        if strcmp(states(y).NAME_1, provincename(j))
            states(y).class = reviews;
            break
        end
    end
end



X = zeros(1,32);
for x = 1:32
    X(x) = states(x).class;
end
[Y, I] = sort(X, 'descend');
% initilize
for x=1:32
    states(x).rank = 34;
end
x = 1;
for i = I
    if Y(x) ~= 0
        states(i).rank = x;
    end
    x = x + 1;
end
figure;
symbols = makesymbolspec('Polygon', {'rank', [1 34], 'Facecolor', pink(32)});
geoshow(states, 'SymbolSpec', symbols);
xlabel('Longitude', 'FontSize', 16);
ylabel('Latitude', 'FontSize', 16);
set(gca, 'FontSize', 16);
title('Review Province Distribution', 'FontSize', 16);