FROM openjdk:16-alpine

ARG PLANTUML_VERSION

ENV LANG=en_US.UTF-8
RUN apk add --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
  && mkdir /app \
  && curl -L https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-mit-${PLANTUML_VERSION}.jar -o /app/plantuml.jar \
  && apk del curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
