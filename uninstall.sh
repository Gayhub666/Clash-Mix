Clash_data_dir="/data/clash"
Clash_delete_dir="/data/clash.delete"

rm_data() {
    mv ${Clash_data_dir} ${Clash_delete_dir}
    rm -rf ${Clash_data_dir}
    rm -rf /data/adb/service.d/clash_service.sh
    rm -rf /data/data/xyz.chz.clash/
}

rm_data

#aria相关
killall -9 aria2c >/dev/null 2>&1
killall -9 lighttpd >/dev/null 2>&1