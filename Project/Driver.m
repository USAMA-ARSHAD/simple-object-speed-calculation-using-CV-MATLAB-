function [unique_labels_new,no_of_vehicles,num_of_images,movie,labelled_object_matrix] = Driver(path)

v= VideoReader(path);
%v= VideoReader('sample2.mp4');
num_of_images=get(v,'NumberOfFrames');
v=read(v);
[r,c]=size(v(:,:,1));
movie= zeros(r,c,num_of_images);
labelled_object_matrix = zeros(size(movie));
for i=1:num_of_images
    movie(:,:,i)=rgb2gray(v(:,:,:,i));
end
mid =round(num_of_images/2);
%imshow(uint8(movie(:,:,mid)));
threshold = graythresh(uint8(movie(:,:,round(num_of_images/2))));
for j=1:num_of_images
    movie(:,:,j)=imbinarize(movie(:,:,j),threshold*256);
end
for j=1:num_of_images
    labelled_object_matrix(:,:,j)=FindLabels(movie(:,:,j));
end
unique_labels = unique(labelled_object_matrix);
unique_labels = unique_labels';
[r,c] = size(unique_labels);
unique_labels_new = unique_labels(:,2:c);
no_of_vehicles = c-1;

end