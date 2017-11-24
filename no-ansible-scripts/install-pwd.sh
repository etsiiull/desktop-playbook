#!/bin/bash
#
# go things...
cd /usr/local
curl -O https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
tar xvfz go1.8.linux-amd64.tar.gz
rm -f go1.8.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin:/opt/go/bin
export GOPATH=/opt/go

cat > /etc/profile.d/pwdpath.sh<<EOF
export PATH=$PATH:/usr/local/go/bin:/opt/go/bin
export GOPATH=/opt/go

EOF


go get -u github.com/golang/dep/cmd/dep

# play-with-docker things...
mkdir -p /opt/go/src/github.com/play-with-docker
cd /opt/go/src/github.com/play-with-docker
git clone https://github.com/play-with-docker/play-with-docker.git
cd /opt/go/src/github.com/play-with-docker/play-with-docker
dep ensure

# docker things...
docker pull franela/dind
docker swarm init
curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker-compose up


