# SAME-SUBJECT QC STEP 3
# Once the sagittal images have been created.
# Now we have to order the PNG files. 

# Read the txt files with info of the subject classification.
T2= data.frame(Subj= read.table('./timepoints2.txt', header= T, stringsAsFactors= F), G= "T2/")
T3= data.frame(Subj= read.table('./timepoints3.txt', header= T, stringsAsFactors= F), G= "T3/")
T4= data.frame(Subj= read.table('./timepoints4.txt', header= T, stringsAsFactors= F), G= "T4/")
colnames(T2)[1] <- colnames(T3)[1] <- colnames(T4)[1] <- "Subj"
allData= rbind(T2, T3, T4)


# Set the input directory where all the PNG are.
inDir= './mySagittalImages'
outDir= './myOutput'

fnames= list.files(path= inDir, full.names= T, recursive= F)

fsubs= sub('^.*Sagittal_View_', '', fnames)

# Get the names of the final files to only have "ADNI1.png" 
fsubs2= sub('^.*ADNI', 'ADNI', fsubs)
imNames= sub('_Slice_.*', '.png', fsubs2)

# Get the IDs of the subjects only
subIDs= sub('_.*', '', fsubs)



# Create the directories
dirNames= paste0(outDir, allData$G[match(subIDs, allData$Subj)], subIDs, '/')
lapply(unique(dirNames), dir.create)

# Create the names of the final files.
finNames= paste0(outDir, allData$G[match(subIDs, allData$Subj)], subIDs, '/', imNames)

# Copy the files from one path to the other.
file.copy(from= fnames, to= finNames)

