FROM centos

RUN yum -y upgrade
RUN yum -y install wget

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm

RUN yum -y install /tmp/jdk-8-linux-x64.rpm

RUN wget --no-cookies --no-check-certificate "http://www-eu.apache.org/dist/flume/1.7.0/apache-flume-1.7.0-bin.tar.gz" -O /opt/flume-1.7.0.tar.gz

RUN tar -zxvf /opt/flume-1.7.0.tar.gz -C /opt/
RUN rm /opt/flume-1.7.0.tar.gz -f
RUN ln -s /opt/apache-flume-1.7.0-bin/ /opt/flume

RUN cp /opt/flume/conf/flume-conf.properties.template /opt/flume/conf/flume.conf
RUN cp /opt/flume/conf/flume-env.sh.template /opt/flume/conf/flume-env.sh