#!/bin/bash
#$ -S /bin/bash

###### SAME-SUBJECT QC STEP 4
###### no need to edit this script
###### to run >> cd {scriptdir} (where scriptdir is the directory of this script)
###### to run >> chmod 777 make_webpage_4timepoints.sh
###### to run >> ./make_webpage_4timepoints.sh ${dirO}  (where $dirO is the output directory specified for the Matlab script)

QC_directory=$1
cd $QC_directory
subject_list=`ls -d */`

echo "<html>" 												> Subject04_QC.html
echo "<head>"                                                   >>Subject04_QC.html
echo "<style type=\"text/css\">"								>>Subject04_QC.html
echo "*"                                                        >>Subject04_QC.html
echo "{"														>>Subject04_QC.html
echo "margin: 0px;"												>>Subject04_QC.html
echo "padding: 0px;"											>>Subject04_QC.html
echo "}"														>>Subject04_QC.html
echo "html, body"												>>Subject04_QC.html
echo "{"														>>Subject04_QC.html
echo "height: 100%;"											>>Subject04_QC.html
echo "}"														>>Subject04_QC.html
echo "</style>"													>>Subject04_QC.html
echo "</head>"													>>Subject04_QC.html

echo "<body>" 													>> Subject04_QC.html


for sub in ${subject_list};
do
echo "<table cellspacing=\"1\" style=\"width:2000px;background-color:#FFFFFF;\">"				>>Subject04_QC.html
echo "<tr>"																					>>Subject04_QC.html
echo "<td> <FONT COLOR=BLACK FACE=\"Geneva, Arial\" SIZE=5> $sub </FONT> </td>"             >>Subject04_QC.html
echo "</tr>"                                                                                >>Subject04_QC.html
echo "<tr>"                                                                                 >>Subject04_QC.html
echo "<td><a href=\"file:"$sub"/ADNI1.png\"><img src=\""$sub"/ADNI1.png\" width=\"500px\" ></a></td>"	>>Subject04_QC.html
echo "<td><a href=\"file:"$sub"/ADNI2.png\"><img src=\""$sub"/ADNI2.png\" width=\"500px\" ></a></td>"	>>Subject04_QC.html
echo "<td><a href=\"file:"$sub"/ADNI3.png\"><img src=\""$sub"/ADNI3.png\" width=\"500px\" ></a></td>"	>>Subject04_QC.html
echo "<td><a href=\"file:"$sub"/ADNI4.png\"><img src=\""$sub"/ADNI4.png\" width=\"500px\" ></a></td>"	>>Subject04_QC.html
echo "</tr>"																				>>Subject04_QC.html
echo "</table>"                                                                             >>Subject04_QC.html
done;

echo "</body>"                                                                              >>Subject04_QC.html
echo "</html>"                                                                              >>Subject04_QC.html


