# Chronos
A Docker container for the latest Mesosphere Chronos version, together with a local binaries Mesos installation (currently 0.28.0 as of 2016-04-18).

## Usage
This image assumes a running ZooKeeper instance somewhere on your network, as well as a running Mesos Master. If the ZooKeeper server resides on 192.168.0.100 (on port 2181), 
and the Mesos Master too, which was registered at `zk://192.168.0.100:2181/mesos`, the container can be started via

    docker run -d --name chronos \
      -e CHRONOS_MASTER=zk://192.168.0.100:2181/mesos \
      -e CHRONOS_HOSTNAME=192.168.0.100 \
      -e CHRONOS_ZK_HOSTS=192.168.0.100:2181 \
      -p 8081:8081 \
      -t tobilg/chronos:latest

You can pass all the command line flags as environment parameters (uppercase and prepended by `CHRONOS_`) as listed in the [original docs](http://mesos.github.io/chronos/docs/configuration.html).

The web frontend will then be accessible on the Docker host's port `8081`. Be aware that Marathon also uses the port `8080`, that's why the default Chronos port was remapped to 8081.

### Time
If you want to pass-in the Docker host's time, you can add the `-v /etc/localtime:/etc/localtime:ro` parameter during startup.