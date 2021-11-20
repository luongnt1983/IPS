clc;
clear;
Case1 = xlsread('C:\IPS\Online\Case1.xlsx');
Case1(:, 1) = [];
Mean_RSS = xlsread('C:\IPS\Online\Mean_100_RSS.xlsx');
XY = []; XY = [XY, Mean_RSS(:, 2)]; XY = [XY, Mean_RSS(:, 3)];

A = Mean_RSS;
A(:, 1)=[]; 
A(:, 1)=[];
A(:, 1)=[];
[m, n] = size(A);

%KNN Algorithm: K=3, K=7, K=11. 
%==========================================================================
tic
K = 3;
Err_3NN = [];
for t = 1:m
    RSS = Case1(t, :);
    NN = [];
    for i = 1 : m
        d = 0;
        for j = 1 : n
            d = d + (RSS(j) - A(i, j))^2;
        end
        d = sqrt(d);
        NN = [NN, d];
    end
    L = [];
    for l = 1:K
        Min = NN(1); location = 1;
        for i = 2:m
            if (ismember(i, L) == 0 && (Min > NN(i)))
                Min = NN(i);
                location = i; 
            end
        end
        L = [L, location];
    end
    x = 0; y = 0;
    for l = 1:K
        x = x + XY(L(l), 1);
        y = y + XY(L(l), 2); 
    end
    x = x/K; y = y/K;
    Err_3NN = [Err_3NN; sqrt((XY(t, 1) - x)^2 + (XY(t, 2) - y)^2)];
end
%-------------------------
K = 7;
Err_7NN = [];
for t = 1:m
    RSS = Case1(t, :);
    NN = [];
    for i = 1 : m
        d = 0;
        for j = 1 : n
            d = d + (RSS(j) - A(i, j))^2;
        end
        d = sqrt(d);
        NN = [NN, d];
    end
    L = [];
    for l = 1:K
        Min = NN(1); location = 1;
        for i = 2:m
            if (ismember(i, L) == 0 && (Min > NN(i)))
                Min = NN(i);
                location = i; 
            end
        end
        L = [L, location];
    end
    x = 0; y = 0;
    for l = 1:K
        x = x + XY(L(l), 1);
        y = y + XY(L(l), 2); 
    end
    x = x/K; y = y/K;
    Err_7NN = [Err_7NN; sqrt((XY(t, 1) - x)^2 + (XY(t, 2) - y)^2)];
end
%-------------------------
K = 11;
Err_11NN = [];
for t = 1:m
    RSS = Case1(t, :);
    NN = [];
    for i = 1 : m
        d = 0;
        for j = 1 : n
            d = d + (RSS(j) - A(i, j))^2;
        end
        d = sqrt(d);
        NN = [NN, d];
    end
    L = [];
    for l = 1:K
        Min = NN(1); location = 1;
        for i = 2:m
            if (ismember(i, L) == 0 && (Min > NN(i)))
                Min = NN(i);
                location = i; 
            end
        end
        L = [L, location];
    end
    x = 0; y = 0;
    for l = 1:K
        x = x + XY(L(l), 1);
        y = y + XY(L(l), 2); 
    end
    x = x/K; y = y/K;
    Err_11NN = [Err_11NN; sqrt((XY(t, 1) - x)^2 + (XY(t, 2) - y)^2)];
end
toc
%==========================================================================

%Weighted KNN Algorithm: K=3, K=7, K=11.
%==========================================================================
tic
K = 3;
Err_W3NN = [];
for t = 1:m
    RSS = Case1(t, :);
    NN = [];
    for i = 1 : m
        d = 0;
        for j = 1 : n
            d = d + (RSS(j) - A(i, j)).^2;
        end
        d = sqrt(d);
        NN = [NN, d];
    end
    L = [];
    for l = 1:K
        Min = NN(1); location = 1;
        for i = 2:m
            if (ismember(i, L) == 0 && (Min > NN(i)))
                Min = NN(i);
                location = i; 
            end
        end
        L = [L, location];
    end
    c = 0.01;
    w = ones(K);
    W = 0;
    for l = 1:K
        w(l) = 1/(NN(L(l))+c);  
        W = W + w(l);
    end
    x = 0; y = 0;
    for l = 1:K
        x = x + w(l)*XY(L(l), 1);
        y = y + w(l)*XY(L(l), 2); 
    end
    x = x/W; y = y/W;
    Err_W3NN = [Err_W3NN; sqrt((XY(t, 1) - x).^2 + (XY(t, 2) - y).^2)];
end
%-----------------------------
K = 7;
Err_W7NN = [];
for t = 1:m
    RSS = Case1(t, :);
    NN = [];
    for i = 1 : m
        d = 0;
        for j = 1 : n
            d = d + (RSS(j) - A(i, j)).^2;
        end
        d = sqrt(d);
        NN = [NN, d];
    end
    L = [];
    for l = 1:K
        Min = NN(1); location = 1;
        for i = 2:m
            if (ismember(i, L) == 0 && (Min > NN(i)))
                Min = NN(i);
                location = i; 
            end
        end
        L = [L, location];
    end
    c = 0.01;
    w = ones(K);
    W = 0;
    for l = 1:K
        w(l) = 1/(NN(L(l))+c);  
        W = W + w(l);
    end
    x = 0; y = 0;
    for l = 1:K
        x = x + w(l)*XY(L(l), 1);
        y = y + w(l)*XY(L(l), 2); 
    end
    x = x/W; y = y/W;
    Err_W7NN = [Err_W7NN; sqrt((XY(t, 1) - x).^2 + (XY(t, 2) - y).^2)];
end
%-----------------------------
K = 11;
Err_W11NN = [];
for t = 1:m
    RSS = Case1(t, :);
    NN = [];
    for i = 1 : m
        d = 0;
        for j = 1 : n
            d = d + (RSS(j) - A(i, j)).^2;
        end
        d = sqrt(d);
        NN = [NN, d];
    end
    L = [];
    for l = 1:K
        Min = NN(1); location = 1;
        for i = 2:m
            if (ismember(i, L) == 0 && (Min > NN(i)))
                Min = NN(i);
                location = i; 
            end
        end
        L = [L, location];
    end
    c = 0.01;
    w = ones(K);
    W = 0;
    for l = 1:K
        w(l) = 1/(NN(L(l))+c);  
        W = W + w(l);
    end
    x = 0; y = 0;
    for l = 1:K
        x = x + w(l)*XY(L(l), 1);
        y = y + w(l)*XY(L(l), 2); 
    end
    x = x/W; y = y/W;
    Err_W11NN = [Err_W11NN; sqrt((XY(t, 1) - x).^2 + (XY(t, 2) - y).^2)];
end
toc
%==========================================================================

Err_3NN = Err_3NN'; Err_7NN = Err_7NN'; Err_11NN = Err_11NN';
RP = [];
for i = 1:205
    RP = [RP, i-1];
end
Err_W3NN = Err_W3NN'; Err_W7NN = Err_W7NN'; Err_W11NN = Err_W11NN';

%==========================================================================================
figure(8)
subplot(3, 1, 1);
plot(RP, Err_3NN, '--b', RP, Err_W3NN, '--r', 'LineWidth',2);
legend('KNN, K = 3', 'WKNN, K = 3');
ylabel('Positioning Error (m)', 'Color', 'k', 'FontSize', 10);
title('Experimental Results of 2 Algorithms (Case 1)', 'Color', 'b', 'FontSize', 14, 'FontWeight', 'bold');
xlim([0 205]); ylim([0 8])

subplot(3, 1, 2);
plot(RP, Err_7NN, '--b', RP, Err_W7NN, '--r', 'LineWidth',2);
legend('KNN, K = 7', 'WKNN, K = 7');
ylabel('Positioning Error (m)', 'Color', 'k', 'FontSize', 10);
xlim([0 205]); ylim([0 8]);

subplot(3, 1, 3);
plot(RP, Err_11NN, '--b', RP, Err_W11NN, '--r', 'LineWidth',2);
legend('KNN, K = 11', 'WKNN, K = 11')
ylabel('Positioning Error (m)', 'Color', 'k', 'FontSize', 10);
xlabel('Reference Points', 'Color', 'k', 'FontSize', 11); 
xlim([0 205]); ylim([0 8]);
%==========================================================================================


