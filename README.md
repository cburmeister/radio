radio
=====

Internet radio with [liquidsoap](http://savonet.sourceforge.net/) and
[icecast](http://icecast.org/) wrapped with [docker](https://www.docker.com/).

---

This is essentially a `docker-compose.yml` with two services;
[moul/icecast](https://hub.docker.com/r/moul/icecast/) and
[moul/liquidsoap](https://hub.docker.com/r/moul/liquidsoap/).

The idea is that you provide two things:
- A directory of audio and playlists
- A file which describes how to stream the audio

## Configuration

The following environment variables are *required*:

| Name                      | Purpose                                                       |
|---------------------------|---------------------------------------------------------------|
| `ICECAST_ADMIN_PASSWORD`  | Used for administration functions.                            |
| `ICECAST_RELAY_PASSWORD`  | Used when a slave requests the list of streams to relay.      |
| `ICECAST_SOURCE_PASSWORD` | Used by sources to connect to Icecast.                        |
| `LIQUIDSOAP_CONFIG`       | An absolute path to the `liquidsoap` configuration.           |
| `LIQUIDSOAP_DATA`         | An absolute path to a directory of audio files and playlists. |

## Deployment

Start up the service with `docker-compose up -d`.

Once running you can view the `icecast` interface at `:8000`.
