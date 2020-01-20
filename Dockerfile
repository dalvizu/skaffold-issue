FROM node:10-stretch

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y install curl unattended-upgrades && \
    apt-get -y autoremove && \
    apt-get clean && \
    apt-get -y install dumb-init && \
    unattended-upgrades -d

RUN mkdir /app
WORKDIR /app

COPY . /app

ENV NODE_ENV production
ENTRYPOINT ["/bin/bash"]
CMD ["/app/entrypoint.sh"]

