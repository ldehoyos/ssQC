function getMaxSagittalPNG(dirOS,subjID)
%getSagittalPNG Create PNG from the mgz images of different subjects.
%   dirOS is the directory where all the subjects are then, the image will be looked at in mri/orig.mgz.
%   subjID is the name of the subject.
%   In this function "slice" does not have to be specified as this function
%   chooses the slice with the highest number of non-zero pixels.

% Read the image.
fID= [dirOS, subjID, '/mri/orig.mgz'];
[inputT1img, mr_parms, Mdc, volsz] =load_mgh(fID);

% Get the volumes for each view
Nx=volsz(1);
Ny=volsz(2);
Nz=volsz(3);

indexs=find(inputT1img~=0);
T1=zeros(Nx,Ny,Nz); T1(indexs)=inputT1img(indexs);

indx=find(T1~=0);
[x y z]=ind2sub([Nx Ny Nz],indx);

XminXmax = quantile(x,[0 1]) ;
YminYmax= quantile(y,[0 1]) ;
ZminZmax = quantile(z,[0 1]) ;

Xmin=max(XminXmax(1),3);Xmax=min(XminXmax(2),Nx-3);
Ymin=max(YminYmax(1),3);Ymax=min(YminYmax(2),Ny-3);
Zmin=max(ZminZmax(1),3);Zmax=min(ZminZmax(2),Nz-3);

T1=T1(Xmin-2:Xmax+2,Ymin-2:Ymax+2,Zmin-2:Zmax+2);

% Get the first slice with a non-zero value.
m0= 0;
s= 1;
while (m0 == 0)
    m= squeeze(T1(s, :, :));
    r= length(find(m~= 0));
    if (r ~= 0)
        m0= s;
    else
        s= s+1;
    end
end

% Get the last slice with a non-zero value.
m1= 0;
s= size(T1, 1);
while (m1 == 0)
    m= squeeze(T1(s, :, :));
    r= length(find(m~= 0));
    if (r ~= 0)
        m1= s;
    else
        s= s-1;
    end
end

slice= floor((m1+m0)/2);

% Get the saggital view
R= T1(slice, :, :); 
CT_S= squeeze(R);

% Plot the images
h=figure('Visible','off');
h(1)= imshow(CT_S, 'DisplayRange', [0 180]);
text('units','pixels','position',[3 -9],'BackgroundColor','r','fontsize',12,'string',subjID,'Interpreter','none')
hold off;
axis off;
saveas(gca,char(strcat(dirOS, 'Sagittal_View_', subjID, '_Slice_', num2str(slice),'.png')),'png')
close all;

end