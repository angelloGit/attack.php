#!/bin/sh

set -e

apt-get update
apt-get upgrade -y
apt-get install -y git curl

apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
 | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-compose

cat > /docker-compose.yml <<__EOFF
version: '3'
services:
  atack.php:
    image: angello2docker/atack.php:latest
    restart: always
__EOFF

/usr/bin/docker-compose up -d

crontab - <<__EOFF
31 * * * * /usr/bin/docker-compose pull && /usr/bin/docker-compose up -d
__EOFF
