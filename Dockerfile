FROM alpine:3.7

LABEL org.label-schema.vendor="Chris Boot" \
      org.label-schema.url="https://github.com/bootc/github-gitlab-sync" \
      org.label-schema.name="github-gitlab-sync" \
      org.label-schema.description="Continuous repository synchroniser between GitHub and GitLab" \
      org.label-schema.schema-version="1.0"

RUN apk add --no-cache --update git openssh-client && \
	rm -rf /var/cache/apk/*

RUN mkdir -p ~/.ssh && \
    ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts && \
    ssh-keyscan -H git.boo.tc >> /etc/ssh/ssh_known_hosts && \
    true

COPY git-sync-remote /usr/local/bin
