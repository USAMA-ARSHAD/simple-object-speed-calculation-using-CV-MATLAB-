function x = ComputeCentroid(Image)
    area = ComputeArea(Image);
    [r,c]=size(Image);
    row=0;
    col=0;
    for i=1:r
        for j=1:c
           if Image(i,j)==1
                row=row+i;
                col=col+j;
           end
        end
    end
    row=round(row/area);
    col=round(col/area);
    x=[row,col];
end