FROM moul/liquidsoap
ADD ./config.liq /config/config.liq
USER nobody
CMD ["liquidsoap", "/config/config.liq"]