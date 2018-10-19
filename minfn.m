%%%%%%%%%%%%%  Function minfn %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes the minimum of the pixel intensity between two images
%
% Input Variables:
%      imageC      first input image 
%      imageD      second input image
%      rowsC       Number of rows of input image C
%      colsC       Number of coloumns of input image C
%      rowsD       Number of rows of input image D
%      colsD       Number of coloumns of input image D
%      rows        Number of rows of output image
%      cols        Number of coloumns of output image
%       i|j        x|y coordinate of pixel for the input image
% 
% Returned Results:
%     minofCandD     resultant image after finding min(C,D)
%
% Processing Flow:
%      1.  Set a new image full of ZEROS
%      2.  For each valid pixel,
%             compute the minimum of the pixel intensity of image C and
%             image D
% 
%
%  The following functions are called:
%      none
%
%       Author:      Pavan Gurudath
%       Date:        09/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function minofCandD = minfn(imageC,imageD)
    [rowsC, colsC] = size(imageC);
    [rowsD, colsD] = size(imageD);
    
    if(rowsC == rowsD && colsC == colsD)
        rows=rowsC;
        cols=colsC;
    else
        disp('Invalid set of images. Make sure the image size are the same');
    end
    minofCandD = zeros(rows, cols);
    
    for i = 1:rows
        for j = 1:cols
            if imageC(i,j) >= imageD(i,j)
                minofCandD(i,j) = imageD(i,j);
            else
                minofCandD(i,j) = imageC(i,j);
            end
        end
    end
minofCandD = uint8(minofCandD);
end