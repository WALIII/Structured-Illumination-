% SortMovies moves all the movies we made, into the right folder.
% We named them p(plane)_(z-step) so p3_4 is the 3rd gratting type, on the
% 4th zaxis step



mov_listing=dir(fullfile(pwd,'*.tif'));
mov_listing={mov_listing(:).name};
filenames=mov_listing;


disp('Sorting .tif movies');

[nblanks formatstring]=fb_progressbar(100);
fprintf(1,['Progress:  ' blanks(nblanks)]);


for i=1:length(mov_listing)
    
    clear b;
   [path,file,ext]=fileparts(filenames{i});
   b = file(numel(file) - 1:numel(file)); a = b;
   c = file(1:2); 
   
   
   
   path01 = '/Users/ARGO/Dropbox/Shared/w: others/Will2AB/Structured Illumination/Beads/TEST/';
   path02 = strcat(path01,b,'/');
   fileN = strcat(file,ext);
   mkdir(path02) % make the new DIR
   copyfile(fileN,path02) % move the file 
   cd(path02)
     oldname = fileN;
     newname = strcat(c,ext);
   movefile(oldname,newname) % change the name
   cd(path01);
end
   
   
   