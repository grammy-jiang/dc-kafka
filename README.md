# Docker Compose of Apache Kafka

A very simple docker-compose of Apache Kafka.

This repo is only used on my Raspberry Pi 4 with Ubuntu 20.04 (ARM64).

## How to use this `docker-compose.yml`

### Build the kafka image first

Create `.env` from `.env.example`:

```console
foo@bar:~$ cp .env.example .env
```

Then edit it to fit your requirement.

Run the following command to build the image at the beginning:

```console
foo@bar:~$ docker-compose build
...
```

This will build an image named `grammyjiang/kafka:<tag>`, and it can be checked:

```console
foo@bar:~$ docker run --rm -it grammyjiang/kafka:2.6.0 kafka-server-start --version
[2020-11-25 21:57:58,713] INFO Registered kafka:type=kafka.Log4jController MBean (kafka.utils.Log4jControllerRegistration$)
2.6.0 (Commit:62abe01bee039651)
foo@bar:~$ docker run --rm -it grammyjiang/kafka:2.6.0 kafka-server-start --help
[2020-11-25 21:59:06,179] INFO Registered kafka:type=kafka.Log4jController MBean (kafka.utils.Log4jControllerRegistration$)
USAGE: java [options] KafkaServer server.properties [--override property=value]*
Option               Description
------               -----------
--override <String>  Optional property that should override values set in
                       server.properties file
--version            Print version information and exit.
```

## Start Apache Kafka

### Create the local environment files

Create `zookeeper.env` from `zookeeper.env.example` and `kafka.env` from
`kafka.env.example`:

```console
foo@bar:~$ cp zookeeper.env.example zookeeper.env
foo@bar:~$ cp kafka.env.example kafka.env
```

Then edit it to fit your requirement.

### Start the service

```console
foo@bar:~$ docker-compose up --detach
Creating network "dc-kafka_nw-kafka" with driver "bridge"
Creating dc-kafka-zookeeper ... done
Creating dc-kafka           ... done
```

### Read the log messages

```console
foo@bar:~$ docker-compose logs --follow
...
```

### Check the status

```console
foo@bar:~$ docker-compose ps
       Name                     Command               State                          Ports
------------------------------------------------------------------------------------------------------------------
dc-kafka             docker-entrypoint.sh kafka ...   Up      0.0.0.0:9092->9092/tcp
dc-kafka-zookeeper   /docker-entrypoint.sh zkSe ...   Up      0.0.0.0:2181->2181/tcp, 2888/tcp, 3888/tcp, 8080/tcp
```

## Stop the service and remove the data

### Stop the service

```console
foo@bar:~$ docker-compose down --volumes
Stopping dc-kafka           ... done
Stopping dc-kafka-zookeeper ... done
Removing dc-kafka           ... done
Removing dc-kafka-zookeeper ... done
Removing network dc-kafka_nw-kafka
```

# Reference

* [Apache Kafka](https://kafka.apache.org/)
* [zookeeper - Docker Hub](https://hub.docker.com/_/zookeeper)
