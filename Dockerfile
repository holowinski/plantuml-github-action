FROM openjdk:16-alpine

ENV PLANTUML_VERSION 1.2020.22
ENV LANG en_US.UTF-8
RUN apk add --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
    && apk del curl


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
