function [] = line_tracer(img,parport,t)
temp_i=0;
temp_j=0;
count=0;
y=img(:,:,1);
new_img=((y>200));
for i=1:480
    for j=1:640
        if(new_img(i,j)==1)
            temp_i=temp_i+ i;
            temp_j=temp_j+ j;
            count=count+1;
        end
    end
end
cent_i=temp_i/count;
cent_j=temp_j/count;

if(cent_j<288)
    %move left
    bvdata=logical([1 0 1 0 0 0 0 0]);
    putvalue(parport,bvdata);
    pause(t);
    bvdata=logical([0 0 0 0 0 0 0 0]);
    putvalue(parport,bvdata);
elseif((cent_j>=288) & (cent_j<=352))
    %move forward
    bvdata=logical([0 1 1 0 0 0 0 0]);
    putvalue(parport,bvdata);
    pause(t);
    bvdata=logical([0 0 0 0 0 0 0 0]);
    putvalue(parport,bvdata);
elseif(cent_j>352)
    %move right
    bvdata=logical([0 1 0 1 0 0 0 0]);
    putvalue(parport,bvdata);
    pause(t);
    bvdata=logical([0 0 0 0 0 0 0 0]);
    putvalue(parport,bvdata);
end
end

