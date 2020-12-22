function x = ComputeArea(Image)
    Area=0;
    [r,c]=size(Image);
    for i=1:r
        for j=1:c
           if Image(i,j)==1
                Area=Area+1;
            end
        end
    end
    x=Area;
end