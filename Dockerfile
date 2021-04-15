FROM ubuntu:20.04
LABEL maintainer="Makhosandile"
LABEL version="1.0"
LABEL description="custom Docker image that runs any web server, \ 
                    with php version 7"


# Install dependencies
RUN apt-get update && \
    apt install -y php7.2 -y && apt-get install nginx -y

RUN  service nginx restart

# Setup directory structure
COPY ./default /etc/nginx/sites-available/default
COPY ./phpinfo.php /var/www/html/info.php

RUN service nginx start && service php7.2-fpm start

EXPOSE 80