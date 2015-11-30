
## Create binary

```
$ docker build -t local/build-h2o -f Dockerfile.build .
#(DEBUG) $ docker run -it --rm -v `pwd`/build:/build local/build-h2o /bin/bash
$ docker run --rm -v `pwd`/build:/build local/build-h2o cp /h2o/h2o /build/
```

## Add to busybox

```
$ docker build -t local/h2o-busybox -f Dockerfile .
```

## Run

```
$ docker run -it --rm local/h2o-busybox

BusyBox v1.21.1 (Ubuntu 1:1.21.0-1ubuntu1) built-in shell (ash)
Enter 'help' for a list of built-in commands.

~ # h2o --version
h2o version 1.5.4
OpenSSL: LibreSSL 2.2.4
```

## Config Example

Should set root to user.

```
user: root
listen:
  port: 443
  ssl:
    certificate-file: /conf/server.crt
    key-file: /conf/server.key
hosts:
   default:
    paths:
      "/":
        file.dir: /vhosts/default
    access-log: /dev/stdout
```
