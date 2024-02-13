FROM alpine:latest
RUN apk add --no-cache privoxy
RUN find /etc/privoxy/ -type f -name "*.new" -exec sh -c 'mv "$0" "${0%.new}"' {} \;
COPY --chown=privoxy:privoxy --chmod=0640 config /etc/privoxy/
EXPOSE 8118
USER privoxy
CMD ["/usr/sbin/privoxy", "--no-daemon", "/etc/privoxy/config"]
