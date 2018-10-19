%%%%%%%%%%%%%  Function xorfn %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes the XOR operation between two images
%
% Input Variables:
%      imageA      first input image 
%      imageB      second input image
%      rowsA       Number of rows of input image A
%      colsA       Number of coloumns of input image A
%      rowsB       Number of rows of input image B
%      colsB       Number of coloumns of input image B
%      rows        Number of rows of output image
%      cols        Number of coloumns of output image
%       i|j        x|y coordinate of pixel for the input images
% 
% Returned Results:
%     XORoutput     resultant image after performing XOR operation between
%                   image A and image B
%
% Processing Flow:
%      1.  Set a new image full of ZEROS
%      2.  For each valid pixel,
%             compute the pixel wise XOR operation
% 
%
%  The following functions are called:
%      none
%
%       Author:      Pavan Gurudath
%       Date:        09/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function XORoutput = xorfn(imageA,imageB)
    [rowsA, colsA] = size(imageA);
    [rowsB, colsB] = size(imageB);
    if(rowsA == rowsB && colsA == colsB)
        rows=rowsA;
        cols=colsA;
    else
        disp('Invalid set of images. Make sure the image size are the same');
    end
    XORoutput = zeros(rows,cols);
    for i = 1:rows
        for j = 1:cols
            if imageA(i,j) == imageB(i,j)
                XORoutput(i,j) = 0;
            else
                XORoutput(i,j) = 1;
            end
        end
    end
%     XORoutput = uint8(XORoutput);
end