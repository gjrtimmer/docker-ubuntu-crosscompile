ARG DOCKER_PROXY
ARG DOCKER_IMAGE_BASE=ubuntu:latest
FROM ${DOCKER_PROXY}/${DOCKER_IMAGE_BASE}

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Amsterdam

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN	apt-get update -y && \
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
	g++-9 \
	g++-10 \
	git \
	ca-certificates \
	gcc-multilib \
	g++-multilib \
	file \
	libz-dev \
	perl \
	python3 \
	tcl \
	tcl-dev \
	unzip \
	zip \
	curl \
	wget

ARG BUILD_DATE
ARG VCS_REF
ARG CI_PROJECT_NAME
ARG CI_PROJECT_URL
ARG DOCKER_IMAGE

LABEL \
	maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
	org.label-schema.schema-version="1.0" \
	org.label-schema.build-date=${BUILD_DATE} \
	org.label-schema.name=${CI_PROJECT_NAME} \
	org.label-schema.url="${CI_PROJECT_URL}" \
	org.label-schema.vcs-url="${CI_PROJECT_URL}.git" \
	org.label-schema.vcs-ref=${VCS_REF} \
	org.label-schema.docker.image="${DOCKER_IMAGE}" \
	org.label-schema.license=MIT

# EOF
