From tomcat:9.0
RUN apt update
RUN apt install maven git -y
WORKDIR /tmp/
RUN git clone https://github.com/B-Software/Ward.git
WORKDIR /tmp/Ward/
RUN mvn package
RUN cd target/
ADD Ward-1.8.8/jar /var/lib/tomcat9/webapps/
RUN chmod u+x ./ward-1.8.8.jar
RUN apt install jarwrapper
