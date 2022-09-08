FROM ubuntu
FROM jenkins/jenkins
USER root
RUN apt-get update -y && apt-get install unzip -y && apt-get install wget -y && apt-get install vim -y && apt-get install -y lsb-release && apt-get install -y apt-utils
 # Install Jenkins
#RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
#RUN sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
#RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee \ /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \https://pkg.jenkins.io/debian-stable binary/ | tee \/etc/apt/sources.list.d/jenkins.list > /dev/null
#RUN apt-get update -y
#RUN apt-get install openjdk-8-jdk
#RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |apt-key add 
#RUN echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list
#RUN apt-get install jenkins -y
#RUN apt-get install git
RUN mkdir /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
USER jenkins
#RUN apt-get update -y
#RUN apt-get install jenkins -y
ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"

 # Install Terraform
USER root
RUN wget https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_linux_amd64.zip
RUN unzip terraform_1.2.8_linux_amd64.zip
RUN mv terraform /usr/local/bin/
RUN terraform --version 

