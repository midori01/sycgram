FROM python:3.9-alpine
LABEL maintainer=midori01

WORKDIR /sycgram
COPY . /sycgram

RUN apk update \
    && apk add --no-cache libjpeg libwebp libpng py3-lxml bc neofetch libc6-compat \
    && apk add --no-cache --virtual build-deps gcc g++ zlib-dev jpeg-dev libxml2-dev libxslt-dev libwebp-dev libpng-dev \
    && pip install -r requirements.txt --no-cache-dir \
    && apk del build-deps \
    && mkdir -p /sycgram/data \
    && rm -rf .git .github .gitignore Dockerfile install.sh LICENSE README.md requirements.txt

VOLUME /sycgram/data

ENTRYPOINT ["/usr/local/bin/python3", "-u", "main.py"]
