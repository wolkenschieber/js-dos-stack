# js-dos-stack

## Abstract

This project provides a solution for running MS-DOS programs and games in a web environment by leveraging [js-dos](https://js-dos.com/overview.html). It packages the js-dos emulator and your MS-DOS files into a Docker container, allowing for easy deployment and access through a web browser. Users can simply place their DOS programs or games into a designated directory, and the Dockerized environment will serve these applications through a web interface, making it straightforward to run and interact with classic software without additional setup or configuration.


## Build

### Args

`GAME_URL`: URL to download program
`GAME_PATH`: Working dir of program in archive
`GAME_ARGS`: Executable of program

### Command

```sh
docker build --build-arg GAME_URL=http://locahost:7999/Asterix__Obelix_1996.zip --build-arg GAME_PATH=AsterixO/OBELIX --build-arg GAME_ARGS=OBELIX.EXE -t js-dos-stack .
```

## Run

```sh
 docker run --rm -p 8000:8000 js-dos-stack
```