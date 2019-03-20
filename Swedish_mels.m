%% This script is intended to demonstrate a simple plotting of 3D point data. The dataset are frequency (Hz) measurements of formants F1, F2, and F3 of the Swedish vowel space, from Kuronen (2000).
% The data were then converted into Mels as a respresentation of subjective distance. The .xlsx file has the data reported in Mels.
% Ben Lang: ben.lang@nyu.edu

%% Clear all output, close all windows, and clear the command line

clear all;
close all;
clc;

%% Read in teh Swedish vowel data and create necessary arrays and matrices as variables

filename = 'kuronen_mel.xlsx';
[num,txt] = xlsread(filename); %reads in the numbers as a matrix and the text as ana array from the spreadsheet

Mels = num
vowels = txt

x = Mels(:,1);
y = Mels(:,2);
z = Mels(:,3);

%% Plot the data

plot3(x, y, z, 'o'); % plots the data as an open dot for each point
title('Swedish Vowels in Mels')
xlabel('F1')
ylabel('F2')
zlabel('F3')

%% Measure the linear distances between specific points of interest