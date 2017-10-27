function [image]=data2image(data)
s=size(data);
for j=1:s(2)
    temp=reshape(data(:,j),12,12);
    image(:,:,:,j)=temp';
    figure, imshow(temp')
end