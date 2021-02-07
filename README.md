# Info

Nomad image to run in dockerized way, same as [Consul](https://hub.docker.com/_/consul) image.

# Usage

## Local

```
make <tab>
```

## Production

Disclaimer: use this approach in production on your own risk.

Scheduler would heavily rely on `dockerd` and `containerd` stability in this approach.

```
docker run -d \
  --name nomad \
  --privileged \
  --network host \
  --cap-add sys_admin \
  -v /etc/nomad:/etc/nomad:ro \
  -v /var/lib/nomad:/var/lib/nomad \
  -v /var/run/docker.sock:/var/run/docker.sock \
  agent -config=/etc/nomad
```
