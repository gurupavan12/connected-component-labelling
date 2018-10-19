%%%%%%%%%%%%%  Function andfn %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes the AND operation between two images
%
% Input Variables:
%      imageA      first input image 
%      imageB      second input image
%      rowsA       Number of rows of input image A
%      colsA       Number of coloumns of input image C
%      rowsB       Number of rows of input image B
%      colsB       Number of coloumns of input image B
%      rows        Number of rows of output image
%      cols        Number of coloumns of output image
%       i|j        x|y coordinate of pixel for the input image
% 
% Returned Results:
%     ANDoutput     resultant image after performing AND operation between
%                   image A and image B
%
% Processing Flow:
%      1.  Set a new image full of ZEROS
%      2.  For each valid pixel,
%             compute the pixel wise AND operation
% 
%
%  The following functions are called:
%      none
%
%       Author:      Pavan Gurudath
%       Date:        09/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

function ANDoutput = andfn(imageA,imageB)
    [rowsA, colsA] = size(imageA);
    [rowsB, colsB] = size(imageB);
    
    if(rowsA == rowsB && colsA == colsB)
        rows=rowsA;
        cols=colsA;
    else
        disp('Invalid set of images. Make sure the image size are the same');
    end

    ANDoutput = zeros(rows, cols);
    for i = 1:rows
        for j = 1:cols
            if imageA(i,j) == 1 && imageB(i,j) == 1
                ANDoutput(i,j) = 1;
            else
                ANDoutput(i,j) = 0;
            end
        end
    end
%     ANDoutput = uint8(ANDoutput);
end