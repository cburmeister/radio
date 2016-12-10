#!/usr/bin/liquidsoap

source = playlist(
    '/data/playlist.txt',
    reload=1,
    reload_mode='rounds'
)

output.icecast(
    %mp3,
    host=getenv('ICECAST_PORT_8000_TCP_ADDR'),
    port=int_of_string(getenv('ICECAST_PORT_8000_TCP_PORT')),
    password=getenv('ICECAST_ENV_ICECAST_SOURCE_PASSWORD'),
    mount='stream',
    name='Midnight Athletics Radio',
    genre='House',
    description='All vinyl, all the time.',
    url='http://midnightathletics.com',
    fallible=true,
    source
)
