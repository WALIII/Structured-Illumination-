
% Make mean/ave projection for all .mov files in folder

mov_listing=dir(fullfile(pwd,'*.mov'));
mov_listing={mov_listing(:).name};
filenames=mov_listing;


disp('Creating .tif movies');

[nblanks formatstring]=fb_progressbar(100);
fprintf(1,['Progress:  ' blanks(nblanks)]);

for i=1:length(mov_listing)
clear video;
clear v;
clear I;

    [path,file,ext]=fileparts(filenames{i});
	fprintf(1,formatstring,round((i/length(mov_listing))*100));
v = VideoReader(filenames{i});


for i = 1:40
video = read(v,i);
I(:,:,i) = rgb2gray(video(:,:,:));
end


v2 = mean(I,3);

fileN = strcat(file,'.tif');
v2 = uint8(v2);
imwrite(v2,fileN);


end
