Jenkins Docker Image with Docker client
=======================================

This is a Docker image based on official upstream Jenkins which allows Jenkins
jobs to spawn sibling containers when Jenkins itself is running within a
container. Primarily used/tested on CoreOS.

Also configured to listen on port 8081 TLS.

Share in TLS certificate and key files via Docker volumes to the following locations:
- ``/var/lib/jenkins/cert``
- ``/var/lib/jenkins/key``

Docker Configuration
--------------------

Set the environment variables `DOCKER_HOST` and `DOCKER_API_VERSION`.

Usage:
------

```bash
$ docker run --name jenkins \
-e DOCKER_HOST=unix:///var/run/docker.sock \
-e DOCKER_API_VERSION=1.23 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /opt/tls/cert.pem:/var/lib/jenkins/cert \
-v /opt/tls/key.pem:/var/lib/jenkins/key \
--privileged --net=host quay.io/dollarshaveclub/jenkins-with-docker:master
```
