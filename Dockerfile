FROM erikvl87/languagetool:latest
# (Optional) reduce memory, prewarm, etc.
ENV Java_Xmx=2g \
    langtool_pipelinePrewarming=true
# Render expects the app to listen on $PORT; LT listens on 8010.
# Use a tiny wrapper to forward $PORT -> 8010 if needed:
CMD ["bash", "-lc", "socat TCP-LISTEN:${PORT:-10000},fork TCP:127.0.0.1:8010 & \
                      /bin/bash /entrypoint.sh"]
