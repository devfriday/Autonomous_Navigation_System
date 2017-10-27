function [op info]= text_reco_bot(net,img)
[char_data centroid]=text_extraction1(img);
char_data=double(char_data);
op=sim(net,char_data);
[m idx]=max(op);
s=size(m);
n=2 ;% charater to be recognized
for i=1:s(2)
    if(m(i)>0.5)
        if(idx(i)==n)
            centro=centroid(:,i);
            break;
        end
    end
end
disp('the centroid of B is :-');
disp(centro)
disp('this is it');
for j=1:s(2)
    if((centroid(2,j)< centro(2)+25) && (centroid(2,j)> centro(2)-25) && j~=i )
        disp(centroid(:,j))
        if(idx(j)==27)
            disp('go straight')
            info=1;
        elseif(idx(j)==28)
            disp('go right')
            info=2;
        elseif(idx(j)==29)
            disp('go back')
            info=3;
        elseif(idx(j)==30)
            disp('go left')
            info=4;
        end
    end
end        
    
end