FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get install -y \
        curl \        
        jq \
        libatomic1 \
        software-properties-common \
	x11-apps

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get install -y --no-install-recommends libpython3.9

ARG FVP_BASE_URL
ARG FVP_ARCHIVE

RUN curl -LO ${FVP_BASE_URL}/${FVP_ARCHIVE} && \
    mkdir -p /opt/fvp && \
    tar -xf ${FVP_ARCHIVE} --strip-components 1 -C /opt/fvp && \
    rm ${FVP_ARCHIVE}

ARG USERNAME=root
ARG USERID=0

RUN test ${USERID} -ne 0 && \
    groupadd -g ${USERID} ${USERNAME} && \
    useradd -l -r -u ${USERID} -g ${USERNAME} ${USERNAME}

USER ${USERNAME}

CMD ["/bin/bash"]
