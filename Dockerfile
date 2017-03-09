FROM alpine:latest

RUN apk --no-cache add privoxy tor runit

EXPOSE 8118

COPY service /etc/service/

COPY torvariables.sh /home/

RUN addgroup -S dockerusers && adduser -S -G dockerusers dockeruser

RUN chown -R dockeruser /etc/service && chgrp -R dockerusers /etc/service

USER dockeruser

ENTRYPOINT /home/torvariables.sh ; runsvdir /etc/service
