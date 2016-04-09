
https://hub.docker.com/r/higanworks/h2o-alpine/

## Create binary

```
$ docker build -t local/build-h2o -f Dockerfile.build .
#(DEBUG) $ docker run -it --rm -v `pwd`/build:/build local/build-h2o /bin/bash
$ docker run --rm -v `pwd`/build:/build local/build-h2o cp /h2o/h2o /build/
$ docker run --rm -v `pwd`/build:/build local/build-h2o cp -r /h2o/share /build/
```

## Add to alpine

```
$ docker build -t local/h2o-alpine -f Dockerfile .
```

## Run

```
$ docker run -it --rm local/h2o-alpine
# ./h2o --version
h2o version 1.7.1
OpenSSL: LibreSSL 2.2.6
mruby: YES
```

## Config Example

```
user: nobody
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


## [Releases?](https://github.com/higanworks/docker-h2o-alpine/releases)

There are static binaries. They are just backup for me, but you can run on any 64bit Linux, maybe.
