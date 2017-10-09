# Dockerfile for Visual Studio code

docker build -t vscode .
./vscode


## setting

xhost local:
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /etc/localtime:/etc/localtime:ro vscode /bin/bash
docker run -it --rm --hostname vscode -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /etc/localtime:/etc/localtime:ro vscode /bin/bash
docker run -it --rm --hostname vscode -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /etc/localtime:/etc/localtime:ro \
-v ${PWD}/config/Code:/home/vs/.config/Code \
-v ${PWD}/config/dot_vscode:/home/vs/.vscode \
vscode

