FROM grafana/grafana:latest

USER root
RUN apk update \
    && apk add --no-cache jq

USER grafana
COPY ./dashboards/ /dashboards/
COPY ./datasources/ /datasources/
COPY ./scripted_dashboards/ /usr/share/grafana/public/dashboards/

COPY ./run1.sh /run1.sh

ENTRYPOINT ["bash","-x","/run1.sh"]
