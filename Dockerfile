FROM debian:stretch
RUN apt-get update && apt-get dist-upgrade && apt-get install -y \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p ~/.ssh && \
    ssh-keyscan -H github.com >> ~/.ssh/known_hosts && \
    ssh-keyscan -H git.boo.tc >> ~/.ssh/known_hosts && \
    true
COPY git-sync-remote /usr/local/bin
