FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Amsterdam

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && \
	apt-get install -y --no-install-recommends software-properties-common && \
	add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
	apt-get update -y && \
    apt-get install --no-install-recommends -y \
		build-essential \
		cmake \
		make \
		binutils-mingw-w64 \
		gcc-mingw-w64-i686 \
		gcc-mingw-w64 \
		g++-7 \
		g++-8 \
		g++-9 \
		g++-10 \
		git \
		ca-certificates \
		gcc-multilib \
		g++-multilib \
		file \
		libz-dev \
		perl \
		python \
		tcl \
		tcl-dev \
		unzip \
		zip \
		curl \
		wget && \
	apt-get autoremove -y && \
	apt-get clean -y && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir /build && \
	chown -R nobody:nogroup /build

USER nobody
ENV HOME /build
WORKDIR /build

ARG PROJECT
ARG BUILD_DATE
ARG GIT_COMMIT
ARG GIT_URL
ARG URL

LABEL maintainer="G.J.R. Timmer" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name=${PROJECT} \
    org.label-schema.url="${URL}" \
    org.label-schema.vcs-url="${GIT_URL}" \
    org.label-schema.vcs-ref=${GIT_COMMIT} \
	nl.timmertech.name=${PROJECT} \
	nl.timmertech.vendor=timmertech.nl \
	nl.timmertech.url=${URL} \
	nl.timmertech.vcs-url="${GIT_URL}" \
	nl.timmertech.vcs-ref=${GIT_COMMIT} \
	nl.timmertech.license=MIT
