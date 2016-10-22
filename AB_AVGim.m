
% Load in videos, and make single tif averages for SIM
% Run in the directory with the .mov files
% WAL3, 10.21.16


mov_listing=dir(fullfile(pwd,'*.mov'));
mov_listing={mov_listing(:).name};



filenames=mov_listing;

for i=1:length(mov_listing)

    
    [path,file,ext]=fileparts(filenames{i});

    FILE = fullfile(pwd,mov_listing{i})
    vidObj = VideoReader(FILE);
    
    
vidHeight = vidObj.Height;
vidWidth = vidObj.Width;
    
k = 1;
while hasFrame(vidObj)
    temp = readFrame(vidObj);
    Video(:,:,k) = rgb2gray(temp);
    k = k+1;
end

P = mean(Video(:,:,1:3),3);


imwrite(uint8(P),strcat(path,file,'_','processed','.tif'));
clear Video; clear c;
end

    
    