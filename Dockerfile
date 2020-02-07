# Build ont top of golang 1.13-alpine
FROM golang:1.13-alpine AS builder

# Set the working directory for the following steps
WORKDIR /app

# Turn off CGo
ENV CGO_ENABLED=0

# Add git??
RUN apk --update add git

# Adding ca-certificates
RUN apk --update add ca-certificates


# Download the dependencies first to improve caching
COPY vendor .
COPY . .

## Create a directory to hold the api service aplication within the container
#RUN mkdir /app

#Add all the files from this repo into the app folder within the container
ADD . /app/

#Run the go project
RUN CGO_ENABLED=0 go build -mod=vendor -o sms .

#
CMD ["/app/main"]