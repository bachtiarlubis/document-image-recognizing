function [line_out, line_rest] = projProf_Vertical(img, handles)
% clc;    % Clear the command window.
%close all;  % this should be commented because this line can triger-
%       set(handles.btn_Recognize.'enable','off') error
% clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
%format compact;
%format loose;
fontSize = 20;
global verticalPlot;
global dividingLinesPlot;
%grayImage =imread('D:\pcd\tester\Segmentation\data_test\ImageAnalyst\Adok_karo1_biner.jpg');
% grayImage =imread('D:\pcd\tester\Segmentation\data_test\dok1k.jpg');
%% Convert to gray scale
%     if size(img, 3) == 3 % RGB image
%         %areaOpeningImage=rgb2gray(areaOpeningImage);
%         img=img(:,:,2);
%         threshold = graythresh(img);
%         areaOpenImage = im2bw(img, threshold);
%     else
%          areaOpenImage = img;
%     end
%grayImage = img; 
% areaOpenImage = img; % new modified

% Show image
% figure(1) % new modified

% Enlarge figure to full screen.
% set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);   % just closed
% drawnow;
areaOpenImage = img;
% h1 = subplot(2, 12, 1:12); % original %  new modified
h1 = (handles.axes1);
axes(handles.axes1);
imshow(areaOpenImage); % grayImage was changed to areaOpenImage % just closed
%impixelinfo % just closed % new modified
%title('INPUT IMAGE WITH NOISE') % new modified
%axis('image', 'on'); % Display tick marks. % just closed % new modified
%title('Binary Image', 'FontSize', fontSize); % just closed % new modified

% Find out the areas of what we have.
props = regionprops(areaOpenImage, 'Area');
allAreas = sort([props.Area], 'Ascend')


%h2 = subplot(2, 12, 13:24); % just closed
% h2 = subplot(1,15,1:15); % new modified
% Find horizontal profile

verticalProfile = sum(areaOpenImage, 2);
verticalPlot = verticalProfile; % btnPlot variable

%plot(verticalProfile, 'b-'); % new modified% btnPlot output 1
%title('Horizontal Profile', 'FontSize', fontSize); % % new modifiedgrid on;
% Find dividing lines between the characters.
props = regionprops(verticalProfile == 0, 'Centroid');
%props = regionprops(horizontalProfile <= 1, 'Centroid'); % new modified
xyCentroids = [props.Centroid];
%dividingLines = xyCentroids(1:2:end)
dividingLines = xyCentroids(2:2:end);
dividingLinesPlot = dividingLines; % btnPlot variable
disp('xlim are :');
xl = xlim(h1); % h1 is changed to handles.h1
%yl = ylim(h2);  % h2 is changed to axes1 % new modified% btnPlot output
for k = 1 : length(dividingLines)
	thisX = dividingLines(k);
	%line(h1, [thisX, thisX], yl, 'Color', 'r');
	line(xl, [thisX, thisX], 'Parent', h1, 'Color', 'r'); % line on binary image % hi is changed to axes1
	%line(h2, [thisX, thisX], yl2, 'Color', 'r');
	%line([thisX, thisX], yl, 'Parent', h2,'Color', 'r'); % line on the profile plot % new modified% btnPlot output3
end
% Enlarge figure to full screen.
%set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
%drawnow;

% Extract each line.
% fontSize = 18;
% figure(2);% new modified

% Enlarge figure to full screen.
%set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
%drawnow;

% indexSubplot = (1:3);
% indexSubplot2 = (6:10);
% indexSubplot = 0;
global axSeq;


hSubplots = [];
for k = 1 : length(dividingLines)-1 % k = 1 : length(dividingLines)-1
	thisX = round(dividingLines(k));
	nextX = round(dividingLines(k+1));
    
	line_out = areaOpenImage(thisX:nextX,:); % a line on a document
    line_rest = areaOpenImage(nextX+1:end,:); % the rest of line
    %
    %new_img = line_rest; % as a new input
	%
    %h3 = subplot(12, 10, (1:5)+indexSubplot );% new modified
    %i = num2str(axSeq);
    %axes(handles.(['axes',i]));
    %imshow(line_out);
    if axSeq > 25
        i = num2str(25);
        axes(handles.(['axes',i]));
        imshow(line_out);
    else
        i = num2str(axSeq);
        axes(handles.(['axes',i]));
        imshow(line_out); 
    end
    %caption = sprintf('Line of #%d', lineNumber); % k was changed to lineNumber % new modified
    %title(caption, 'FontSize', 10); % new modified
    
%     indexSubplot = indexSubplot+5;
%  
%     subplot(3, 10, 1:10);
% 	imshow(line_out); 
%     caption = sprintf('The Line');
%     title(caption, 'FontSize', fontSize);
%     
%     subplot(3, 10, 11:30);
%     imshow(line_rest); 
%  	caption2 = sprintf('The Rest');
%  	title(caption2, 'FontSize', fontSize);
    
    %%Character Saparator
%{
%     horizontalProfile = sum(thisLetter, 1);
%     props2 = regionprops(horizontalProfile == 0, 'Centroid');
% 	xyCentroids2 = [props2.Centroid];
% 	dividingChar = xyCentroids2(1:2:end);
%     indexSub = 11;
%     hSubplots = [];
% 	for kk = 1 : length(dividingChar)-1
% 		thisX2 = round(dividingChar(kk));
% 		nextX2 = round(dividingChar(kk+1));
% 		h4 = subplot(4, 10, indexSub+kk);
% 		thisCharacter = thisLetter(:, thisX2:nextX2);
%         % cropping the pads
%         [f, c]=find(thisCharacter); % finding row(f) and column(c) indices
%         img_out=thisCharacter(min(f):max(f),min(c):max(c));%Cropping all pad of image
%         % end 
%         %
%         img_out = padarray(img_out, [1 1], 'both'); % padding the image by 1 on every sides.
%         img_out = imresize(img_out,[42, 24]); % resizing to be 42m x 24n
%         img_out = bwmorph(img_out, 'thin', Inf);%Image Thinning
%         %
% 		imshow(img_out);
% 		caption2 = sprintf('Character #%d', kk);
% 		title(caption2,'FontSize', fontSize);
%         %collecting all subplots' positions.
%         hSubplots = [hSubplots; h4];
%         %end
%     end
%     pause(0.5)
% %    delete(h4)
%     %%
% 	
% %      indexSubplot = (indexSubplot) + 3;
% %      indexSubplot2 = (indexSubplot2) + 10;
%     if k ~= length(dividingLines)-1 
%         delete(hSubplots); % to refresh all subplots in the figure 2.
%     end
%}
    %%End Character Separator
    
    pause(0.5);
    %hSubplots = [hSubplots, h3]; % new modified
%     indexSubplot = indexSubplot+5;
    
    %% this probably unused, because we are using axes instead subplot
    %{
    if h3 == subplot(5,10,46:50) && k ~= length(dividingLines)-1 
       delete(hSubplots);
       indexSubplot = 0;
    end
    %}
    if k == length(dividingLines)-1 % if loop already reach limit then..
        line_rest = []; % set new_img to empty
    end
    return; % return the value(line) to function projProf_Vertical after finded first value(line).
end

% Enlarge figure to full screen.
%set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
%drawnow;
end