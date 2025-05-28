
#print 1 2 and 3 fields using the ', ' separator
gawk -F',' '{print $1 $2 "\t" $3}' temp.txt
#Prepend each line with \n except the first when printing
#$0 means all fields
gawk -F', ' 'BEGIN { OFS="\n"}; {$1=$1; print $0}' temp.txt
