# SAME-SUBJECT QC STEP 1
# This script lists all the "orig.mgz" files of the subjects and outputs them to "outDir" 
#  in the same folders as the subject they belong to. 

# Set working directory
setwd("D:/kcl/Lucia_EUGEI/4_EUGEI/")

# Set the output directory
outDir= "D:/kcl/Lucia_EUGEI/origFiles/"

# Get the files orig.mgz from all the subjects
A= list.files(pattern = 'orig.mgz', recursive = T, full.names = T)

# Get all the subject names
B= sub("/mri/orig.mgz", "", sub(".*5EU", "5EU", A))

for (i in 1:length(A)){
  # Create a directory for each subject
  dir.create(path = paste0(outDir, B[i]))
  
  # Copy the orig.mgz file into the new directory
  file.copy(from = A[i], to = paste0(outDir, B[i]))
}
