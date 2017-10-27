function []= data2img(data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
s=size(data);
for i=1:s(2)
    temp=data(:,i)
    temp=(reshape(temp,12,12));
    figure, imshow(temp)
end

end

