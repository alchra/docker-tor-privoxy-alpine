# tor-gateway

Based on https://hub.docker.com/r/rdsubhas/tor-privoxy-alpine/
Original [blog post](https://medium.com/@rdsubhas/docker-image-with-tor-privoxy-and-a-process-manager-under-15-mb-c9e344111b61)


```
docker run -d -p 8118:8118 rdsubhas/tor-privoxy-alpine
curl --proxy http://localhost:8118 http://api.ipify.org/?format=json
```

## Known Issues

* When running in interactive mode, pressing Ctrl+C doesn't cleanly exit. For now, run it in detached mode (`-d`). Calling `docker stop` cleanly exits though.
