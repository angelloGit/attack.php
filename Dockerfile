FROM php:alpine
COPY atack.php /
CMD /usr/local/bin/php atack.php
