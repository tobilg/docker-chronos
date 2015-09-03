#!/bin/bash

exec /usr/bin/chronos run_jar \
  --master $CHRONOS_MESOS_MASTER \
  --zk_hosts $CHRONOS_ZK_HOSTS \
  --hostname $CHRONOS_HOSTNAME