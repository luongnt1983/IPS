clc;
clear;
Dataset = xlsread('C:\IPS\Offline\Training_Data.xlsx');
%Dataset = xlsread('Training_Data.xlsx');
A = Dataset;
A(:, 1)=[]; 
A(:, 1)=[];
A(:, 1)=[];
[m, n] = size(A);
Mean_RSS = [];
RP = 0;
for i = 1:205
    row_Mean = [];
    for j = 1:n
        S = 0;
        for k = RP+1:RP+100
            S = S + A(k, j);
        end
        S = S/100;
        row_Mean = [row_Mean, S];
    end
    Mean_RSS = [Mean_RSS; row_Mean];
    RP = 100*i;
end
%xlswrite('C:\IPS\Offline\Mean_RSS_100.xlsx', Mean_RSS);

B = Mean_RSS';
AP1 = B(1, :);
AP2 = B(2, :);
AP3 = B(3, :);
AP4 = B(4, :);
AP5 = B(5, :);
RP = [];
for i = 1:205
    RP = [RP, i-1];
end

figure(6)
hold all
grid on
axis([0 210 -76, -26])
plot(RP, AP1, '-r',  'LineWidth',2);
plot(RP, AP2, '--b', 'LineWidth',2);
plot(RP, AP3, ':g',  'LineWidth',2.3);
plot(RP, AP4, '-.c', 'LineWidth',2.2);
plot(RP, AP5, '-m',  'LineWidth',2);
legend('AP1','AP2', 'AP3', 'AP4', 'AP5')
xlabel('Reference Points', 'Color', 'b', 'FontSize', 12, 'FontWeight', 'bold'); 
ylabel('RSS (dBm)', 'Color', 'm', 'FontSize', 12, 'FontWeight', 'bold');
title('Mean values of 5 APs', 'Color', 'b', 'FontSize', 16, 'FontWeight', 'bold');


