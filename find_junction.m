function [img_data] = find_junction(new_img)
tic
s=size(new_img);
bw=bwconncomp(new_img,8);
numPixels = cellfun(@numel,bw.PixelIdxList);
for i=1:bw.NumObjects
    if numPixels(i)<2000
        new_img(bw.PixelIdxList{i})=0;
    end
end
[x no_char]=bwlabel(new_img,8);
minx(1:no_char)=s(1);
maxx(1:no_char)=1;
miny(1:no_char)=s(2);
maxy(1:no_char)=1;
for i=1:s(1)
    for j=1:s(2)
        for k=1:no_char
            if x(i,j)==k
                if i<minx(k)
                    minx(k)=i;
                elseif i>maxx(k)
                    maxx(k)=i;
                end
            
                if j<miny(k)
                    miny(k)=j;
                elseif j>maxy(k)
                    maxy(k)=j;
                end
            end
        end
    end
end
rect=[miny; minx; maxy-miny; maxx-minx];
rect=transpose(rect)
for i=1:no_char
    temp=imcrop(new_img,rect(i,:));
    temp=imresize(temp,[12 12],'bicubic');
    %eval(['imwrite(temp,' num2str(i) '.jpeg);']);
    temp2=temp';
    if i==1
        img_data=temp2(:);
    else
        img_data=[img_data temp2(:)];
    end
   % f = inline('uint8(round(mean2(x)*ones(size(x))))');
   % temp = blkproc(temp,[5 5],f);
   % temp=imresize(temp,[12 12]);
   % temp=im2bw(temp,0.05);
    eval(['char' num2str(i) '=temp;']);
    eval(['figure, imshow((char' num2str(i) ')), xlabel(' num2str(i) ')']);
end
toc