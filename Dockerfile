FROM alpine:3.15

RUN apk update \
&& apk upgrade \
&& apk add --no-cache bash \
&& apk add --no-cache --virtual=build-dependencies unzip \
&& apk add --no-cache curl \
&& apk add --no-cache openjdk12-jre

# Python
RUN apk add --no-cache python3 \
&& python3 -m ensurepip \
&& pip3 install --upgrade pip setuptools awscli \
&& rm -r /usr/lib/python*/ensurepip && \
if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
rm -r /root/.cache

#openjdk:11-jdk-oracle

SHELL ["/bin/bash", "-c"]
RUN PREFIX=~/.okta /bin/bash <(curl -fsSL https://raw.githubusercontent.com/oktadev/okta-aws-cli-assume-role/master/bin/install.sh) -i
#ENV PATH="~/.okta/bin:${PATH}"

COPY .bashrc /root/.bashrc

CMD /bin/bash
