#!/bin/bash
###### php��չ��װ
###### �������
server_install_log_path="/tmp/server_install.log"
date_show_str=`date '+%Y-%m-%d %H:%M:%S'`
phpize_path="/usr/local/php/bin/phpize"
php_config_path="/usr/local/php/bin/php-config"
php_ini_path="/usr/local/php/lib/php.ini"
igbinary_tar_gz="igbinary-2.0.1.tgz" 
igbinary_dir="igbinary-2.0.1" 
igbinary_name="igbinary" 
redis_server_tar_gz="redis-3.0.7.tar.gz" 
redis_server_dir="redis-3.0.7" 
redis_server_name="redis" 
redis_server_path="/usr/local/redis"
local_pwd=`pwd`
redis_tar_gz="redis-2.2.7.tgz" 
redis_dir="redis-2.2.7" 
redis_name="redis" 
ImageMagick_tar_gz="ImageMagick.tar.gz" 
ImageMagick_dir="ImageMagick-6.8.9-7" 
ImageMagick_name="ImageMagick" 
imagick_tar_gz="imagick-3.4.2.tgz" 
imagick_dir="imagick-3.4.2" 
imagick_name="imagick" 

##### igbinary��װ
if [ -e "${igbinary_tar_gz}" ]
then
	echo "${date_show_str} ----- ${igbinary_tar_gz}Դ���ļ����� -----"
	echo "${date_show_str} ----- ${igbinary_tar_gz}Դ���ļ����� -----" >> ${server_install_log_path}
	echo "${date_show_str} ----- ��ѹ${igbinary_tar_gz} -----"
	echo "${date_show_str} ----- ��ѹ${igbinary_tar_gz} -----" >> ${server_install_log_path}
	tar zxvf ${igbinary_tar_gz}
	cd ${igbinary_dir}
	##### phpize
	${phpize_path}
	./configure --with-php-config=${php_config_path}
	make && make install
	echo "extensions=igbinary.so" >> ${php_ini_path}
	echo "${date_show_str} ----- �ɹ���װigbinary -----"
	echo "${date_show_str} ----- �ɹ���װigbinary -----" >> ${server_install_log_path}
	##### ������һĿ¼
	echo "${date_show_str} ----- ������һĿ¼ -----"
	echo "${date_show_str} ----- ������һĿ¼ -----" >> ${server_install_log_path}
	cd ../
else
	echo "${date_show_str} ----- �����ϴ�${igbinary_tar_gz}Դ�� -----"
	echo "${date_show_str} ----- �����ϴ�${igbinary_tar_gz} -----" >> ${server_install_log_path}
fi

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
	##### ����redis  �Ȳ�Ҫ��������Ҫ�޸����òſ�������
	##### redis-server /etc/redis.conf
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

##### redis��װ
if [ -e "${redis_tar_gz}" ]
then
	echo "${date_show_str} ----- ${redis_tar_gz}Դ���ļ����� -----"
	echo "${date_show_str} ----- ${redis_tar_gz}Դ���ļ����� -----" >> ${server_install_log_path}
	echo "${date_show_str} ----- ��ѹ${redis_tar_gz} -----"
	echo "${date_show_str} ----- ��ѹ${redis_tar_gz} -----" >> ${server_install_log_path}
	tar zxvf ${redis_tar_gz}
	cd ${redis_dir}
	##### phpize
	${phpize_path}
	./configure --with-php-config=${php_config_path}
	make && make install
	echo "extensions=redis.so" >> ${php_ini_path}
	echo "${date_show_str} ----- �ɹ���װredis -----"
	echo "${date_show_str} ----- �ɹ���װredis -----" >> ${server_install_log_path}
	##### ������һĿ¼
	echo "${date_show_str} ----- ������һĿ¼ -----"
	echo "${date_show_str} ----- ������һĿ¼ -----" >> ${server_install_log_path}
	cd ../
else
	echo "${date_show_str} ----- �����ϴ�${redis_tar_gz}Դ�� -----"
	echo "${date_show_str} ----- �����ϴ�${redis_tar_gz} -----" >> ${server_install_log_path}
fi

##### ImageMagick����װ
if [ -e "${ImageMagick_tar_gz}" ]
then
	echo "${date_show_str} ----- ${ImageMagick_tar_gz}Դ���ļ����� -----"
	echo "${date_show_str} ----- ${ImageMagick_tar_gz}Դ���ļ����� -----" >> ${server_install_log_path}
	echo "${date_show_str} ----- ��ѹ${ImageMagick_tar_gz} -----"
	echo "${date_show_str} ----- ��ѹ${ImageMagick_tar_gz} -----" >> ${server_install_log_path}
	tar zxvf ${ImageMagick_tar_gz}
	cd ${ImageMagick_dir}
	./configure --prefix=/usr/local/${ImageMagick_name}
	make && make install
	echo "${date_show_str} ----- �ɹ���װImageMagick���� -----"
	echo "${date_show_str} ----- �ɹ���װImageMagick���� -----" >> ${server_install_log_path}
	##### ������һĿ¼
	echo "${date_show_str} ----- ������һĿ¼ -----"
	echo "${date_show_str} ----- ������һĿ¼ -----" >> ${server_install_log_path}
	cd ../
else
	echo "${date_show_str} ----- �����ϴ�${ImageMagick_tar_gz}Դ�� -----"
	echo "${date_show_str} ----- �����ϴ�${ImageMagick_tar_gz} -----" >> ${server_install_log_path}
fi

##### imagick��װ
if [ -e "${imagick_tar_gz}" ]
then
	echo "${date_show_str} ----- ${imagick_tar_gz}Դ���ļ����� -----"
	echo "${date_show_str} ----- ${imagick_tar_gz}Դ���ļ����� -----" >> ${server_install_log_path}
	echo "${date_show_str} ----- ��ѹ${imagick_tar_gz} -----"
	echo "${date_show_str} ----- ��ѹ${imagick_tar_gz} -----" >> ${server_install_log_path}
	tar zxvf ${imagick_tar_gz}
	cd ${imagick_dir}
	##### phpize
	${phpize_path}
	./configure --with-imagick=/usr/local/${ImageMagick_name}/
	make && make install
	echo "extensions=imagick.so" >> ${php_ini_path}
	echo "${date_show_str} ----- �ɹ���װimagick -----"
	echo "${date_show_str} ----- �ɹ���װimagick -----" >> ${server_install_log_path}
	##### ������һĿ¼
	echo "${date_show_str} ----- ������һĿ¼ -----"
	echo "${date_show_str} ----- ������һĿ¼ -----" >> ${server_install_log_path}
	cd ../
else
	echo "${date_show_str} ----- �����ϴ�${imagick_tar_gz}Դ�� -----"
	echo "${date_show_str} ----- �����ϴ�${imagick_tar_gz} -----" >> ${server_install_log_path}
fi

##### kill������
pkill -9 -f "php-fpm"
##### ��������
/etc/init.d/php-fpm