# Mesosphere Marathon on Container

## Usage
- build image
```
git clone https://github.com/dockerq/docker-marathon.git && cd docker-marathon
docker build -t adolphlwq/docker-marathon(or some image name else) .
```

- run image
**Note**: Marathon needs zookeeper and mesos,so you first make sure you have `zookeeper` and `mesos` run.
```
docker run -d adolphlwq/docker-marathon marathon --zk zk_url --mesos mesos_url
```

## Config
You can refer to [marathon official docs about config](http://mesosphere.github.io/marathon/docs/command-line-flags.html).
