%{
path = 'D:\Books\Image\Data_Training\a_new\karo';
type = '*.bmp';
imageFile = dir([path type]);
nFiles = length(imageFile);

if( ~exist(path, 'dir') || nFiles < 1)
	disp('Directry not found or no matching images found !');
end

Seq{nFiles, 1} = [];
for i : nFiles
	Seq{d} = imread([path imageFile(i).name]);
	BW = ~im2bw(Seq{d});
	%imwrite(BW,'D:\Books\Image\Data_Training\a_new\karo\',currentFilename,num2str(i);,'.bmp');
end
%}
myFolder = 'D:\pcd\KARO1\Info\toba'; % INPUT PATH
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage)); % uiwait  block the execution of the program file and restrict user interaction to the dialog only
  return; %returns control to the invoking function
end
filePattern = fullfile(myFolder, '*.bmp');
Files = dir(filePattern);
nFiles = length(Files);
for k = 1:nFiles
  baseFileName = Files(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  [folder, fileName, extension] = fileparts(fullFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  BW = ~im2bw(imageArray);
  imshow(BW);
  fprintf(1, 'Now saving %s\n', fullFileName);
  
  %imwrite(BW, 'D:\Books\Image\Data_Training\a_new\karo\new',baseFileName);
  %nameF = strcat('D:\pcd\KARO1\Info\mandailing\bw\',fileName,'-',num2str(k),'.bmp');
  nameF = strcat('D:\pcd\KARO1\Info\toba\bw\new_',fileName,'.bmp'); % OUTPUT PATH
  imwrite(BW, nameF);
  %imshow(imageArray);  % Display image.
  drawnow; % Force display to update immediately.
end
h = msgbox('proses successed !', 'Nice One !');
pause(4);close all;