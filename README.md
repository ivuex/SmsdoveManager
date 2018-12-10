# SmsdoveManager
#### Before read
 + This is a docker auto buildable repository.
 + The core smsdove callback codes and core smsdove callback readme.md are in sub directory: /SmsdoveManager/SmsdoveManager
#### What are used for? 
 + Write callback for my account at smsdove.com, and save the messages into database.
#### How to edit and deploy?
 + Install docker for the operation system, whatever your operation system is windows, linux, or macos.
 + Start the docker service.
 + git clone this repository. # direct docker run can jump this step.
 + cd SmsdoveManager # the project root directory  # direct docker run can jump this step.
 + docker build -t  ivuex/smsdove-manager:latest .  # direct docker run can jump this step.
 + docker run --name smsdove-manager -p 5179:5179 -itd  ivuex/smsdove-manager:latest
#### Dockerfile 
 + 可能会更新,以实际的Dockerfile为准
```lang=Dockerfile
FROM python:3.7-alpine3.8
ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8
...... # 此处省略
RUN apk add --no-cache --virtual py3-pip
RUN apk add --no-cache openrc openssh-server shadow curl git
RUN pip install git+https://github.com/Supervisor/supervisor
...... # 此处省略
ADD dockfile.cfgs.d/supervisord.conf /etc/supervisord.conf
COPY SmsdoveManager SmsdoveManager/
RUN pip install -r /SmsdoveManager/requirements.txt

CMD ["/bin/sh", "-c", "supervisord --nodaemon -c /etc/supervisord.conf"] 
```

#### Frequently Asked Questions 
 + What is the meaning of the last docker command params?
   - "大哥，我可以不写英文吗？"
   - "你高兴就好."
   - "大哥，真好. 我给你我的电话哟：15823170299, 微信同号哦"
   - --name 容器指定名称，这将会在docker ps或者docker ps -a的标准输出中NAMES列显示
   - -p 指定容器的端口映射，引号之前的是本地端口，引号之后的是容器操作系统内部的端口
   - -i 指定docker run命令以交互方式启动
   - -t 指定docker run要开启终端
   - -d 指定docker run后台运行，宿主操作一同结束当前终端进程，或者用户登出，系统关机都不影响该容器运行
 + How to ensure the container not to stop after the Dockerfile walk at the end?
   - The CMD instruction in Dockerfile at the end is like below:
```lang=Dockerfile
CMD ["/bin/sh", "-c", "supervisord --nodaemon -c /etc/supervisord.conf"]
```   
   - The --nodaemon param of supervisord specials the supervisord run in the foreground, you can run supervisor --help and read more.
   - When the docker run command end with a container inner command,
    the CMD instruction ensure supervisor keep running in the foreground will not be execute,
    instead of execute your container inner command,
    you would better ensure your container inner command include it.
    eg:
```lang=Dockerfile
 docker run --name smsdove-manager -p 5179:5179 -itd  ivuex/smsdove-manager:latest /bin/sh -c \
  "supervisord --nodaemon -c /etc/supervisord.conf"
```    

# Good Luck !
