function num_char = projProfile_Horizontal(areaOpeningImage)
    %% projProfile_Horizontal is used to separate text line image into characters based on its horizontal projection 
    % char_out : a character output.
    % num_char : number character in text line image.
    % L : labelled characters in a cropped image window, so that we know how many image
    %       in a cropped image window.
    % Ne : number of labelled object in a cropped image window
    %%
    %%
    % now our output purpose is as cell, which is contain all of our characters
    %   images in a line.
    % next solve are :
    %   
    %   3. Test the testRunning.m project once again -
    %      which is Beta Version of DetectAksara Recognition.
    %%
    
    clc;    % Clear the command window.
    %close all;  % Close all figures (except those of imtool.)
    % clear;  % Erase all existing variables. Or clearvars if you want.
    workspace;  % Make sure the workspace panel is showing.
    format long g;
    format compact;
    fontSize = 15;
    %areaOpeningImage =imread('D:\pcd\tester\Segmentation\data_test\ImageAnalyst\Adok_karo1_biner.jpg');
    % Show image
    f=figure(1);
    f.Name = 'Word Separating Process';
    f.NumberTitle ='off';
    subplot(6, 12, 1:12);
    imshow(areaOpeningImage);
    impixelinfo % original
    %title('INPUT IMAGE WITH NOISE') % original
    title('Cropped Line Image', 'FontSize',20) 
%     %% Convert to gray scale
%     if size(areaOpeningImage, 3) == 3 % RGB image
%         %areaOpeningImage=rgb2gray(areaOpeningImage);
%         areaOpeningImage=areaOpeningImage(:,:,2);
%         threshold = graythresh(areaOpeningImage);
%         binaryImage = im2bw(areaOpeningImage, threshold);
%     else
%          binaryImage = areaOpeningImage;
%     end
    
    %% Convert to binary image
    % threshold = graythresh(areaOpeningImage);
    % binaryImage = im2bw(areaOpeningImage, threshold);
    % % Remove all object containing fewer than 15 pixels
    % binaryImage = bwareaopen(binaryImage,5); % new modified
    % imshow(binaryImage);
    % axis('image', 'on'); % Display tick marks.
    % title('Binary Image', 'FontSize', fontSize);
    
    %% Find horizontal profile
    binaryImage = areaOpeningImage; % Area Opening Image is assumed euqal to binaryImage :D (just a name)
    h1 = subplot(6, 12, 13:24);
    imshow(binaryImage);
    axis('image', 'on'); % Display tick marks.
    title('Line To Letter', 'FontSize', fontSize);
    
    h2 = subplot(6, 12, 25:36);
    horizontalProfile = sum(binaryImage, 1);
    plot(horizontalProfile, 'b-');
    title('Horizontal Profile', 'FontSize', fontSize);
    grid on;
    %%
    
    %% Find dividing lines between the characters.
    props = regionprops(horizontalProfile == 0, 'Centroid'); %centroid of all gaps
    xyCentroids = [props.Centroid];
    dividingLines = xyCentroids(1:2:end); % so that get only the gaps centroid
    for k = 1 : length(dividingLines)
        thisX = dividingLines(k);
        %line(h1, [thisX, thisX], ylim(h1), 'Color', 'r');
        line([thisX, thisX], ylim(h1), 'Parent', h1, 'Color', 'r');
        %line(h2, [thisX, thisX], ylim(h2), 'Color', 'r');
        line([thisX, thisX], ylim(h2), 'Parent', h2, 'Color', 'r');
    end
    %%
    grid off;
    %% Enlarge figure to full screen.
    set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
    drawnow;
    %%
    
    %% Extract each letter.
    global hSubplots
    fontSize = 12;
    num_char = {};
    char_coord = 1;
    hSubplots =[];
    %% New Modified, doing opening morph
    %se = strel('square', 2);
    %%
    for kk = 1 : length(dividingLines) - 1
        
        thisX = round(dividingLines(kk));
        nextX = round(dividingLines(kk+1));
        h3 = subplot(6, 12, 37 + kk);
        thisLetter = binaryImage(:, thisX:nextX);
        %% New Modified, doing opening morph right before Unpads, addpads and so on
        % thisLetter = imopen(thisLetter, se);
        %%
        [L, Ne] = bwlabel(thisLetter);
        widthOfObject = length(find(L==2));
        if Ne == 2 && widthOfObject > 700% to detect wheater have 2 objecr or not in a window
            L1 = ismember(L, 1);
            L2 = ismember(L, 2);
            char_out1 = L1;
            char_out2 = L2;
            imshow(thisLetter);
            caption = sprintf('Letter #%d', k);
            title(caption, 'FontSize', fontSize);
            % Editing char_out1
            char_unpads = pads_crop(char_out1); 
            char_out1 = char_unpads;
%             char_out1 = padarray(char_out1, [2, 2], 'both'); % new modifi
            char_out1 = imresize(char_out1, [50 50]); % its as real
            %char_out1 = imresize(char_out1, [42 24]); % 
            % Editing char_out2
            char_unpads = pads_crop(char_out2);
            char_out2 = char_unpads;
            %char_out2 = padarray(char_out2, [2, 2], 'both'); % new modifie
            char_out2 = imresize(char_out2, [50 50]); % its as real
            %char_out2 = imresize(char_out2, [42 24]); % 
            % End Editing
            num_char{1, char_coord} = (char_out1); % storing all characters into cell
            char_coord = char_coord + 1; % plus the coordinat by 1
            num_char{1, char_coord} = (char_out2); % storing all characters into cell
            char_coord = char_coord + 1; % plus the coordinat by 1
            continue;% so that move to next character
        end
        
%%
        charact = thisLetter;
        char_unpads = pads_crop(charact);
        imshow(charact);
        caption = sprintf('Script #%d', kk);
        title(caption, 'FontSize', fontSize);
        char_out = char_unpads;
%         char_out = padarray(char_out, [2, 2], 'both'); % new modified
         char_out = imresize(char_out, [50 50]); % new size
%        char_out = imresize(char_out, [42 24]);
        %char_out is changed to charact for a while
        num_char{1, char_coord} = (char_out); % storing all characters into cell
        char_coord = char_coord + 1; % plus the coordinat by 1
        %break; % new editted, so that only take a word per line
        hSubplots = [hSubplots;h3];
        pause(0.005) % new modified
        
    end
    %if kk ~= length(dividingLines)-1
    %   delete(hSubplots);
    %end
    %% Showing all cell contents
%{
%     lengthOfChar = length(num_char);
%     figure(2)
%     %% Enlarge figure to full screen.
%     set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
%     drawnow;
    %%
%     for i = 1 : lengthOfChar
%         subplot(4, 6, 1+i-1);
%         imshow(num_char{1,i}); % imshow more happy if we call with this way than variable x (ie x = num_char{1,i});
%         caption = sprintf('Character %d', i);
%         title(caption, 'FontSize', 11);
%     end
    %%
%}
    
end

function img_out = pads_crop(thisCharacter)
    % cropping the pads
    [f, c]=find(thisCharacter); % finding row(f) and column(c) indices
    img_out=thisCharacter(min(f):max(f),min(c):max(c));%Cropping all pad of image
    % end 
end
	
%% Old Version
%{
function [char_out, num_char, L, Ne] = projProfile_Horizontal(areaOpeningImage)
    %% projProfile_Horizontal is used to separate text line image into characters based on its horizontal projection 
    % char_out : a character output.
    % num_char : number character in text line image.
    % L : labelled characters in a cropped image window, so that we know how many image
    %       in a cropped image window.
    % Ne : number of labelled object in a cropped image window
    %%
    %%
    % next solve are :
    %   1. How to show all cell image content using imshow 1 by 1.
    %   2. Don't forget to padarray our output in Recognition section.
    %   3. Test the DatectAksara.m project once again
    %%
    
    clc;    % Clear the command window.
    close all;  % Close all figures (except those of imtool.)
    % clear;  % Erase all existing variables. Or clearvars if you want.
    workspace;  % Make sure the workspace panel is showing.
    format long g;
    format compact;
    fontSize = 20;
    %areaOpeningImage =imread('D:\pcd\tester\Segmentation\data_test\ImageAnalyst\Adok_karo1_biner.jpg');
    % Show image
    figure(1)
    h1 = subplot(4, 12, 1:12);
    imshow(areaOpeningImage);
    impixelinfo
    title('INPUT IMAGE WITH NOISE')
    %% Convert to gray scale
    if size(areaOpeningImage, 3) == 3 % RGB image
        areaOpeningImage=rgb2gray(areaOpeningImage);
        threshold = graythresh(areaOpeningImage);
        binaryImage = im2bw(areaOpeningImage, threshold);
        imshow(binaryImage);
        axis('image', 'on'); % Display tick marks.
        title('Binary Image', 'FontSize', fontSize);

    end
    %% Convert to binary image
    % threshold = graythresh(areaOpeningImage);
    % binaryImage = im2bw(areaOpeningImage, threshold);
    % % Remove all object containing fewer than 15 pixels
    % binaryImage = bwareaopen(binaryImage,5); % new modified
    % imshow(binaryImage);
    % axis('image', 'on'); % Display tick marks.
    % title('Binary Image', 'FontSize', fontSize);
    
    %% Find horizontal profile
    binaryImage = areaOpeningImage; % Area Opening Image is assumed euqal to binaryImage :D (just a name)
    h2 = subplot(4, 12, 13:24);
    horizontalProfile = sum(binaryImage, 1);
    plot(horizontalProfile, 'b-');
    title('Horizontal Profile', 'FontSize', fontSize);
    grid on;
    %%
    
    %% Find dividing lines between the characters.
    props = regionprops(horizontalProfile == 0, 'Centroid'); %centroid of all gaps
    xyCentroids = [props.Centroid];
    dividingLines = xyCentroids(1:2:end); % so that get only the gaps centroid
    for k = 1 : length(dividingLines)
        thisX = dividingLines(k);
        %line(h1, [thisX, thisX], ylim(h1), 'Color', 'r');
        line([thisX, thisX], ylim(h1), 'Parent', h1, 'Color', 'r');
        %line(h2, [thisX, thisX], ylim(h2), 'Color', 'r');
        line([thisX, thisX], ylim(h2), 'Parent', h2, 'Color', 'r');
    end
    %%
    
    %% Enlarge figure to full screen.
    set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
    drawnow;
    %%
    
    %% Extract each letter.
    fontSize = 12;
    num_char = {};
    char_coord = 1; 
    for k = 1 : length(dividingLines) - 1
        thisX = round(dividingLines(k));
        nextX = round(dividingLines(k+1));
        subplot(4, 12, 24 + k);
        thisLetter = binaryImage(:, thisX:nextX);
        [L, Ne] = bwlabel(thisLetter);
%         for m = 1 : Ne
%             if Ne == 2
%                 L1 = ismember(L, 1);
%                 L2 = ismember(L, 2);
%                 char_out1 = L1;
%                 char_out2 = L2;
%                 imshow(thisLetter);
%                 caption = sprintf('Letter #%d', k);
%                 title(caption, 'FontSize', fontSize);        
%             end
%         end
        char_unpads = pads_crop(thisLetter);
        imshow(thisLetter);
        caption = sprintf('Letter #%d', k);
        title(caption, 'FontSize', fontSize);
        char_out = char_unpads;
        num_char{1, char_coord} = {num_char, char_out}; % storing all characters into cell
        char_coord = char_coord + 1; % plus the coordinat by 1
        %break; % new editted, so that only take a word per line
    end
    %%
end

function img_out = pads_crop(thisCharacter)
    % cropping the pads
    [f, c]=find(thisCharacter); % finding row(f) and column(c) indices
    img_out=thisCharacter(min(f):max(f),min(c):max(c));%Cropping all pad of image
    % end 
end
%}	