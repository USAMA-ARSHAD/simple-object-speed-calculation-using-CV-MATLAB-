function x = FindLabels(I)
count = 1;
[r,c] = size(I);
labelled=zeros(r,c);
for i=1:r
    for j=1:c
        if I(i,j)~=0
            
            if i~=1 && j~=1 && I(i,j)== I(i-1,j-1)
               labelled(i,j)=labelled(i-1,j-1);
            elseif j~=1 && I(i,j)== I(i,j-1)
                if i~=1 && I(i,j)== I(i-1,j)
                    if labelled(i-1,j)~=labelled(i,j-1)
                        labelled = updatelabel(labelled,labelled(i-1,j),labelled(i,j-1));
                        
                    end
                end
                labelled(i,j)=labelled(i,j-1);
            elseif i~=1 && I(i,j)== I(i-1,j) 
                labelled(i,j)=labelled(i-1,j);
            else
                labelled(i,j)=count;
                count = count+1;
            end
        end
    end
end
labelled = FillingLabels(labelled);
x = labelled;
end