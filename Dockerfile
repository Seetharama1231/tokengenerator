FROM ubuntu:20.04

# RUN apt -y update
# RUN apt install -y openjdk-11-jdk
# set ENV for java
ENV JAVA_HOME=/u01/applications/jdk-11
ENV PATH=$PATH:$JAVA_HOME/bin
# Create dir for java and application
# RUN mkdir -p /u01/middleware/
RUN mkdir -p /u01/applications/

RUN apt -y update
RUN apt install -y openjdk-11-jdk
#RUN apt install -y wget

#COPY openjdk-11+28_linux-x64_bin.tar.gz  /u01/middleware/
#ADD wget https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz	 /u01/middleware/
#WORKDIR /u01/middleware
#RUN tar -xvf openjdk-11+28_linux-x64_bin.tar.gz 
#RUN rm -rf openjdk-11+28_linux-x64_bin.tar.gz


WORKDIR /u01/applications
COPY target/tokengenerator-1.0.jar .

CMD java -cp /u01/applications/tokengenerator-1.0.jar com.tg.service.TokenGeneratorService

