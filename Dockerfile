FROM python:3

ARG USEPROXY=0

COPY requirements.txt .

RUN test $USEPROXY -ne 1 || echo "PIP Will use proxy"
RUN test $USEPROXY -ne 1 || pip --proxy=fastweb.int.bell.ca:8083 install -r requirements.txt
RUN test $USEPROXY -ne 0 || pip install -r requirements.txt

ENV APP_ROOT=/app

COPY *.py ${APP_ROOT}/
COPY service ${APP_ROOT}/service
COPY view ${APP_ROOT}/view

ENV PATH=${APP_ROOT}/sh:${PATH} HOME=${APP_ROOT}
COPY sh/ ${APP_ROOT}/sh/
RUN chmod -R u+x ${APP_ROOT}/sh && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

RUN chmod g=u /etc/passwd
ENTRYPOINT [ "uid_entrypoint" ]
USER 1001

WORKDIR ${APP_ROOT}
EXPOSE 8081
CMD run
