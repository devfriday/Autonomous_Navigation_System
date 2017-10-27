function [new_img]=white_box(img2)
s=size(img2);
minx=s(1);
maxx=1;
miny=s(2);
maxy=1;
new_box=img2;
r=new_box(:,:,1);
g=new_box(:,:,2);
b=new_box(:,:,3);
new_box=~((r>90) & (g>90) & (b>90));
%new_box= medfilt2(new_box, [3 3]); 
for i=1:s(1)
    for j=1:s(2)
        if new_box(i,j)==0 
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
figure, imshow(new_box);
minx=minx+25;
miny=miny+25;
maxx=maxx-25;
maxy=maxy-25;
rect=[miny minx maxy-miny maxx-minx];
new_img=imcrop(new_box,rect);
%imwrite(new_img,'white_box.jpeg','jpeg');