%% This script is intended to demonstrate a simple plotting of 3D point data for multiple data sets.
% The datasets are frequency (Hz) measurements of formants F1, F2, and F3 of the Swedish and American English vowel spaces that have been converted into Mels.
% Swedish data is from from Kuronen (2000). American English data is from Hillenbrand et al. (1995)
% The data were then converted into Mels as a respresentation of subjective distance. The .xlsx files with "..._mels" have the data reported in Mels and are pulled in via this script.
% Author: Ben Lang (2019)
% Email: ben.lang@nyu.edu

%% Clear all output, close all windows, and clear the command line

clear all;
close all;
clc;

%% Read in the Swedish and American English vowel data and create necessary arrays and matrices as variables

% Swedish
swedish_vowels_mels = 'kuronen_mel.xlsx';
[num,txt] = xlsread(swedish_vowels_mels); %reads in the numbers as a matrix and the text as ana array from the spreadsheet

Mels = num; % rename variable
vowel_label = txt;

x = Mels(:,1); % pulls single column of data into x variable
y = Mels(:,2);
z = Mels(:,3);

% American English
american_vowels_mels = 'hillenbrand_mels.xlsx';
[num2,txt2] = xlsread(american_vowels_mels); %reads in the numbers as a matrix and the text as ana array from the spreadsheet

Mels2 = num2; % rename variable
vowel_label2 = txt2;

x2 = Mels2(:,1); % pulls single column of data into x variable
y2 = Mels2(:,2);
z2 = Mels2(:,3);

S = (400); % changes the size of the shape plotted for each point by creating a vector size
s = S(:); % vector inserted into variable that teh function for plotting uses
str = txt;
str2 = txt2;



%% Plot the data
figure('units','normalized','outerposition',[0 0 1 1], 'color','[1 1 1]') % fullscreen figure, centered, white background
scatter3(x, y, z, s, 'filled', 'd', 'm', 'markeredgecolor','k'); % plots the Swedish data as a filled diamond for each point
title('Swedish and American English Vowels in Mels') % title
xlabel('F1') % x-axis label
ylabel('F2') % y-axis label
zlabel('F3') % z-axis label
hold on %keeps first plot on the figure so you can add additional points
scatter3(x2, y2, z2, s, 'filled', 'c','markeredgecolor','k'); % plots the American English data as a filled dot for each point
text(x,y,z,txt,'FontSize',40,'Color','k') % plots Swedish phoneme on corresponding xyz coordinate as text, size 40, black
text(x2,y2,z2,txt2,'FontSize',40,'Color','k') % plots American English phoneme on corresponding xyz coordinate as text, size 40, black
set(gca, 'fontsize', 24) % sets overall figure font size to 24

%% Plot the data

% figure('units','normalized','outerposition',[0 0 1 1], 'color','[1 1 1]')
% ts = textscatter3(x,y,z,str);
% set(ts, 'fontsize', 24)
% title('Swedish Vowels in Mels')
% xlabel('F1')
% ylabel('F2')
% zlabel('F3')
% set(gca, 'fontsize', 24)

%% Measure the linear distances between specific points of interest

% pts1 = [X1, Y1, Z1];
% pts2 = [X2, Y2, Z2];
% sqrt(sum((pts1 - pts2 ) .^ 2))
% or:
% norm(pts1 - pts2)

pts1 = [x, y, z]
pts2 = [x2, y2, z2]
blob = sqrt(sum((pts1 - pts2).^2))
