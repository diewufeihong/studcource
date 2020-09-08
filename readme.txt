1 ubuntu 安装java
 设置java环境变量

JAVA_HOME=/usr/lib/jdk/jdk1.8.0_221
JRE_HOME=/usr/lib/jdk/jdk1.8.0_221/jre
PATH=/usr/local/mysql/bin:/usr/lib/jdk/jdk1.8.0_221/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

2 安装 tomcat
设置tomcat环境变量  starup.sh
#set java environment
export JAVA_HOME=/usr/lib/jdk/jdk1.8.0_221

export JRE_HOME=${JAVA_HOME}/jre

export CLASSPATH=.:%{JAVA_HOME}/lib:%{JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH


#tomcat

export TOMCAT_HOME=/usr/local/apache/apache-tomcat-8.5.46


3安装 mariadb数据库
初始化数据库
test 用户 口令 123456
test数据库 初始化表 和 数据

