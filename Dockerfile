FROM python:3.6.5-alpine3.7
LABEL author="Diemesleno Souza Carvalho <diemesleno@gmail.com>"

RUN apk update && apk add --no-cache \
        build-base \
        postgresql-dev \
        gcc \
        python3-dev \
        musl-dev \
        bash \
    && rm -rf /var/cache/apk/*

COPY .  /usr/src/kuehne

WORKDIR /usr/src/kuehne

EXPOSE 8000

RUN pip install -r requirements.txt && rm -rf /root/.cache
