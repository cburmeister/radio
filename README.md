radio
=====

Internet radio with [liquidsoap](http://savonet.sourceforge.net/) and
[icecast](http://icecast.org/) wrapped with [docker](https://www.docker.com/).

---

## Media

First you need a directory of media and a playlist to stream.
```bash
$ tree data
data
├── mix1.mp3
├── mix2.mp3
├── mix3.mp3
└── mix4.mp3
```

> This directory will be mounted as `/data` within the `liquidsoap` container.

Create a `playlist.txt` file containing paths to the mixes you want to stream:
```bash
$ cat data/playlist.txt
data/mix1.mp3
data/mix2.mp3
```

## Configuration

Next you need to set some environment variables for configuration:
```bash
export ICECAST_SOURCE_PASSWORD=somethingsecret
export ICECAST_ADMIN_PASSWORD=somethingsecret
export ICECAST_PASSWORD=somethingsecret
export ICECAST_RELAY_PASSWORD=somethingsecret
export DATA_PATH=data
```

> I stuff this into an `.env` file which is used with
[autoenv](https://github.com/kennethreitz/autoenv) for directory-based
environments.

## Deployment

Now you can begin broadcasting these mixes with `docker-compose up -d`.

Once the services are running you can view the `icecast` interface at `:8000`.

---

Currently i'm running this on a [Digital Ocean](https://www.digitalocean.com/)
droplet but this can run anywhere docker can be run like
[EC2](https://aws.amazon.com/ec2/) or [Linode](https://www.linode.com/).
