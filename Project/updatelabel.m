function x = updatelabel(Image,first,second)
    [r,c] = size(Image);
    value = (min(first, second));
    replace = (max(first, second));
    for i=1:r
        for j=1:c
            val = Image(i,j);
            if val==replace
                Image(i,j)= value;
            end
        end
    end
    x = Image;       
end