# ubuntu:16.04
FROM ubuntu@sha256:8e2324f2288c26e1393b63e680ee7844202391414dbd48497e9a4fd997cd3cbf

ENV LANG=C.UTF-8

RUN set -xe && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      apt-transport-https=1.2.12~ubuntu16.04.1 \
      binutils=2.26.1-1ubuntu1~16.04.3 \
      bzip2=1.0.6-8 \
      ca-certificates=20160104ubuntu1 \
      cpp=4:5.3.1-1ubuntu1 \
      cpp-5=5.4.0-6ubuntu1~16.04.2 \
      curl=7.47.0-1ubuntu2.1 \
      dpkg-dev=1.18.4ubuntu1.1 \
      g++=4:5.3.1-1ubuntu1 \
      g++-5=5.4.0-6ubuntu1~16.04.2 \
      gcc=4:5.3.1-1ubuntu1 \
      gcc-5=5.4.0-6ubuntu1~16.04.2 \
      git=1:2.7.4-0ubuntu1 \
      git-man=1:2.7.4-0ubuntu1 \
      libasan2:amd64=5.4.0-6ubuntu1~16.04.2 \
      libasn1-8-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      libatomic1:amd64=5.4.0-6ubuntu1~16.04.2 \
      libc-dev-bin=2.23-0ubuntu3 \
      libc6-dev:amd64=2.23-0ubuntu3 \
      libcc1-0:amd64=5.4.0-6ubuntu1~16.04.2 \
      libcilkrts5:amd64=5.4.0-6ubuntu1~16.04.2 \
      libcurl3-gnutls:amd64=7.47.0-1ubuntu2.1 \
      libdpkg-perl=1.18.4ubuntu1.1 \
      liberror-perl=0.17-1.2 \
      libexpat1:amd64=2.1.0-7ubuntu0.16.04.2 \
      libffi6:amd64=3.2.1-4 \
      libgcc-5-dev:amd64=5.4.0-6ubuntu1~16.04.2 \
      libgdbm3:amd64=1.8.3-13.1 \
      libgmp10:amd64=2:6.1.0+dfsg-2 \
      libgnutls30:amd64=3.4.10-4ubuntu1.1 \
      libgomp1:amd64=5.4.0-6ubuntu1~16.04.2 \
      libgssapi-krb5-2:amd64=1.13.2+dfsg-5 \
      libgssapi3-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      libhcrypto4-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      libheimbase1-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      libheimntlm0-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      libhogweed4:amd64=3.2-1 \
      libhx509-5-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      libidn11:amd64=1.32-3ubuntu1 \
      libisl15:amd64=0.16.1-1 \
      libitm1:amd64=5.4.0-6ubuntu1~16.04.2 \
      libk5crypto3:amd64=1.13.2+dfsg-5 \
      libkeyutils1:amd64=1.5.9-8ubuntu1 \
      libkrb5-26-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      libkrb5-3:amd64=1.13.2+dfsg-5 \
      libkrb5support0:amd64=1.13.2+dfsg-5 \
      libldap-2.4-2:amd64=2.4.42+dfsg-2ubuntu3.1 \
      liblsan0:amd64=5.4.0-6ubuntu1~16.04.2 \
      libmpc3:amd64=1.0.3-1 \
      libmpfr4:amd64=3.1.4-1 \
      libmpx0:amd64=5.4.0-6ubuntu1~16.04.2 \
      libnettle6:amd64=3.2-1 \
      libp11-kit0:amd64=0.23.2-3 \
      libperl5.22:amd64=5.22.1-9 \
      libquadmath0:amd64=5.4.0-6ubuntu1~16.04.2 \
      libroken18-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      librtmp1:amd64=2.4+20151223.gitfa8646d-1build1 \
      libsasl2-2:amd64=2.1.26.dfsg1-14build1 \
      libsasl2-modules-db:amd64=2.1.26.dfsg1-14build1 \
      libsqlite3-0:amd64=3.11.0-1ubuntu1 \
      libssl1.0.0:amd64=1.0.2g-1ubuntu4.1 \
      libstdc++-5-dev:amd64=5.4.0-6ubuntu1~16.04.2 \
      libtsan0:amd64=5.4.0-6ubuntu1~16.04.2 \
      libtasn1-6:amd64=4.7-3ubuntu0.16.04.1 \
      libubsan0:amd64=5.4.0-6ubuntu1~16.04.2 \
      libwind0-heimdal:amd64=1.7~git20150920+dfsg-4ubuntu1 \
      linux-libc-dev:amd64=4.4.0-34.53 \
      make=4.1-6 \
      openssl=1.0.2g-1ubuntu4.1 \
      patch=2.7.5-1 \
      perl=5.22.1-9 \
      perl-modules-5.22=5.22.1-9 \
      xz-utils=5.1.1alpha+20120614-2ubuntu2

RUN set -xe && \
    echo 'deb http://binaries.erlang-solutions.com/debian xenial contrib' > /etc/apt/sources.list.d/erlang-solutions.list && \
    curl https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | apt-key add - && \
    echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' > /etc/apt/sources.list.d/docker.list && \
    curl https://apt.dockerproject.org/gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      docker-engine=1.12.0-0~xenial \
      elixir=1.3.2-1 \
      erlang-asn1=1:19.0-1 \
      erlang-base=1:19.0-1 \
      erlang-crypto=1:19.0-1 \
      erlang-dev=1:19.0-1 \
      erlang-inets=1:19.0-1 \
      erlang-mnesia=1:19.0-1 \
      erlang-public-key=1:19.0-1 \
      erlang-runtime-tools=1:19.0-1 \
      erlang-ssl=1:19.0-1 \
      erlang-syntax-tools=1:19.0-1 \
      iptables=1.6.0-2ubuntu3 \
      libltdl7:amd64=2.4.6-0.1 \
      libnfnetlink0:amd64=1.0.1-3 \
      libxtables11:amd64=1.6.0-2ubuntu3 && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd -g 1000 elixir && \
    useradd -g 1000 -u 1000 -s /bin/bash -m elixir

USER elixir

WORKDIR /home/elixir

RUN set -xe && \
    mix local.hex --force && \
    mix local.rebar --force

COPY build.sh /home/elixir/build.sh

ENTRYPOINT ["/home/elixir/build.sh"]
