%%%%%%%%%%%%%  Function component %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Extract the four largest components of the input image given their
%      label number
%
% Input Variables:
%      flabel      input image 
%      big         matrix that contains the four largest label numbers and 
%                  its frequency
%      n           component number amongst the four largest components
%      rows        Number of rows of input image 
%      cols        Number of coloumns of input image 
%       i|j        x|y coordinate of pixel for the input image
% 
% Returned Results:
%     outputComponentImage     resultant image after obtaining the nth
%                              component
%
% Processing Flow:
%      1.  Using the input value of n, we obtain the nth largest component
%      2.  For each valid pixel,
%             Access the label number of the nth largest component
%             Compare the labels of input image with the label number
%             If the above comparison is true, then set that pixel
%               intensity as 1, and all other label as 0.
% 
%
%  The following functions are called:
%      none
%
%       Author:      Pavan Gurudath, Abhishek Durairaj, Visweshwar Srinivasan
%       Date:        09/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function outputComponentImage = component(flabel,big,n)
    index=n;
    [rows cols] = size(flabel);
    for i=1:rows
        for j=1:cols
            if (flabel(i,j) == big(2,index))
                outputComponentImage(i,j) = 1;
            else
                outputComponentImage(i,j) = 0;
            end
        end
    end
    
    figure;    imshow(outputComponentImage);
    
end




