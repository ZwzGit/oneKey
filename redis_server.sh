#!/bin/bash
###### redis����װ ��װ�����ֱ����Է������
###### ������� �����޸���鿴redis/redis.txt
redis_server_tar_gz="redis-3.0.7.tar.gz" 
redis_server_dir="redis-3.0.7" 
redis_server_name="redis" 
redis_server_path="/usr/local/redis"
local_pwd=`pwd`

##### redis_server��װ
if [ -e "${redis_server_tar_gz}" ]
then
	echo "${date_show_str} ----- ${redis_server_tar_gz}Դ���ļ����� -----"
	echo "${date_show_str} ----- ${redis_server_tar_gz}Դ���ļ����� -----" >> ${server_install_log_path}
	echo "${date_show_str} ----- ��ѹ${redis_server_tar_gz} -----"
	echo "${date_show_str} ----- ��ѹ${redis_server_tar_gz} -----" >> ${server_install_log_path}
	tar zxvf ${redis_server_tar_gz}
	cp -r ${redis_server_dir} ${redis_server_path} 
	cd ${redis_server_path}
	make && make install
	cp redis.conf /etc/
	##### ��redis��ӵ���������  
	echo "/usr/local/bin/redis-server /etc/redis.conf" >> /etc/rc.d/rc.local
	##### ����redis  
	redis-server /etc/redis.conf
	echo "${date_show_str} ----- �ɹ���װredis_server -----"
	echo "${date_show_str} ----- �ɹ���װredis_server -----" >> ${server_install_log_path}
	##### ������һĿ¼
	echo "${date_show_str} ----- ������һĿ¼ -----"
	echo "${date_show_str} ----- ������һĿ¼ -----" >> ${server_install_log_path}
	cd ${local_pwd}
else
	echo "${date_show_str} ----- �����ϴ�${redis_server_tar_gz}Դ�� -----"
	echo "${date_show_str} ----- �����ϴ�${redis_server_tar_gz} -----" >> ${server_install_log_path}
fi