FROM jenkins:2.7.4-alpine
USER root
RUN apk update && apk add docker && rm -rf /var/cache/apk/*
# share in TLS certificate/key via volumes at runtime
ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8081 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/key
