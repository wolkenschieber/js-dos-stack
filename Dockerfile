FROM alpine AS build

ARG GAME_URL
ARG GAME_PATH
ARG GAME_ARGS

RUN \
    apk add --no-cache curl unzip zip

WORKDIR /game
# Download and extract game
RUN \
    curl -o game.zip $GAME_URL  \
    && unzip game.zip \
    && rm game.zip

COPY include/dosbox.conf .jsdos/dosbox.conf
# Add GAME_PATH and GAME_ARGS to autoexec
RUN \
    echo "cd ${GAME_PATH}"  >> .jsdos/dosbox.conf \
    && echo "${GAME_ARGS}"  >> .jsdos/dosbox.conf 
# Create js-dos bundle
RUN \
    zip -r game.jsdos .

# Prepare js-dos site
WORKDIR /site
RUN \
    apk add --no-cache curl \
    && curl -O https://v8.js-dos.com/latest/js-dos.js \
    && curl -O https://v8.js-dos.com/latest/js-dos.css


FROM node:16-alpine AS run

WORKDIR /site
RUN \
    npm install -g serve

COPY --from=build /site .
COPY --from=build /game/game.jsdos .
COPY include/index.html .

ENTRYPOINT ["npx", "serve", "-l", "tcp://0.0.0.0:8000"]
