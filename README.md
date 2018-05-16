# blockstack-react example docker image

This is an example of a react based blockstack app development environment in a docker container. It is based around the tutorial at https://blockstack.org/tutorials/multi-player-storage

## Requirements

[docker-engine](https://docs.docker.com/engine/installation/)

[make](https://www.gnu.org/software/make/)

## Install NPM requirements for local development

```
make install
```

## Run local development environment

```
make run
```

The dev app will run at http://localhost:8080. `./` will be mounted into the container so changes to code can be tested live.


## Shell on running dev container

```
make shell
```

## Usage

To run hello-blockstack listening on port 8080 run:

```
docker run -d --rm -p 8080:8080 --name blockstack-react dappalachia/blockstack-react
```
