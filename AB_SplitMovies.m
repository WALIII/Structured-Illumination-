function AB_SplitMovies


  mov_listing=dir(fullfile(pwd,'*.mat')); % Get all .mat file names
  mov_listing={mov_listing(:).name};
  filenames=mov_listing;


  for  iii = 1:length(mov_listing)
        clear mov_data_aligned; clear mov_data1; clear mov_data2; clear mov_data3; % Clear out remining buffer...
       [path,file,ext]=fileparts(filenames{iii});
           load(fullfile(pwd,mov_listing{iii}),'video');
           mov_data = video.frames;
            counter1 = 1;
            counter2 = 1;
           for iiv = 1:size(mov_data,2) % Load in data
             if iiv<15
             mov_data1(:,:,iiv) = rgb2gray(mov_data(iiv).cdata(:,:,:)); % convert to
           elseif iiv> 16& iiv<60
             mov_data2(:,:,counter1) = rgb2gray(mov_data(iiv).cdata(:,:,:)); % convert to
             counter1 = counter1+1;
           else
             mov_data3(:,:,counter2) = rgb2gray(mov_data(iiv).cdata(:,:,:)); % convert to
             counter2 = counter2+1;
           end
         end

           SIM_Images{iii}(:,:,1) =  mean(mov_data1(:,:,:),3);
           SIM_Images{iii}(:,:,2) =  mean(mov_data2(:,:,:),3);
           SIM_Images{iii}(:,:,3) =  mean(mov_data3(:,:,:),3);

       end
            save('SIM_Images','SIM_Images');
