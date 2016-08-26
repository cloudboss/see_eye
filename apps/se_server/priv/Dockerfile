FROM alpine:3.4

RUN set -xe && \
    apk add --no-cache \
      ca-certificates=20160104-r4 \
      docker=1.11.1-r0 \
      expat=2.1.1-r1 \
      git=2.8.3-r0 \
      iptables=1.6.0-r0 \
      libcurl=7.50.1-r0 \
      libgcc=5.3.0-r0 \
      libmnl=1.0.3-r1 \
      libnftnl-libs=1.0.5-r0 \
      libseccomp=2.3.1-r0 \
      libssh2=1.7.0-r0 \
      libstdc++=5.3.0-r0 \
      pcre=8.38-r1 \
      ncurses-libs=6.0-r7 \
      xz=5.2.2-r1 \
      xz-libs=5.2.2-r1

RUN set -xe && \
    addgroup -g 1000 elixir && \
    adduser -u 1000 -G elixir -h /home/elixir -D elixir

USER elixir

WORKDIR /home/elixir

COPY se_server.tar.gz .

RUN set -xe && \
    mkdir ~/app && \
    tar zxf se_server.tar.gz -C ~/app

# To allow environment variables to be in vm.args
ENV REPLACE_OS_VARS=true

ENTRYPOINT ["/home/elixir/app/bin/se_server"]
