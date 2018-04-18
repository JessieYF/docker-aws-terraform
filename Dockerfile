FROM docker:dind

ENV PATH /root/.local/bin:$PATH
ENV TERRAFORM_VERSION 0.11.6

USER root

RUN apk update \
 && apk add bash curl ca-certificates git openssl openssh unzip make python \
 && cd /tmp \
 && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
 && rm -rf /tmp/* \
 && rm -rf /var/cache/apk/* \
 && rm -rf /var/tmp/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py \
 && python get-pip.py --user \
 && pip install docker-py \
 && pip install awscli --upgrade --user \
 && aws --version
