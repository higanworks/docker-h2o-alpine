FROM busybox
ADD build/h2o /bin/h2o
CMD ["/bin/sh"]
