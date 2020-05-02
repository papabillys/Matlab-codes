% img is the name of the image file you want to blur.
% w is a number for how much you want to blur the image.
% Try w = 3 - 6
% to view the blurred image use imshow(output)

function output = blur(img,w)
    
    % Store the image in a variable and initialize variables.
    pic = imread(img);
    pic_matrix_D = double(pic);
    [ size_x, size_y ] = size(pic_matrix_D);
    pic_blurred = zeros(size_x,size_y);
    
    % Iterate the whole image matrix.
    for i = 1:size_x
        for j = 1:size_y
            
            % Set limits of the submatrix we calculate mean.  
            limit_r = i+w;
            limit_l = i-w;
            limit_u = j-w;
            limit_d = j+w;
            
            % Check if limits are out of bound.
            if limit_l < 1
                limit_l = 1;
            end
            if limit_r > size_x
                limit_r = size_x;
            end
            if limit_u < 1
                limit_u = 1;
            end
            if limit_d > size_y 
                limit_d = size_y;
            end
            
            % Apply blur.
            temp = pic_matrix_D( [limit_l:limit_r] , [limit_u:limit_d] );
            pic_blurred(i,j) = mean(temp(:)); 
        end
    end
    
    % Make values uint8.
    output=uint8(pic_blurred);
    
end
