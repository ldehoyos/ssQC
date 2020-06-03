% SAME-SUBJECT QC STEP 2
%
% It uses the function 'getMidSagittalPNG'.
% This function detects the first and last slices with non-zero data.
%  Then, the slice chosen is the one that is in the middle of both, which will
%  be the most medial. 


%% Set the variables
% Subjects folder
FS_directory='/my/subjects/directory/';

% Get the directory names
files = dir(char(strcat(FS_directory,'/*')));
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
a = files(dirFlags);



%% Run the function
%Choose this so that it selects only your subject folders that contain FS output
for x = 3:size(a,1)
    [c,b,d]=fileparts(a(x,1).name);
        getMidSagittalPNG(FS_directory, b);
    display(['Done with subject: ', b, ': ', num2str(x-2), ' of ', num2str(size(a,1)-2)]);
end
