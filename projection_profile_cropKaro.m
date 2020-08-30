function [char_out, thisLetter] = projection_profile_cropKaro(handles)

    %% Note
    % handles just added for a test progress
    %%
    clc;    % Clear the command window
    workspace;  % Make sure the workspace panel is showing.
    format long g;
    %format compact;
    %format loose;
    fontSize = 20;
    
    %don't intialize variables before "clear" function
    global caption;
    global hSubplots;
%     global indexSave; % new modified
    
%    grayImage =imread('D:\pcd\tester\Segmentation\data_test\1.Pakpak_e.jpg');
     grayImage =imread('D:\pcd\tester\TemplateMatching\Input dokumen batak\dokumen karo\dok_karo1.jpg'); % dok1k.jpg has been changed to this image

    % % Show image
%     figure(1); % new modified
    
    % Enlarge figure to full screen.
%     set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
%     drawnow;
    
%     h1 = subplot(2, 12, 1:12);
    h1 = handles.axes1;
    axes(handles.axes1);
    imshow(grayImage);
    impixelinfo
    title('INPUT IMAGE WITH NOISE')

    %% Convert to gray scale
    if size(grayImage, 3) > 1 % RGB image
        grayImage=grayImage(:,:,2);
    end
%     if size(grayImage, 3) == 3 % RGB image
%         grayImage=rgb2gray(grayImage);
%     end
    %% Convert to binary image
    threshold = graythresh(grayImage);
    binaryImage = ~im2bw(grayImage, threshold); % modified by add ~
    imshow(binaryImage,[]);
    % Remove all object containing fewer than 15 pixels
    binaryImage = bwareaopen(binaryImage,22); % value is increased acccording to our new image input is higher than earlier
    %binaryImage = imopen(binaryImage, strel('square', 2));
    imshow(binaryImage, []);
    axis('image', 'on'); % Display tick marks.
    title('Binary Image', 'FontSize', fontSize);

    % Find out the areas of what we have.
    props = regionprops(binaryImage, 'Area');
    allAreas = sort([props.Area], 'Ascend');
    % allAreas
    
    % Find horizontal profile
%     h2 = subplot(2, 12, 13:24); % New modified
    % horizontalProfile = sum(binaryImage, 1);
    verticalProfile = sum(binaryImage, 2);

%     plot(verticalProfile, 'b-'); % new modified
%     title('Vertical Profile', 'FontSize', fontSize); % new modified
    grid on;
    % Find dividing lines between the characters.
    props = regionprops(verticalProfile == 0, 'Centroid');
    %props = regionprops(horizontalProfile <= 1, 'Centroid'); % new modified
    xyCentroids = [props.Centroid]; % the array format is [column_centroid, row_centroids] type float
    %dividingLines = xyCentroids(1:2:end)
    dividingLines = xyCentroids(2:2:end);
    %disp('xlim are :');
    xl = xlim(h1);
%     yl = ylim(h2); % new modified
    for k = 1 : length(dividingLines)
        thisX = dividingLines(k);
        %line(h1, [thisX, thisX], yl, 'Color', 'r');
        line(xl, [thisX, thisX], 'Parent', h1, 'Color', 'r'); % line on binary image
        %line(h2, [thisX, thisX], yl2, 'Color', 'r');
%         line([thisX, thisX], yl, 'Parent', h2,'Color', 'r'); % line on the profile plot % new modified
    end
    grid off;
    
%     figure(2); % new modified
    %Enlarge figure to full screen.
%     set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
%     drawnow;

    % Extract each line.
%     indexSave = []; % new modified
    indexSubplot = (1:5);
%     global saveCaption;
%     global panhanAxes;
    saveCaption = 1;
    ax = 2; % initializing of handles.axes'ax'
%     panHandle = uipanel; % new added
    for k = 1 : length(dividingLines)-1
        thisX = round(dividingLines(k));
        nextX = round(dividingLines(k+1));
        %subplot(20, 12, indexSubplot);
%         rowLineSubs = ceil((length(dividingLines)-1)/2); % new added
        %subplot(rowLineSubs, 10, indexSubplot ); % 12 has been changed to rowLineSubs
        thisLetter = binaryImage(thisX:nextX, :);

        %[L, numbObject] = bwlabel(thisLetter);

%         subplot(12,10,indexSubplot);
        i = num2str(ax);
        axes(handles.(['axes',i]));
        imshow(thisLetter);
        caption = sprintf('Line #%d', k); % new modified
%         title(caption, 'FontSize', 12);
%         guidata(hObject, handles);
        ax = ax+1;
        
        pause(0.5)
        
        %% Cropping Lines into Character
        char_out = horizontal_profile(thisLetter);
        %% End 
   
       
        saveCaption = saveCaption + 1;
         pause(0.5);
        %%

    %      indexSubplot = (indexSubplot) + 3;
    %      indexSubplot2 = (indexSubplot2) + 10;
        if k ~= length(dividingLines)-1 % delete hSubplots if k is not euqal to limit loop
            delete(hSubplots); % to refresh all subplots in the figure 2.
        end
        indexSubplot = indexSubplot + 5;
        figure(2);% back to figure(2)
        if k == length(dividingLines)-1
            figure(3); % show figure(3) when the loop reach the limit loop
        end
        
    end
    msgbox('All Characters are successfully Cropped !','Finished !');
    
end

%%
function char_crop = horizontal_profile(img_letters)

    global caption; % line caption
    global hSubplots; % character's subplots container
    global indexSave; % new modified
    global saveCaption; % sequence of line caption for file saving

    line_in = img_letters;
   
%     % Enlarge figure to full screen.
%     set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
%     drawnow;
    
    figure(3);
    % Enlarge figure to full screen.
    set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
    drawnow;
    
    % figure(2)
    h1 = subplot(4, 12, 1:12);
    imshow(line_in);
    title(caption,'FontSize',20);
    impixelinfo
    % Find horizontal profile
    h2 = subplot(4, 12, 13:24);
    horizontalProfile = sum(line_in, 1);
    %end
    plot(horizontalProfile, 'b-');
    title('Horizontal Profile', 'FontSize', 20);
    grid on;
    % Find dividing lines between the characters.
    props2 = regionprops(horizontalProfile == 0, 'Centroid');
    %props = regionprops(horizontalProfile <= 1, 'Centroid'); % new modified
    xyCentroids2 = [props2.Centroid];
    %dividingLines = xyCentroids(1:2:end)
    dividingChar = xyCentroids2(1:2:end);
    % disp('ylim are :');
    yl = ylim(h1);
    yl2 = ylim(h2);
    for k = 1 : length(dividingChar)
        thisX = dividingChar(k);
        %line(h1, [thisX, thisX], yl, 'Color', 'r');
        line([thisX, thisX], yl, 'Parent', h1, 'Color', 'r'); % line on binary image
        %line(h2, [thisX, thisX], yl2, 'Color', 'r');
        line([thisX, thisX], yl2, 'Parent', h2,'Color', 'r'); % line on the profile plot
    end
    grid off;
    
    pause(0.05); % 
    
    %char_coord = 1; % index of characters in a num_char{} cell
    %num_char = {}; % separated characters container
    saveCharSeq = 1; % the sequence of characters for file saving 
    hSubplots = []; % correct 
    %hSubplots = {}; % new modified
    %indexSave = []; % new modified
    for kk = 1 : length(dividingChar)-1
        thisX2 = round(dividingChar(kk));
        nextX2 = round(dividingChar(kk+1));
        %h3 = subplot(4, 12, indexSub+kk);
        h3 = subplot(4, 12, 24+kk);
        thisCharacter = line_in(:, thisX2:nextX2);
       
        %% to separate uncontigous images in a window
%
        [L, Ne] = bwlabel(thisCharacter);
        firstObjWidth = length(find(L==2));
        % number of uncontigous images in a window selection
        % to detect wheter have 2 object or more than 3 in a window
        if  (Ne==2) && (firstObjWidth > 700) % %700 was changed to 600 
            L1 = ismember(L, 1);
            L2 = ismember(L, 2);
            char_out1 = L1;
            char_out2 = L2;
            imshow(thisCharacter);
            caption = sprintf('Letter #%d', k);
            title(caption, 'FontSize', 12);
            
            % Editing char_out1
            char_unpads = pads_crop(char_out1); 
            char_out1 = char_unpads;
            char_out1 = padarray(char_out1, [2, 2], 'both');
            char_crop1 = imresize(char_out1, [50 50]); % its as real
            %char_crop1 = char_out1;
            % char_out1 = imresize(char_out1, [10 10]); % testing size
            
            % Editing char_out2
            char_unpads = pads_crop(char_out2);
            char_out2 = char_unpads;
            char_out2 = padarray(char_out2, [2, 2], 'both');
            char_crop2 = imresize(char_out2, [50 50]); % its as real
            %char_crop2 = char_out2;
            % char_out2 = imresize(char_out2, [10 10]); % testing size
            % End Editing
            
            % file saveing
            filename1 = sprintf('%d_Character-%d.bmp', saveCaption,saveCharSeq); % new modified. indexSaveLength has been changed to kk
            filename2 = sprintf('%d_Character-%d.bmp', saveCaption,saveCharSeq+1);
            folder = 'D:\pcd\tester\Segmentation\data_test\profileSave\';
            savePath1 = strcat(folder, filename1);
            savePath2 = strcat(folder, filename2);
            imwrite(char_crop1,savePath1); % save first char
            imwrite(char_crop2,savePath2); % save second char
            saveCharSeq = saveCharSeq + 2; % the sequence of croped char for file saving
            % end
            
            % Storing all characters into a cell array
            %num_char{1, char_coord} = (char_crop1); % storing all characters into cell
            %char_coord = char_coord + 1; % plus the coordinat by 1
            %num_char{1, char_coord} = (char_crop2); % storing all characters into cell
            %char_coord = char_coord + 1; % plus the coordinat by 1
            % end Storing
            
            hSubplots = [hSubplots; h3]; % to store characters' subplots
            continue;% so that move to next character
        end
%}        
       %% end separating process
       
        % cropping the pads
        img_out = pads_crop(thisCharacter); % MY FUNCTION SELF
        % end 
        %
        char_crop = padarray(img_out, [2 2], 'both'); % padding the image by 1 on every sides.
%       char_crop = imresize(char_crop,[42, 24]); % resizing to be 42m x 24n
        char_crop = imresize(char_crop,[50, 50]); % resizing to be 50m x 50n
        %char_crop = img_out;
        %%
        %char_crop = imclose(char_crop,strel('square',2)); % new modified
        %%
        %char_crop = bwmorph(char_crop, 'thin', Inf);%Image Thinning
        %
        imshow(char_crop);
        caption2 = sprintf('Character #%d', kk);
        title(caption2,'FontSize', 12);
        %collecting all subplots' positions.
        %hSubplots{kk} = {hSubplots, h3}; % new modified
         hSubplots = [hSubplots; h3]; % correct
        %end
        
        %% save file (New Modified)
        indexSave = [indexSave, kk];
        indexSaveLength = length(indexSave);
        %filename = sprintf('Character-%d.bmp', kk);
        %filename = sprintf('%d_Character-%d.bmp', saveCaption,kk); % new modified. indexSaveLength has been changed to kk
        filename = sprintf('%d_Character-%d.bmp', saveCaption,saveCharSeq); % testing saveCharSeq variable
        folder = 'D:\pcd\tester\Segmentation\data_test\profileSave\';
        savePath = strcat(folder, filename);
        imwrite(char_crop,savePath); % new modified
        saveCharSeq = saveCharSeq+1;
        %%end
    end
     pause(0.01);
end

function img_out = pads_crop(thisCharacter)
    % cropping the pads
    [f, c]=find(thisCharacter); % finding row(f) and column(c) indices
    img_out=thisCharacter(min(f):max(f),min(c):max(c));%Cropping all pad of image
    % end 
end
% % Enlarge figure to full screen.
% set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
% drawnow;
