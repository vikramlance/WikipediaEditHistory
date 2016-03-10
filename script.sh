#!/bin/sh 
#set -x
filename=$1 
a=1 
new_filename=$2 
#filename=deletions.csv-0000$num-of-00020
while read line 
do
c_create_time=`cut -d, -f1 <<<$line` 
c_new_date=`cut -c1-10 <<<$c_create_time` 
c_final_date=`date -d @$c_new_date +%d%m%Y%H%M%S`
c_dd=`cut -c1-2 <<<$c_final_date` 
c_mm=`cut -c3-4 <<<$c_final_date` 
c_yyyy=`cut -c5-8 <<<$c_final_date` 
c_hh=`cut -c9-10 <<<$c_final_date` 
c_min=`cut -c11-12 <<<$c_final_date` 
c_sec=`cut -c13-14 <<<$c_final_date`
d_create_time=`cut -d, -f3 <<<$line` 
d_new_date=`cut -c1-10 <<<$d_create_time` 
d_final_date=`date -d @$d_new_date +%d%m%Y%H%M%S`
d_dd=`cut -c1-2 <<<$d_final_date` 
d_mm=`cut -c3-4 <<<$d_final_date` 
d_yyyy=`cut -c5-8 <<<$d_final_date` 
d_hh=`cut -c9-10 <<<$d_final_date` 
d_min=`cut -c11-12 <<<$d_final_date` 
d_sec=`cut -c13-14 <<<$d_final_date`
if [ "$a" == "1" ]; then 
echo "$c_dd,$c_mm,$c_yyyy,$c_hh,$c_min,$c_sec,$d_dd,$d_mm,$d_yyyy,$d_hh,$d_min,$d_sec,$line" > $new_filename 
else 
echo "$c_dd,$c_mm,$c_yyyy,$c_hh,$c_min,$c_sec,$d_dd,$d_mm,$d_yyyy,$d_hh,$d_min,$d_sec,$line" >> $new_filename 
fi 
a=$(( $a+1 ))
#sed -e "s/$create_time/$final_date/g" $filename > filename
#mv filename $filename
done <"$filename"

