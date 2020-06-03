#!/bin/bash
#$ -S /bin/bash

###### SAME-SUBJECT QC STEP 4
###### no need to edit this script
###### to run >> cd {scriptdir} (where scriptdir is the directory of this script)
###### to run >> chmod 777 make_webpage_3timepoints.sh
###### to run >> ./make_webpage_3timepoints.sh ${dirO}  (where $dirO is the output directory specified for the Matlab script)

QC_directory=$1
cd $QC_directory
subject_list=`ls -d */`

echo "<html>" 												>  Subject03_QC.html
echo "<head>"                                                   >> Subject03_QC.html
echo "<style type=\"text/css\">"								>> Subject03_QC.html
echo "*"                                                        >> Subject03_QC.html
echo "{"														>> Subject03_QC.html
echo "margin: 0px;"												>> Subject03_QC.html
echo "padding: 0px;"											>> Subject03_QC.html
echo "}"														>> Subject03_QC.html
echo "html, body"												>> Subject03_QC.html
echo "{"														>> Subject03_QC.html
echo "height: 100%;"											>> Subject03_QC.html
echo "}"														>> Subject03_QC.html
echo "</style>"													>> Subject03_QC.html
echo "</head>"													>> Subject03_QC.html

echo "<body>" 													>>  Subject03_QC.html


for sub in ${subject_list};
do
echo "<table cellspacing=\"1\" style=\"width:1500px;background-color:#FFFFFF;\">"				>> Subject03_QC.html
echo "<tr>"																					>> Subject03_QC.html
echo "<td> <FONT COLOR=BLACK FACE=\"Geneva, Arial\" SIZE=5> $sub </FONT> </td>"             >> Subject03_QC.html
echo "</tr>"                                                                                >> Subject03_QC.html
echo "<tr>"                                                                                 >> Subject03_QC.html
echo "<td><a href=\"file:"$sub"/ADNI1.png\"><img src=\""$sub"/ADNI1.png\" width=\"500px\" ></a></td>"	>> Subject03_QC.html
echo "<td><a href=\"file:"$sub"/ADNI2.png\"><img src=\""$sub"/ADNI2.png\" width=\"500px\" ></a></td>"	>> Subject03_QC.html
echo "<td><a href=\"file:"$sub"/ADNI3.png\"><img src=\""$sub"/ADNI3.png\" width=\"500px\" ></a></td>"	>> Subject03_QC.html
echo "</tr>"																				>> Subject03_QC.html
echo "</table>"                                                                             >> Subject03_QC.html
done;

echo "</body>"                                                                              >> Subject03_QC.html
echo "</html>"                                                                              >> Subject03_QC.html


