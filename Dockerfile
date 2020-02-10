FROM golang:1.13-alpine

RUN mkdir /app

COPY . /app/

WORKDIR /app

RUN apk --update add ca-certificates

RUN go build -mod=vendor -o main .

CMD ["/app/main"]


## Build ont top of golang 1.13-alpine
#FROM golang:1.13-alpine
#
#RUN mkdir /app
#
## Set the working directory for the following steps
#WORKDIR /app
#
## Turn off CGo
#ENV CGO_ENABLED=0
#
## Adding ca-certificates
#RUN apk --update add ca-certificates
#
#
## Download the dependencies first to improve caching
#COPY vendor .
#COPY . .
#
### Create a directory to hold the api service aplication within the container
##RUN mkdir /app
#
##Copy all the files from this repo into the app folder within the container
#COPY . /app/
#
##Run the go project
#RUN CGO_ENABLED=0 go build -mod=vendor -o sms .
#
##
#CMD ["\app"]