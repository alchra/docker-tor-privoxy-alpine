FROM alpine:latest

RUN apk --no-cache add privoxy tor runit

EXPOSE 8118

RUN addgroup -S dockerusers && adduser -S -G dockerusers dockeruser

COPY service /etc/service/

RUN chown -R dockeruser /etc/service && chgrp -R dockerusers /etc/service

USER dockeruser

CMD ["runsvdir", "/etc/service"]
