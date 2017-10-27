function [img_data centroid rect]=navigation(vid1,vid2,parport)
a=1;
start(vid1);

while(a)
    img=getsnapshot(vid1);
    img_rgb=ycbcr2rgb(img);
    r=img_rgb(:,:,1);
    g=img_rgb(:,:,2);
    b=img_rgb(:,:,3);
    r2=((r-g)+(r-b));
    r2=((r2==255));
    bw=bwconncomp(r2,8);
    numPixels = cellfun(@numel,bw.PixelIdxList);
    if(max(numPixels)>50000)
        display('Red Blot found')
        pause(2);
        img=getsnapshot(vid2);
        img_rgb=ycbcr2rgb(img);
        figure, imshow(img_rgb)
        [img_data centroid rect]=text_extraction1(img_rgb,img);
        stop(vid1);
        
        return
    else
        road_recognition(img, parport,0.2);
    end
    
end
stop(vid2);stop(vid1)
end