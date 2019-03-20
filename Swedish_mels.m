%% This script is intended to demonstrate a simple plotting of 3D point data. The dataset are frequency (Hz) measurements of formants F1, F2, and F3 of the Swedish vowel space, from Kuronen (2000).
% The data were then converted into Mels as a respresentation of subjective distance. The .xlsx file has the data reported in Mels.
% Ben Lang: ben.lang@nyu.edu

%% Clear all output, close all windows, and clear the command line

clear all;
close all;
clc;

%% Read in the Swedish and American English vowel data and create necessary arrays and matrices as variables

swedish_vowels_mels = 'kuronen_mel.xlsx';
[num,txt] = xlsread(swedish_vowels_mels); %reads in the numbers as a matrix and the text as ana array from the spreadsheet
all_AmEng = ('benfinal_GAedit.xls');
[~,~,raw] = xlsread(all_AmEng);

Mels = num;
vowel_label = txt;

x = Mels(:,1);
y = Mels(:,2);
z = Mels(:,3);
S = (600);
s = S(:);



%% Plot the data
figure('units','normalized','outerposition',[0 0 1 1], 'color','[1 1 1]')
scatter3(x, y, z, s, 'filled', 'd', 'markeredgecolor','k'); % plots the data as an open dot for each point
title('Swedish Vowels in Mels')
xlabel('F1')
ylabel('F2')
zlabel('F3')
xpos = [x];
ypos = [y];
labels = vowel_label;
labelpoints(xpos, ypos, labels)
set(gca, 'fontsize', 24)

%% Measure the linear distances between specific points of interest

