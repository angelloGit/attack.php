#!/bin/sh


docker rm -f atack.php
docker rmi atack.php
docker build -t atack.php .

docker run -d --rm --name atack.php atack.php && docker logs -f atack.php
