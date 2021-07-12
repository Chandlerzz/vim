# todo shell script to count the lines if linecount >200, delete the first
# line
# todo count everypath 
lrcfilename=$1
lines=$(cat $lrcfilename  | wc -l)
if [ "$lines" -gt "200" ];
    then sed -i "1d" $lrcfilename;
fi
sort $lrcfilename | uniq -c > /tmp/lrccount
if [ -f "/tmp/lrccount1" ];
then rm /tmp/lrccount1;
fi

