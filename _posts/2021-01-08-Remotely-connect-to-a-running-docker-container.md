---
layout: post
title: Remotely connect to a running docker container
date: 2021-01-08 16:51:53
---
![Take control](/assets/images/5wf8ffut3p3gz8nkpql6.jpeg)

A moment ago, when using Jenkins at `$work`, I discovered that I could connect *remotely* to a running docker container.

It is VERY handy ! Thanks to it you can deeply debug what's wrong with a continuous integration run. There is even a "Pause" button (in Jenkins) that allows you to inspect a particular step or just avoid you the rush on fast runs.

And honestly, the first time I experimented, I found it a bit "magic" ! :grin:

Below is a detailed explanation on how to make the magic happens :smiley:

## Expose tcp connection on dockerd side
To be able to connect remotely, you have to start dockerd with the `-H tcp://0.0.0.0:2375` option to expose the tcp socket.

Edit your docker systemd service to add a tcp socket :
```bash
dockerd -H fd:// -H tcp://0.0.0.0:2375 --containerd=/run/containerd/containerd.sock
```

Reload service config:
```bash
$ systemctl daemon-reload
``` 

And restart `dockerd`:
```bash
$ systemctl restart docker
```

## Run a sample container
I will take a small `alpine` and just run a "never ending script" inside:

Write a Dockerfile:
```dockerfile
FROM alpine

COPY w.sh w.sh
CMD ["./w.sh"]
```

And a while/sleep loop `w.sh` to maintain it alive:
```bash
#!/bin/sh

while true; do sleep 2 ; echo "alive"; done
```

Build the image:
```bash
$ docker build . -t persist
```

And finally, start the container:
```bash
$ docker run -itd persist
f70b46b77105700d3420b88323d07edff9146f435a13c73029efd92197ef9030
```

## Connect from client
Now on your laptop (for instance) you can now connect to your docker container simply like this:
```bash
$  docker -H tcp://the-url-or-ip exec -ti f70b46b77105700d3420b88323d07edff9146f435a13c73029efd92197ef9030 /bin/sh
```

And you get your shell:
```bash
/ #
```

Tadaaa !

![Tadaaa](/assets/images/yhce6495warb8aj8zf9b.jpeg)
