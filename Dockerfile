From tomcat:9.0
RUN apt update
RUN apt install maven git -y
WORKDIR /tmp/
RUN git clone https://github.com/B-Software/Ward.git
WORKDIR /tmp/Ward/
RUN mvn package
WORKDIR /tmp/Ward/target/
RUN chmod u+x ./ward-1.8.8.jar
ADD ward-1.8.8.jar /var/lib/tomcat9/webapps/
RUN apt install jarwrapper
