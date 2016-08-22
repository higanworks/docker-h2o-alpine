
https://hub.docker.com/r/higanworks/h2o-alpine/

## Create binary

```
$ docker build -t local/build-h2o -f Dockerfile.build .
## (DEBUG) $ docker run -it --rm -v `pwd`/build:/build local/build-h2o /bin/bash
# ./h2o --version
# ./mruby/host/bin/mruby --version
$ docker run --rm -v `pwd`/build:/build local/build-h2o cp /h2o/h2o /build/
$ docker run --rm -v `pwd`/build:/build local/build-h2o cp -r /h2o/share /build/
```

## Add to alpine

```
$ docker build -t local/h2o-alpine -f Dockerfile .
```

## Run

```
$ docker run -it --rm -p 8080:80 -p 8443:443 local/h2o-alpine
# h2o --version
h2o version 2.0.2
OpenSSL: LibreSSL 2.2.7
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

### mruby

```
user: nobody
listen:
  port: 80
hosts:
  default:
    paths:
      "/":
        mruby.handler: |
          Proc.new do |env|
            [200, {'content-type' => 'text/plain'}, ["Hello world\n"]]
          end
access-log: /dev/stdout
```



## [Releases?](https://github.com/higanworks/docker-h2o-alpine/releases)

There are static binaries. They are just backup for me, but you can run on any 64bit Linux, maybe.
