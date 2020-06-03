% SAME-SUBJECT QC STEP 2
% This script is not the final one, but is interesting if you want 
%  to choose a certain slice (variable sct) to output as a PNG.
% It uses the function 'getSagittalPNG'.

%% Set the variables
% Subjects folder
FS_directory='/my/subjects/directory/';

% Select the Sagittal slice to use (1-256)
sct = 150; 

files = dir(char(strcat(FS_directory,'/*')));
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
a = files(dirFlags);
%% Run the function
%Choose this so that it selects only your subject folders that contain FS output
for x = 3:size(a,1)
    [c,b,d]=fileparts(a(x,1).name);
        getSagittalPNG(FS_directory, b, sct);
    display(['Done with subject: ', b, ': ', num2str(x-2), ' of ', num2str(size(a,1)-2)]);
end



