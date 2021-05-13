FROM ubuntu:latest
WORKDIR /root
ENV SONAR_RUNNER_HOME=/root/sonar-scanner
ENV PATH ${SONAR_RUNNER_HOME}/bin:$PATH
RUN apt-get update -y  && \
apt-get install openjdk-8-jdk unzip wget -y && \
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip && \
unzip sonar-scanner-cli-4.2.0.1873-linux.zip && \
mv sonar-scanner-4.2.0.1873-linux /root/sonar-scanner && \
mkdir -p /root/codesrc/ 
CMD  cp /root/codesrc/sonar-scanner.properties /root/sonar-scanner/conf/sonar-scanner.properties && sonar-scanner
