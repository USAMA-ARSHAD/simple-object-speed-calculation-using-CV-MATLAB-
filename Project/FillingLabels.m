function x = FillingLabels(Image)
unique_values = unique(Image);
[row,col] = size(unique_values);
[r,c] = size(Image);
count=2;
for i=1:row-2
    for j=1:r
        for k=1:c
            if Image(j,k)==unique_values(count+1,1)
                Image(j,k)=count;
            end
        end
    end
    count=count+1;
end
x=Image;
end