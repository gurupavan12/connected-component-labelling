%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Familiarize concepts of digital image processing 
%
%
% Code flow: 
%      1.  Load input image 'wheelnoise.gif'.
%      2.  Threshold the input image and save it as fthresh.
%      3.  Find the connected components and label them using bwlabel MATLAB function.  
%      4.  Display the labeled image with colored components.
%      5.  Write a function to save the 4 largest components of the labeled
%          image.
%      6.  Write Matlab functions for the AND, OR, XOR and NOT operator.
%      7.  Load 'Match1.gif' and 'Match2.gif'. 
%      8.  Compute the AND, OR, XOR and NOT operation for the above two
%          images.
%      9.  Write a function to calculate minimum of two images
%          'mandrill_gray.tiff' and 'cameraman.tiff'.

%  The following functions are called:
%      component    To obtain the four largest components
%      andfn        To perform binary AND operation
%      orfn         To perform binary OR operation
%      xorfn        To perform binary XOR operation
%      notfn        To perform unary NOT operation
%      minfn        To compute the minimum of two pixel values         
%
%  Author:      Pavan Gurudath
%  Date:        09/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;            % Clear the command window
clear all;      % Clear the variables in the workspace 
close all;      % Close all figure/plot windows

warning off
%% Read the given Image
I= imread('wheelnoise.gif');        % Read input image
figure;    imshow(I);
% I2= imread('wheel.gif');
% figure;     imshow(I2);
Itemp = I;                          %Storing the input image such that it can be used later
Inoise=I;

%% Objective 1: Bright-Region Extraction
%% Objective 1.1:  Thresholding the Input image
[rows cols] = size(Inoise);         %Obtain the size of the original image 


[rows, cols] = size(Inoise);   %Obtain the size of the original image 
for i=1:rows
    for j=1:cols
        if (Inoise(i,j) < 150)
            fthresh(i,j)=0;
%         elseif (Inoise(i,j) < 220)
%             fthresh(i,j) = 127;
        else
            fthresh(i,j)=Inoise(i,j);
        end
    end
end

imwrite(fthresh,'fthresh.gif');             %Storing the thresholded image as fthresh
figure;     imshow(fthresh);
figure;     imshowpair(Inoise,fthresh,'montage'); %Comparison of images before and after thresholding

%% Objective 1.2: 
[flabel, num] = bwlabel(fthresh, 8);        %Computing the connected components of the thresholded image
fRGB = label2rgb(flabel);                   %Displaying the labeled image with colored components,
figure; imshow(fRGB)
imwrite(fRGB, 'RGB_labelImage.tif');

%% Objective 1.3: Saving the largest four components from the 8-connected labelled image
count(2,num) =0;        %Setting a [2xnum] array where the first row gives the area of the corresponding labelled component which is mentioned in second row.
counter =0;             %Setting a temp variable to count the frequency of the label
for k=1:num
    % Obtaining the frequency of each labelled component
    for i=1:rows
        for j=1:cols
            if flabel(i,j) == k
                counter=counter+1;
            end
        end
    end
    
    count(1,k)=counter;       %Setting the area of labelled componenet
    count(2,k)=k;             %Setting the corresponding labelled component
    counter =0;               %Resetting the variable for the next label
end

% The following set of comments could also be used in place. However this
% makes use of the inbuilt command flabel
% for k=1:num
%     [r c] = size(find(flabel == k)); % Obtaining the area of each labelled component
%     count(1,k)=r;       %Setting the area of labelled componenet
%     count(2,k)=k;       %Setting the corresponding labelled component
% end

big(2,4)=0;             %Setting an array of the largest 4 components that will consist of the area in row 1 and the label of component in row 2
temp(2,1)=0;            %Setting a temporary vector for sorting

%Sorting algorithm
for idx =1:4
    big(:,idx) = count(:, idx);
    for iter= idx+1:1:num
        if (count(1,iter)>big(1,idx))
            temp = count(:,iter);
            count(:,iter)= big(:,idx);
            big(:,idx)=temp;
        end
    end
end

%Accessing the four largest components
for n=1:4
    nth_ComponentImage = component(flabel, big,n);  %Calling a function to obtain the 4 largest components
    switch n
    case 1 
        first_component = nth_ComponentImage;
        imwrite(first_component,'first_component.tif');
        
    case 2
        second_component = nth_ComponentImage;
        imwrite(second_component,'second_component.tif');
        
    case 3 
        third_component = nth_ComponentImage;
        imwrite(third_component,'third_component.tif');
        
    case 4
        fourth_component = nth_ComponentImage;
        imwrite(fourth_component,'fourth_component.tif');
    end
end
All_Component = first_component+second_component+third_component+fourth_component;
figure; imshow(All_Component);
imwrite(All_Component, 'All_Component.tif');   %Displaying the four largest components in one image

%% OBJECTIVE 2: Logical (SET) Operation
%% Objective 2.1: AND, OR and XOR binary-image operators and NOT unary-image operator
% The objective is to write the functions to calculate AND, OR,
% XOR and NOT operations.


%% Objective 2.2: Computing logical operations
% Let A be the "match1" image and B be the "match2" image. Compute the following images: 
% A AND B , A OR B, A XOR B, and NOT(A)

inputA = imread('match1.gif');              %Load input image A
inputB = imread('match2.gif');              %Load input image B
imshowpair(inputA,inputB,'Montage');
%% Compute A AND B
AndOutput = andfn(inputA,inputB);           %Calling andfn to do the necessary operation
figure; imshow(AndOutput);
imwrite(AndOutput,'A_and_B.tif');

%% Compute A OR B
OrOutput = orfn(inputA,inputB);             %Calling orfn to do the necessary operation
figure; imshow(OrOutput);
imwrite(OrOutput,'A_or_B.tif');

%% Compute A XOR B
XorOutput = xorfn(inputA,inputB);           %Calling xorfn to do the necessary operation
figure; imshow(XorOutput);
imwrite(XorOutput,'A_xor_B.tif');

%% Compute NOT(A)
NotAOutput = notfn(inputA);                 %Calling notfn to do the necessary operation
figure; imshow(NotAOutput);
imwrite(NotAOutput,'notA.tif');

%% Objective 2.3: Computing E = min(C,D)
imageC = imread('mandril_gray.tif');
imageD = imread('cameraman.tif');

minoutputImage = minfn(imageC,imageD);
figure; imshow(minoutputImage);
imwrite(minoutputImage,'min_of_C_and_D.tif');
