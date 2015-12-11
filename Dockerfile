FROM alpine
RUN apk --update add perl openssl \
     && rm -rf /var/cache/apk/*
ADD build/h2o /usr/local/bin/h2o
ADD build/share/* /usr/local/share/h2o/
WORKDIR /usr/local
CMD ["/bin/sh"]
