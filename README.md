# Description :page_facing_up:
This is an example for running multiple services inside a single Docker container and handling their graceful termination.

# Information :information_source:


# Instructions :blue_book:
## Build the container
`docker build --compress --force-rm -t graceful-termination .`
## Run the container
`docker run graceful-termination`
### Expected output:
```
running p1
running p2
running p1
running p2
running p1
running p2
...
```
## Stop the container
`docker stop <CONTAINER_ID>`
> By using [docker stop](https://docs.docker.com/engine/reference/commandline/stop/) command, the main process inside the container will receive SIGTERM, and after a grace period (10 seconds by default), SIGKILL.
### Expected output:
```
...
p1 terminating
running p2
running p2
p2 terminating
All processess terminated successfully
```
