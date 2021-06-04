FROM python:3.10.0b1-alpine3.13 as builder
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
RUN apk add --no-cache musl-dev linux-headers openssl-dev libffi-dev gcc python3-dev 
RUN mkdir /wheel
WORKDIR /wheel
COPY requirements.txt /wheel

RUN pip install --upgrade pip && pip install wheel && pip wheel -r /wheel/requirements.txt -w /wheel

FROM python:3.10.0b1-alpine3.13

RUN adduser -s /bin/sh -D resilient
COPY --from=builder /wheel /tmp/wheel
RUN pip install --upgrade pip && pip install --no-index --find-links /tmp/wheel -r /tmp/wheel/requirements.txt && rm -rf /tmp/wheel
COPY app.config /home/resilient/.resilient/
RUN mkdir /home/resilient/logs/ && chown -R resilient:resilient /home/resilient
ENV APP_LOCK_FILE=/tmp/resilient.lock
USER resilient

CMD resilient-circuits run
