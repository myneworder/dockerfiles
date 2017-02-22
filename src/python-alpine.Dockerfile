FROM python:2.7.13-alpine

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="python on alpine-linux" \
      link="https://hub.docker.com/r/suddi/python-alpine/"

# SET VARIABLES
ENV CONTAINER_USER="py" \
	HOME_DIR="/home/$CONTAINER_USER" \
	VIRTUALENV_DIR="$HOME_DIR/virtualenvs" \
	VIRTUALENV="runtime" \
	VIRTUALENV_ACTIVATE="$VIRTUALENV_DIR/$VIRTUALENV/bin/activate"

# CREATE PY USER
RUN adduser -D -h $HOME_DIR -u 1000 $CONTAINER_USER && \
    cd $HOME_DIR && \
    mkdir -p $VIRTUALENV_DIR && \
    mkdir $HOME_DIR/app && \

    pip install \
    	virtualenv && \

    cd $VIRTUALENV_DIR && \
    virtualenv $VIRTUALENV && \

    chown -R $CONTAINER_USER:$CONTAINER_USER $HOME_DIR

WORKDIR $HOME_DIR