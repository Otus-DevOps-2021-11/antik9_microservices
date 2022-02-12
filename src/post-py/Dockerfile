FROM python:3.6.0-alpine

WORKDIR /app
COPY . /app

RUN apk update \
    && apk add --no-cache --update build-base=0.4-r1 \
    && pip install --upgrade pip==21.3 \
    && pip install -r /app/requirements.txt \
    && apk del build-base \
    && rm -rf /var/cache/apk/*

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

CMD ["python3", "post_app.py"]
