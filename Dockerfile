############# BUILD STEP #############
FROM oracle/graalvm-ce:19.2.0.1 as builder

# Set GRAALVM_HOME
ENV GRAALVM_HOME=/opt/graalvm-ce-19.2.0.1

RUN gu install native-image && \
    mkdir /src

RUN mkdir -p /tmp/ssl-libs/lib \
  && cp /opt/graalvm-ce-19.2.0.1/jre/lib/security/cacerts /tmp/ssl-libs \
  && cp /opt/graalvm-ce-19.2.0.1/jre/lib/amd64/libsunec.so /tmp/ssl-libs/lib/

WORKDIR /src

ADD . /src

RUN ./gradlew && \
    ./gradlew build && \
    ./gradlew --stacktrace buildNative --docker-build=false

############# RUN STEP #############
FROM debian:jessie-slim

COPY --from=builder /tmp/ssl-libs/ /opt/
COPY --from=builder /src/build/quarkus-scala-gradle-0.0.1-SNAPSHOT-runner /application

ENTRYPOINT /application \
    -Djava.library.path=/opt/lib \
    -Djavax.net.ssl.trustStore=/opt/cacerts \
    -XmX64m
