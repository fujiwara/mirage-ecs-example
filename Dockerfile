FROM alpine:3.11

RUN apk --no-cache add curl unzip

WORKDIR /opt
RUN curl -sL https://github.com/acidlemon/mirage-ecs/releases/download/v0.5.0/mirage-ecs-v0.5.0-linux-amd64.zip > mirage-ecs-v0.5.0-linux-amd64.zip && \
    unzip mirage-ecs-v0.5.0-linux-amd64.zip && \
    rm -f mirage-ecs-v0.5.0-linux-amd64.zip

ADD config.yml /opt/mirage/config.yml

WORKDIR /opt/mirage
ENV MIRAGE_LOG_LEVEL info
ENV MIRAGE_CONF config.yml

ENTRYPOINT ["/opt/mirage/mirage-ecs"]
