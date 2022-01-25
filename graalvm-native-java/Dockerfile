FROM ghcr.io/graalvm/graalvm-ce:java11-21
WORKDIR /usr/share

ADD https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz .
ADD https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.3.0/native-image-installable-svm-java11-linux-amd64-21.3.0.jar .
RUN gu -L install native-image-installable-svm-java11-linux-amd64-21.3.0.jar && \
    tar xzf apache-maven-3.8.4-bin.tar.gz
ENV PATH="/usr/share/apache-maven-3.8.4/bin:$PATH"