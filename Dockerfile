ARG FILE_NAME

FROM docker.elastic.co/kibana/kibana:${FILE_NAME}

ARG FILE_NAME

WORKDIR /usr/share/kibana

RUN mkdir pluginBuild

COPY ./dist/ pluginBuild/

RUN /usr/share/kibana/bin/kibana-plugin install file:///usr/share/kibana/pluginBuild/customKibanaTheme-${FILE_NAME}.zip
RUN /usr/share/kibana/bin/kibana --optimize
