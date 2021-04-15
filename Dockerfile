FROM ubuntu:20.04
LABEL maintainer="Makhosandile"
LABEL version="1.0"
LABEL description="custom Docker image that runs any web server, \ 
                    with php version 7"


# Install dependencies
# COPY ./requirements.txt /requirements.txt
RUN apt-get update -y 
RUN apt-get install -y php7.2 
RUN apt-get install -y php7.2-curl php7.2-gd php7.2-json php7.2-mbstring \
    && apt clean
# RUN apk del .tmp-build-deps

# Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

RUN a2ensite playsafe.conf
RUN apachectl -t
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND