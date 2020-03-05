#
#Hades 安装脚本 
#by pOny@moresec
#
apt-get update
apt-get install -y redis-server
echo "安装redis-server成功"
apt-get install -y python
echo "安装python2成功"
apt-get install -y python-pip
#pip install --upgrade pip==19.3.1 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
echo "安装pip成功"
echo "install redis==2.10.6"
pip install redis==2.10.6 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
echo "install django"
pip install  django==1.8.4 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
pip install  requests -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
pip install  pydot -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com

echo "install jdk"
apt-get install -y default-jdk
echo "依赖安装完毕"
redis-server /usr/local/etc/redis/redis.conf &
python geekbackend/manage.py runserver 0.0.0.0:8088 &
python Hades-cli.py
