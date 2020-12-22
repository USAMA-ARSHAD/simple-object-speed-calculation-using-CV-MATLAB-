function x = FilterLabel(Image, average_area, labelled_array)
    unique_labels = unique(labelled_array);
    unique_labels = unique_labels';
    [r,c] = size(unique_labels);
    unique_labels_new = unique_labels(:,2:c);
    
    for i=1:c-1
        I = SeparateLabel(Image,unique_labels_new(1,i));
        area = ComputeArea(I);
        if area < average_area
            unique_labels_new(1,i)=[];
        end
    end
    x=unique_labels_new;
end