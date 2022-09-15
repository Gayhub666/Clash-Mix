#-----------此脚本只与aria有关，原clash模块中本文件为空------
#程序路径
aria2="/data/clash/aria2/bin/aria2c"
lighttpd="/data/clash/aria2/bin/lighttpd"
aria2conf="/data/clash/aria2/etc/aria2.conf"
lighttpdconf="/data/clash/aria2/etc/lighttpd.conf"

#启动程序
$lighttpd -f $lighttpdconf
$aria2 --conf-path=$aria2conf -D

#联网更新bt-tracker
while true;
do
wget -O /dev/null www.baidu.com > /dev/null 2>&1
if [ $? -eq 0 ];then
/data/adb/magisk/busybox sed -i '/bt-tracker=/d' $aria2conf | echo "bt-tracker=`/data/adb/magisk/busybox wget --no-check-certificate -qO- https://cdn.jsdelivr.net/gh/ngosang/trackerslist@master/trackers_all_ip.txt | /data/adb/magisk/busybox awk NF | /data/adb/magisk/busybox sed ":a;N;s/\n/,/g;ta"`" >>$aria2conf
break
else
sleep 3
fi
done