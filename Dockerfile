FROM busybox:ubuntu-14.04
ADD build/h2o /sbin/h2o
CMD ["/bin/sh"]
