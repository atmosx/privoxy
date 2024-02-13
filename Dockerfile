FROM alpine:3.19.1
LABEL privoxy_version="3.0.34-r2"
LABEL base_docker_image_version="alpine-3.19.1"
RUN apk add --no-cache privoxy="3.0.34-r2"
RUN find /etc/privoxy/ -type f -name "*.new" -exec sh -c 'mv "$0" "${0%.new}"' {} \;
COPY --chown=privoxy:privoxy --chmod=0640 config /etc/privoxy/
EXPOSE 8118
USER privoxy
CMD ["/usr/sbin/privoxy", "--no-daemon", "/etc/privoxy/config"]
