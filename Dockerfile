From tomcat:9.0
RUN apt update
RUN apt install maven git -y
WORKDIR /tmp/
RUN git clone https://github.com/B-Software/Ward.git
WORKDIR /tmp/WARD/
RUN mvn package