FROM python:3.7-alpine3.8

ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8

ADD dockfile.cfgs.d/repositories /tmp/repositories
RUN cat /tmp/repositories >> /etc/apk/repositories && rm -rf /tmp/repositories
RUN apk update
RUN python --version
RUN apk add --no-cache --virtual py3-pip
RUN apk add --no-cache openrc openssh-server shadow curl git
RUN pip install git+https://github.com/Supervisor/supervisor

# 配置用户变量
ADD dockfile.cfgs.d/profile /tmp/profile
RUN cat /tmp/profile >> /etc/profile && source /etc/profile && rm -rf /tmp/profile

ADD dockfile.cfgs.d/supervisord.conf /etc/supervisord.conf
COPY SmsdoveManager SmsdoveManager/
RUN pip install -r /SmsdoveManager/requirements.txt

CMD ["/bin/sh", "-c", "supervisord --nodaemon -c /etc/supervisord.conf"]
