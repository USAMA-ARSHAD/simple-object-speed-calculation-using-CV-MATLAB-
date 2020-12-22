function x= SeparateLabel(Image,labelNo)
[r,c] = size(Image);
labelled=zeros(r,c);
for i=1:r
    for j=1:c
        if Image(i,j)==labelNo
            labelled(i,j)=255;
        end
    end
end
x=labelled;
x = imbinarize(x);
end