ARG DOCKER_IMAGE_BASE
FROM ${DOCKER_IMAGE_BASE}

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Amsterdam

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN	apt-get update -y && \
	add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
	apt-get update -y && \
	apt-get install -y \
	build-essential \
	cmake \
	make \
	binutils-mingw-w64 \
	gcc-mingw-w64-i686 \
	gcc-mingw-w64 \
	g++-9 \
	g++-10 \
	libz-dev \
	perl \
	python3 \
	tcl \
	tcl-dev

ARG BUILD_DATE
ARG CI_PROJECT_NAME
ARG CI_PROJECT_URL
ARG VCS_REF
ARG DOCKER_IMAGE_BASE

LABEL \
	maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
	build_version="${BUILD_DATE}" \
	org.opencontainers.image.authors="G.J.R. Timmer <gjr.timmer@gmail.com>" \
	org.opencontainers.image.created="${BUILD_DATE}" \
	org.opencontainers.image.title="${CI_PROJECT_NAME}" \
	org.opencontainers.image.url="${CI_PROJECT_URL}" \
	org.opencontainers.image.documentation="${CI_PROJECT_URL}" \
	org.opencontainers.image.source="${CI_PROJECT_URL}.git" \
	org.opencontainers.image.ref.name=${VCS_REF} \
	org.opencontainers.image.revision=${VCS_REF} \
	org.opencontainers.image.base.name="${DOCKER_IMAGE_BASE}" \
	org.opencontainers.image.licenses=MIT \
	org.opencontainers.image.vendor=timmertech.nl

# EOF
