FROM alpine:3.4

RUN set -xe && \
    apk add --no-cache \
      libgcc=5.3.0-r0 \
      libstdc++=5.3.0-r0 \
      ncurses-libs=6.0-r7

RUN set -xe && \
    addgroup -g 1000 elixir && \
    adduser -u 1000 -G elixir -h /home/elixir -D elixir

USER elixir

WORKDIR /home/elixir

COPY se_worker.tar.gz .

RUN set -xe && \
    mkdir ~/app && \
    tar zxf se_worker.tar.gz -C ~/app

# To allow environment variables to be in vm.args
ENV REPLACE_OS_VARS=true

ENTRYPOINT ["/home/elixir/app/bin/se_worker"]
