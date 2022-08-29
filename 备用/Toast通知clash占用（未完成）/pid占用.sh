pid=$(cat /data/clash/run/clash.pid)
info=$(top -p $pid -n 1 | grep $pid)
arr=(${info//[\s]+/})
#echo ${arr[@]}
xpedge -toast "Clash占用: "${arr[5]}
#arr[5]根据实际修改