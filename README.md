# Chronos
A Docker container for the latest Mesosphere Chronos version, together with a local binaries Mesos installation (currently 0.24.0-rc1).

## Usage
This image assumes a running ZooKeeper instance somewhere on your network, as well as a running Mesos Master. If the ZooKeeper server resides on 192.168.0.100 (on port 2181), 
and the Mesos Master too, which was registered at `zk://192.168.0.100:2181/mesos`, the container can be started via

    docker run -d --name chronos \
      -e CHRONOS_MESOS_MASTER=zk://192.168.0.100:2181/mesos \
	  -e CHRONOS_HOSTNAME=192.168.0.100 \
	  -e CHRONOS_ZK_HOSTS=192.168.0.100:2181 \
	  -p 8081:8080 \
	  -t tobilg/chronos:latest

The web frontend will then be accessible on the Docker host's port `8081`. Be aware that Marathon also uses the port `8080`, that's why it can be necessary to remap the Chronos port.

### Time
If you want to pass-in the Docker host's time, you can add the `-v /etc/localtime:/etc/localtime:ro` parameter during startup.