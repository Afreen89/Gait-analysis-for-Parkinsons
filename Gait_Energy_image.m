
clear;close all;

normal = dir('abnormal');    % main folder name. subfolders contain images

for k = 66:numel(normal)     % starting from 3 because dir generates '.' and '..' folders inside
    folders = normal(k).name;
    files = dir(strcat('abnormal/',folders));
    GEI=zeros(480,640);
    for j = 3:numel(files)         % traversing subfolder to collect images
        filename = files(j).name;
        I = imread(strcat('abnormal/',folders,'/',filename));
        I=double(I(:,:,1));
        GEI=GEI+I;
    end
    GEI=uint8(255*GEI/(max(max(GEI))));

    % cropping part %%%%%%%%%%

    left = 0;
    right = 0;
    top = 0;
    bottom = 0;
    %E = imread("327.jpg");
    for i = 1:width(GEI)
	    if max(GEI(:,i))>0
            left=i;
            break
    end
    end
    
    for i = left: width(GEI)
        if max(GEI(:,i))==0
		    right=i;
            break
        end
    end
    
    for j = 1: length(GEI)
        if max(GEI(j,:))>0
            top=j;
            break
        end
    end
    
    for j = top:length(GEI)
        if max(GEI(j,:))==0
            bottom = j;
            break
        end
    end

    % we are taking a width of 300 pixels
    h = bottom - top;
    w = right - left;
    sl = floor((300 - w) / 2);
    sr = 300 - (w + sl);
    GEIc = GEI(top-20:bottom+(280-h), left-sl:right+sr);
    GEIc = imresize(GEIc,0.212);

    %%%%%%%%%%%%%%%%%

    % image saving%%%
    foldername = fullfile(strcat('abnormal/',string(folders)));
    fullfilename= fullfile(foldername,strcat(string(folders),'.jpg'));
    maskfoldername = fullfile(strcat('abnormal_masks')); % /),string(folders)))
    maskfullfilename= fullfile(maskfoldername,strcat(string(folders),'.jpg'));
    
    % imwrite(GEIc,fulname)
    imwrite(GEIc, maskfullfilename)
end