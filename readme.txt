1 ubuntu ��װjava
 ����java��������

JAVA_HOME=/usr/lib/jdk/jdk1.8.0_221
JRE_HOME=/usr/lib/jdk/jdk1.8.0_221/jre
PATH=/usr/local/mysql/bin:/usr/lib/jdk/jdk1.8.0_221/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

2 ��װ tomcat
����tomcat��������  starup.sh
#set java environment
export JAVA_HOME=/usr/lib/jdk/jdk1.8.0_221

export JRE_HOME=${JAVA_HOME}/jre

export CLASSPATH=.:%{JAVA_HOME}/lib:%{JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH


#tomcat

export TOMCAT_HOME=/usr/local/apache/apache-tomcat-8.5.46


3��װ mariadb���ݿ�
��ʼ�����ݿ�
test �û� ���� 123456
test���ݿ� ��ʼ���� �� ����

