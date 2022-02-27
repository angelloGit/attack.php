#!/bin/sh


docker rm atack.php
docker rmi atack.php
docker build -t atack.php .

docker run -d --rm --name atack.php atack.php
