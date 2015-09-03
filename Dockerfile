#FROM ubuntu:14.04.3
FROM tobilg/mesos:latest
MAINTAINER tobilg <fb.tools.github@gmail.com>

# Install lsb 
RUN apt-get update && apt-get install -yq --no-install-recommends --force-yes lsb-core

# Setup key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF

# Add the repository
RUN echo "deb http://repos.mesosphere.io/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/mesosphere.list

# Install Chronos
RUN apt-get update && apt-get install -yq --no-install-recommends --force-yes chronos

# 
RUN locale-gen "en_US.UTF-8"
RUN dpkg-reconfigure locales
	
ADD bootstrap.sh /bootstrap.sh
EXPOSE 8080

ENTRYPOINT ["./bootstrap.sh"]