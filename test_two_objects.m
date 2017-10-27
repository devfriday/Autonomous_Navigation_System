function []=test_two_objects(vid1, vid2)
vid1=videoinput('winvideo',1,'YUY2_640x480');
preview(vid1)
a=input('from first object...press any key to continue');
closepreview
delete(vid1);
vid2=videoinput('winvideo',1,'YUY2_160x120');
preview(vid2);
b=input('from second object...press any key to continue');
delete(vid2);
end