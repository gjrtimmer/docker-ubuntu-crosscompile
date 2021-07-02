FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Amsterdam

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && \
	apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
	apt-get update -y && \
    apt-get install -y \
		build-essential \
		bash \
		vim \
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
		wget

ARG BUILD_DATE
ARG VCS_REF
ARG DOCKER_IMAGE
ARG UBUNTU_VERSION

LABEL \
	nl.timmertech.build-date=${BUILD_DATE} \
	nl.timmertech.name=crosscompile \
	nl.timmertech.vendor=timmertech.nl \
	nl.timmertech.vcs-url="https://gitlab.timmertech.nl/docker/crosscompile.git" \
	nl.timmertech.vcs-ref=${VCS_REF} \
	org.label-schema.docker.image="${DOCKER_IMAGE}" \
	org.label-schema.ubuntu-version="${UBUNTU_VERSION}" \
	nl.timmertech.license=MIT

# EOF