#!/usr/bin/liquidsoap
set("log.file.path", "/dev/null")
set("log.stdout", true)
set("server.telnet", false)
set("harbor.bind_addr","0.0.0.0")

# tweak these values if you have lag, skipping, buffer underrun etc
# set("frame.duration",0.04)
# set("root.max_latency",60.)

live = mksafe(input.harbor(port=8800, password="aaa", "/input"))
output.dummy(fallible=true, live)
output.harbor(%mp3(bitrate=160), port=8800, mount="/mopidy", live)

output.icecast(%vorbis, host = "icecast", port = 8000, password = "aaa", mount = "stream.ogg", mksafe(playlist("playlist.m3u")))