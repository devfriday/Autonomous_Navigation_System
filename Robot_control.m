function [] = Robot_control(parport,t)
b=1;
while(b)
   a=input('Enter the direction to move into');
   
   switch(a)
       case 8;% back
           bvdata=logical([1 0 0 1 0 0 0 0]); 
           putvalue(parport,bvdata);
           pause(t);
           bvdata=logical([0 0 0 0 0 0 0 0]);
           putvalue(parport,bvdata);
       case 4;% right
           bvdata=logical([0 1 0 1 0 0 0 0]);
           putvalue(parport,bvdata);
           pause(t);
           bvdata=logical([0 0 0 0 0 0 0 0]);
           putvalue(parport,bvdata);
       case 6; % left
           bvdata=logical([1 0 1 0 0 0 0 0]);
           putvalue(parport,bvdata);
           pause(t);
           bvdata=logical([0 0 0 0 0 0 0 0]);
           putvalue(parport,bvdata);
       case 2; % front
           bvdata=logical([0 1 1 0 0 0 0 0]);
           putvalue(parport,bvdata);
           pause(t);
           bvdata=logical([0 0 0 0 0 0 0 0]);
           putvalue(parport,bvdata);
       case 0;
           b=0;
   end
end
end

