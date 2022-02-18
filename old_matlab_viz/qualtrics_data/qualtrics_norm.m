%% This script is intended to demonstrate a simple plotting of 3D point data for multiple data sets.
% The datasets are frequency (Hz) measurements of formants F1, F2, and F3 of the Swedish and American English vowel spaces that have been converted into Mels.
% Mels are useful for incorporating the subjective nature of the perceptual space into data.
% Swedish data is from from Kuronen (2000). American English data is from Hillenbrand et al. (1995)
% The .xlsx files with "..._mels" have the data reported in Mels and are pulled in via this script.
% There's also a section for calculating distances between a few select vowels of interest using the norm function.
% Author: Ben Lang (2019)
% Email: ben.lang@nyu.edu

%% Clear all output, close all windows, and clear the command line

clear all;
close all;
clc;

%% Read in the Swedish and American English vowel data and create necessary arrays and matrices as variables

% formants
formants = '/Users/ben/Documents/GitHub/bi_phon/qualtrics_data/biphon_vowels.xls';
[num,txt] = xlsread(formants, "A_token","F1_A","F2_A","F3_A"); %reads in the numbers as a matrix and the text as ana array from the spreadsheet

Mels = num; % rename variable
vowel_label = txt;

x = Mels(:,1); % pulls single column of data into x variable
y = Mels(:,2);
z = Mels(:,3);

% F_B
F_B = '/Users/ben/Documents/GitHub/bi_phon/qualtrics_data/biphon_vowels.xls';
[num2,txt2] = xlsread(F_B); %reads in the numbers as a matrix and the text as ana array from the spreadsheet

Mels2 = num2; % rename variable
vowel_label2 = txt2;

x2 = Mels2(:,1); % pulls single column of data into x variable
y2 = Mels2(:,2);
z2 = Mels2(:,3);

% F_X
F_X = '/Users/ben/Documents/GitHub/bi_phon/qualtrics_data/biphon_vowels.xls';
[num3,txt3] = xlsread(F_X); %reads in the numbers as a matrix and the text as ana array from the spreadsheet

Mels2 = num3; % rename variable
vowel_label2 = txt3;

x2 = Mels2(:,1); % pulls single column of data into x variable
y2 = Mels2(:,2);
z2 = Mels2(:,3);

S = (400); % changes the size of the shape plotted for each point by creating a vector size
s = S(:); % vector inserted into variable that teh function for plotting uses
str = txt;
str2 = txt2;

yy = num(2,:); % pull out just the coordinates for a single vowel
barred_u = num(4,:);
o1 = num(5,:);
oe = num (6,:);

e = num2(3,:);
eh = num2(4,:);
u = num2(9,:);
oo = num2(10,:);

yy_u = [yy;u]; % put two vowel coordinates alone in a variable to then calculate norm
yy_oo = [yy;oo];
barred_u_u = [barred_u;u];
barred_u_oo = [barred_u;oo];
e_o1 = [e;o1];
e_oe = [e;oe];
eh_o1 = [eh;o1];
eh_oe = [eh;oe];

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
hold on
plot3(yy_u(:,1), yy_u(:,2), yy_u(:,3),'LineWidth',3); % plot a line between two vowel coordinates of interest
plot3(yy_oo(:,1), yy_oo(:,2), yy_oo(:,3),'LineWidth',3);
plot3(barred_u_u(:,1), barred_u_u(:,2), barred_u_u(:,3),'LineWidth',3);
plot3(barred_u_oo(:,1), barred_u_oo(:,2), barred_u_oo(:,3),'LineWidth',3);
plot3(e_o1(:,1), e_o1(:,2), e_o1(:,3),'LineWidth',3);
plot3(e_oe(:,1), e_oe(:,2), e_oe(:,3),'LineWidth',3);
plot3(eh_o1(:,1), eh_o1(:,2), eh_o1(:,3),'LineWidth',3);
plot3(eh_oe(:,1), eh_oe(:,2), eh_oe(:,3),'LineWidth',3);
set(gca, 'XDir','reverse'); % changes the direction of the x-axis scale -- specifically necessary for vowel space visualization, the F1 label and F2 label need to start from the same zero point
set(gca, 'fontsize', 24); % sets overall figure font size to 24

%% Plot the data

% figure('units','normalized','outerposition',[0 0 1 1], 'color','[1 1 1]')
% ts = textscatter3(x,y,z,str);
% set(ts, 'fontsize', 24)
% title('Swedish Vowels in Mels')
% xlabel('F1')
% ylabel('F2')
% zlabel('F3')
% set(gca, 'fontsize', 24)

% % Your two points
% P1 = [0,0,0];
% P2 = [13,-11,19];
% 
% % Their vertial concatenation is what you want
% pts = [P1; P2];
% 
% % Because that's what line() wants to see    
% line(pts(:,1), pts(:,2), pts(:,3))
% 
% % Alternatively, you could use plot3:
% plot3(pts(:,1), pts(:,2), pts(:,3))

%% Measure the linear distances between specific points of interest

norm1 = norm(yy - u); % calculate distance between two 3D points -- two vowels
norm2 = norm(yy - oo);
norm3 = norm(barred_u - u);
norm4 = norm(barred_u - oo);
norm5 = norm(e - o1);
norm6 = norm(e - oe);
norm7 = norm(eh - o1);
norm8 = norm(eh - oe);

norm_all = [norm1; norm2; norm3; norm4; norm5; norm6; norm7; norm8]; % make a matrix of the vowel norms
vowel_label_distances = {'y - u'; 'y - oo'; 'barred_u - u'; 'barred_u - oo'; 'e - o1'; 'e - oe'; 'eh - o1'; 'eh - oe'}; % array of labels for the normed vowel relationship
distances = table(vowel_label_distances, norm_all) % print a table to show the relationship in one column and the ultimate value

% cognitive architecture of speech perception
% the signal is hard  for the comprehender
% speech comprehension is dealing with tons of variation within and across speakers
% behavioral categorical perception solves the problem
% how is that instantiated in the brain
% in phonetics, these the building blocks of the signal, show behavioral lit about VOT manipulations or F3 manipulations
% how does the brain decode these? is there a fine-grained neural represenation of these signals?
% we know the phoentic representations are really fine-grained, but does
% the brain do the same thing?
% represenationally, the behavior supports that the mind makes these
% distinctions, but we want the brain behavior response

% 96 unique combinations, 48 per set of 4


