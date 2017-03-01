# tor-gateway

gateway to Tor network
uses alpine, privoxy and runit

```
docker run -d --name Tor-Gateway -p 8118:8118 alchra/tor-gateway

curl --proxy http://localhost:8118 http://api.ipify.org/?format=json
```

Read the accompanying [blog post](https://medium.com/@rdsubhas/docker-image-with-tor-privoxy-and-a-process-manager-under-15-mb-c9e344111b61) for more details.

## Configuration

It is possible to define configuration options for the Tor daemon using env variables. Just define a variable prefixed with `TOR_`, as shown in this example:

```
docker run -d -p 8118:8118 -p 9050:9050 -e TOR_ExitNodes="{de}" rdsubhas/tor-privoxy-alpine
```

The `torrc` will now contain:

```
ExitNodes {de}
```

## Known Issues

* When running in interactive mode, pressing Ctrl+C doesn't cleanly exit. For now, run it in detached mode (`-d`). Calling `docker stop` cleanly exits though.


Based on https://hub.docker.com/r/rdsubhas/tor-privoxy-alpine/
Original [blog post](https://medium.com/@rdsubhas/docker-image-with-tor-privoxy-and-a-process-manager-under-15-mb-c9e344111b61)