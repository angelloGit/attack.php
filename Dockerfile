FROM php:alpine
RUN apk add git && git clone  https://gitlab.com/cto.endel/atack.min.
WORKDIR /atack.min
CMD /usr/local/bin/php atack.php

