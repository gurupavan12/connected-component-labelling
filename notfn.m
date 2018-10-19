%%%%%%%%%%%%%  Function notfn %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes the NOT operation of an image
%
% Input Variables:
%      imageA      first input image 
%      imageB      second input image
%      rows        Number of rows of output image A
%      cols        Number of coloumns of output image A
%       i|j        x|y coordinate of pixel for the input images
% 
% Returned Results:
%     NOToutput     resultant image after performing NOT operation on image
%                   A
%
% Processing Flow:
%      1.  Set a new image full of ZEROS
%      2.  For each valid pixel,
%             compute the pixel wise NOT operation
% 
%
%  The following functions are called:
%      none
%
%       Author:      Pavan Gurudath
%       Date:        09/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function NOToutput = notfn(imageA)
    [rows, cols] = size(imageA);
    NOToutput = zeros(rows, cols);
    for i = 1:rows
        for j = 1:cols
            if imageA(i,j) == 1
                NOToutput(i,j) = 0;
            else
                NOToutput(i,j) = 1;
            end
        end
    end
%      NOToutput = uint8(NOToutput);
end