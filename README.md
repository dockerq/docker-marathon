##usage
- build image
```
git clone https://github.com/DHOPL/docker-marathon.git
cd docker-marathon
docker build -t adolphlwq/docker-marathon(or some image name else) .
```
- run image
marathon needs zookeeper and mesos,so you first make sure you have `zookeeper` and `mesos` run.
```
docker run -d adolphlwq/docker-marathon
```
- config
As say in [marathon official docs about config](http://mesosphere.github.io/marathon/docs/command-line-flags.html)
you can `docker exec` to marathon container and start marathon with command-line-flags or using env
