# js-dos-stack

## Layout

## Build

```sh
docker build --build-arg GAME_URL=http://locahost:7999/Asterix__Obelix_1996.zip --build-arg GAME_PATH=AsterixO/OBELIX --build-arg GAME_ARGS=OBELIX.EXE -t js-dos-stack .
```

## Run

```sh
 docker run --rm -p 8000:8000 js-dos-stack
```