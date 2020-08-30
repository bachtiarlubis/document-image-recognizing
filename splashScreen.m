% create a figure that is not visible yet, and has minimal titlebar properties
fh = figure('Visible','off','MenuBar','none','NumberTitle','off');
% put an axes in it
ah = axes('Parent',fh,'Visible','off');
% put the image in it
load earth.mat
ih = image(X,'parent',ah);
colormap(map)
% set the figure size to be just big enough for the image, and centered at
% the center of the screen
imxpos = get(ih,'XData');
imypos = get(ih,'YData');
set(ah,'Unit','Normalized','Position',[0,0,1,1]);
figpos = get(fh,'Position');
figpos(3:4) = [imxpos(2) imypos(2)];
set(fh,'Position',figpos);
movegui(fh,'center')
% make the figure visible
set(fh,'Visible','on');
ht = timer('StartDelay',5,'ExecutionMode','SingleShot');
set(ht,'TimerFcn','close(fh);stop(ht);delete(ht)');
start(ht);