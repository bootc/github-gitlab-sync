FROM alpine:3.20.3@sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a

ARG BUILD_DATE=1970-01-01T00:00:00Z
ARG VCS_REF=

LABEL org.label-schema.vendor="Chris Boot" \
      org.label-schema.url="https://git.boo.tc/bootc/github-gitlab-sync" \
      org.label-schema.name="github-gitlab-sync" \
      org.label-schema.description="Continuous repository synchroniser between GitHub and GitLab" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="https://git.boo.tc/bootc/github-gitlab-sync.git" \
      org.label-schema.schema-version="1.0"

RUN apk add --no-cache --update git openssh-client && \
    rm -rf /var/cache/apk/*

RUN mkdir -p ~/.ssh && \
    ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts && \
    ssh-keyscan -H git.boo.tc >> /etc/ssh/ssh_known_hosts && \
    true

COPY git-sync-remote /usr/local/bin
