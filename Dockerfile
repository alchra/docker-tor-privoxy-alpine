FROM alpine:latest

RUN apk --no-cache add privoxy tor runit

EXPOSE 8118

COPY service /etc/service/

CMD ["runsvdir", "/etc/service"]
