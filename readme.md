# Simple Dockerized REST API

Really basic REST API that has been dockerized


## Installation

Make sure you have Docker desktop installed so you can build the docker image and run it on your kernel.


## Usage
        
The first thing you need to ensure is that your http listener is listening on an empty/unused port and that you map the 
docker container ports to align with this port.

```
docker run -p host-port:container-port
e.g.
docker run -p 8080:8093
```

The exact docker commands I use to build the image and launch the container were:
```
docker build -t my-go-api .

docker run --name api-ctnr -d -p 8080:8093 my-go-api
```
When building the docker image make sure you are in the directory of the project you want to build and don't forget the 
'.' at the end.

I assigned the container API to listen to port 8093(for no particular reason other than for demonstration) mapped to
the host machine's port 8080(default localhost).