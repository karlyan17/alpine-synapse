FROM alpine/base
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 
RUN apk update \
    && apk upgrade

ENV BUILDDEP gcc libc-dev py3-pip openssl-dev zlib-dev jpeg-dev libffi-dev python3-dev make
ENV RUNDEP libjpeg python3
# build dep
RUN apk add $BUILDDEP
RUN pip3 install matrix-synapse
RUN apk del $BUILDDEP
RUN apk add $RUNDEP

EXPOSE 80

STOPSIGNAL SIGTERM

ENTRYPOINT ["/bin/ash"]
