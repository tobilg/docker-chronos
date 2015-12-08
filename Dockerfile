FROM java:openjdk-8u66-jre
MAINTAINER tobilg <fb.tools.github@gmail.com>

# packages
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    echo "deb http://repos.mesosphere.io/debian jessie main" | tee /etc/apt/sources.list.d/mesosphere.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y --force-yes mesos=0.25.0-0.2.70.debian81 chronos

# Add bootstrapping script
ADD bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh

# Expose standard port
EXPOSE 8080

ENTRYPOINT ["/bootstrap.sh"]