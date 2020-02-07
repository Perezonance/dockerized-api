#Build ont top of golang 1.13-alpine
FROM golang:1.13-alpine AS builder

#Set the working directory for the following steps
WORKDIR /app

# Adding ca-certificates
RUN apk --update add ca-certificates

##create a directory to hold the api service aplication within the container
#RUN mkdir /app

#Add all the files from this repo into the app folder within the container
ADD . /app/

#Run the go project
RUN go build -o main .

#
CMD ["/app/main"]