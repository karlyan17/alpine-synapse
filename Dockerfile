FROM alpine/base
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 
RUN apk update \
    && apk upgrade

# build dep
RUN apk add py3-pip openssl-dev zlib-dev jpeg-dev libffi-dev python3-dev make
RUN pip3 install matrix-synapse
RUN apk del py3-pip openssl-dev zlib-dev jpeg-dev libffi-dev python3-dev make

EXPOSE 80

STOPSIGNAL SIGTERM

ENTRYPOINT ["/bin/ash"]
