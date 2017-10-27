function [new_img]= red_box(a,limit);
img=double(a);
s=size(img);
minx=s(1);
maxx=1;
miny=s(2);
maxy=1;
red_box=img;
%r=img(:,:,1);
%g=img(:,:,2);
%b=img(:,:,3);
%red_box=((r>100) & (g<50) & (b<50));
red_box=zeros(s(1),s(2));
y=img(:,:,1);
cb=img(:,:,2);
cr=img(:,:,3);
for i=1:s(1)
    for j=1:s(2)
        d=sqrt((y(i,j)-81.7946)^2 + (cb(i,j)-102.4029)^2 +(cr(i,j)-214.8273)^2);
        if(d<limit)
            red_box(i,j)=1;
        end
    end
end
figure, imshow(red_box)
B = medfilt2(red_box, [15 15]);
%imwrite(B,'redbox.jpeg','jpeg');
for i=1:s(1)
    for j=1:s(2)
        if B(i,j)==1;
             if i<minx
                   minx=i;
             elseif i>maxx
                   maxx=i;
             end

             if j<miny
                   miny=j;
             elseif j>maxy
                   maxy=j;
             end
        end 
    end
end
minx=minx+25;
miny=miny+25;
maxx=maxx-25;
maxy=maxy-25;
figure, imshow(B)
new_img=img(minx:maxx,miny:maxy,:);
a=uint8(new_img);
%imwrite(a,'red_box2.jpeg','jpeg');
figure, imshow(uint8(new_img))
