FROM debian:jessie

MAINTAINER Werner Beroux <werner@beroux.com>

# Default configuration
ADD conf/mopidy.conf /var/lib/mopidy/.config/mopidy/mopidy.conf

# Start helper script
ADD entrypoint.sh /entrypoint.sh

# Official Mopidy install for Debian/Ubuntu along with some extensions
# (see https://docs.mopidy.com/en/latest/installation/debian/ )
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl \
        gstreamer0.10-alsa \
	build-essential \
        python-crypto \
	python-dev \
	python-pip \
	python-pyasn1 \
	python-cffi \
	libffi-dev \
 && curl -L https://apt.mopidy.com/mopidy.gpg -o /tmp/mopidy.gpg \
 && curl -L https://apt.mopidy.com/mopidy.list -o /etc/apt/sources.list.d/mopidy.list \
 && apt-key add /tmp/mopidy.gpg \
 && pip install -U pip

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        mopidy \
        mopidy-soundcloud \
        mopidy-spotify \
 && pip install -U six pyasn1 cffi \
 && pip install \
    	Mopidy-API-Explorer \
        Mopidy-Moped \
        Mopidy-GMusic \
        Mopidy-YouTube \
	Mopidy-Spotmop \	
	Mopidy-MusicBox-Webclient \
	Mopidy-Party \
	Mopidy-WebSettings \
 && apt-get purge --auto-remove -y \
        curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache \
 && chown mopidy:audio -R /var/lib/mopidy/.config \
 && chown mopidy:audio /entrypoint.sh
# && touch /app/mopidy.conf && chown mopidy:audio /app/mopidy.conf

# Run as mopidy user
USER mopidy

VOLUME /var/lib/mopidy/local
VOLUME /var/lib/mopidy/media
VOLUME /app

EXPOSE 6600
EXPOSE 6680
EXPOSE 6681

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/mopidy"]
