FROM ubuntu:14.04

RUN apt-get update && apt-get install -y openjdk-7-jre netcat \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y curl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /cos

EXPOSE 18088
EXPOSE 19088

CMD ./start-all.sh; sleep infinity
