#!/bin/sh
VERSION='1'
ZOOKEEPER_HOST=127.0.0.1
ZOOKEEPER_PORT=2181

KAFKA_PORT=9092
start_kafka() {
  echo '**************************'
  echo 'Starting Zookeeper & Kafka'
  echo '**************************'
  rm -rf /tmp/kafka 2>/dev/null
  mkdir -p /tmp/kafka && pushd /tmp/kafka

  printf "tickTime=2000
    initLimit=10
    syncLimit=5
    dataDir=/tmp/kafka/zookeeper/data
    clientPort=%d" "$ZOOKEEPER_PORT" >>zoo.cfg

  printf "broker.id=0
    port=%d
    num.network.threads=3
    num.io.threads=8
    socket.send.buffer.bytes=102400
    socket.receive.buffer.bytes=102400
    socket.request.max.bytes=104857600
    log.dirs=/tmp/kafka/kafka-logs
    num.partitions=4
    num.recovery.threads.per.data.dir=1
    log.retention.hours=168
    log.segment.bytes=1073741824
    log.retention.check.interval.ms=300000
    log.cleaner.enable=false
    zookeeper.connect=%s:%d
    zookeeper.connection.timeout.ms=6000" "$KAFKA_PORT" "$ZOOKEEPER_HOST" "$ZOOKEEPER_PORT" >>kafka.properties

  echo "Starting zookeeper..."
  echo /usr/local/bin/kafka/bin/zookeeper-server-start.sh -daemon /tmp/kafka/zoo.cfg
  /usr/local/bin/kafka/bin/zookeeper-server-start.sh -daemon /tmp/kafka/zoo.cfg

  echo "Starting kafka..."
  echo /usr/local/bin/kafka/bin/kafka-server-start.sh -daemon /tmp/kafka/kafka.properties
  /usr/local/bin/kafka/bin/kafka-server-start.sh -daemon /tmp/kafka/kafka.properties
  sleep 5

  echo "Creating topic... Topic-1"

  echo /usr/local/bin/kafka/bin/kafka-topics.sh --create --bootstrap-server "$ZOOKEEPER_HOST":"$KAFKA_PORT" --replication-factor 1 --partitions 2 --topic Topic-1
  /usr/local/bin/kafka/bin/kafka-topics.sh --create --bootstrap-server "$ZOOKEEPER_HOST":"$KAFKA_PORT" --replication-factor 1 --partitions 2 --topic Topic-1

  echo "Creating topic... Topic-2"

  echo /usr/local/bin/kafka/bin/kafka-topics.sh --create --bootstrap-server "$ZOOKEEPER_HOST":"$KAFKA_PORT" --replication-factor 1 --partitions 2 --topic Topic-2
  /usr/local/bin/kafka/bin/kafka-topics.sh --create --bootstrap-server "$ZOOKEEPER_HOST":"$KAFKA_PORT" --replication-factor 1 --partitions 2 --topic Topic-2

  popd

}

function stop_kafka {
    echo '******************';
    echo 'Deleting Topics';
    echo '******************';
    echo "Deleting topic... Topic-1"

    echo /usr/local/bin/kafka/bin/kafka-topics.sh --delete --zookeeper "$ZOOKEEPER_HOST":"$ZOOKEEPER_PORT" --topic Topic-1
    /usr/local/bin/kafka/bin/kafka-topics.sh --delete --zookeeper "$ZOOKEEPER_HOST":"$ZOOKEEPER_PORT" --topic Topic-1

    echo "Deleting topic... Topic-2"

    echo /usr/local/bin/kafka/bin/kafka-topics.sh --delete --zookeeper "$ZOOKEEPER_HOST":"$ZOOKEEPER_PORT" --topic Topic-2
    /usr/local/bin/kafka/bin/kafka-topics.sh --delete --zookeeper "$ZOOKEEPER_HOST":"$ZOOKEEPER_PORT" --topic Topic-2

    echo '******************';
    echo 'Stopping Zookeeper';
    echo '******************';
    echo /usr/local/bin/kafka/bin/zookeeper-server-stop.sh /tmp/kafka/zoo.cfg
    /usr/local/bin/kafka/bin/zookeeper-server-stop.sh /tmp/kafka/zoo.cfg

    echo '****************';
    echo 'Stopping Kafka';
    echo '****************';
    ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}' | xargs kill -SIGKILL
}

function print_usage {
    echo "Usage: $0 <start|stop|restart|help>";
}

if [ "$1" == 'help' ]; then
    echo "Kafka Runner v$VERSION";
    echo '';
    print_usage;
    echo '';
    echo '  start\t\t:\tStart a local zookeeper and kafka instances.';
    echo '  stop\t\t:\tStop your local zookeeper and kafka instances.';
    echo '  restart\t:\tPerforms a stop and a start.';
    echo '  status\t:\tCheck to see if you have local zookeeper and kafka instances running.';
    echo '  help\t\t:\tPrint this help menu.';
    exit 0;
elif [ "$1" == 'start' ]; then
    start_kafka;
elif [ "$1" == 'stop' ]; then
    stop_kafka;
elif [ "$1" == 'restart' ]; then
    echo '****************';
    echo 'Restarting Kafka';
    echo '****************';
    echo '';

    stop_kafka;
    echo '';
    start_kafka
else
    echo 'Invalid usage';
    print_usage;
fi;

