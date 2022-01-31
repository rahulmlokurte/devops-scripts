FROM ubuntu:20.04

RUN mkdir temp

RUN apt-get update && apt-get install -y curl && apt-get install -y openjdk-8-jre-headless

ADD kafka.sh /temp

RUN curl https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz -o "kafka_2.13-3.1.0.tgz" --insecure
RUN tar -xvf kafka_2.13-3.1.0.tgz -C temp
RUN ln -s /temp/kafka_2.13-3.1.0 /usr/local/bin/kafka
RUN rm -rf ./kafka_2.13-3.1.0.tgz