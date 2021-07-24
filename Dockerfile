FROM golang:1.15 as estagio1
WORKDIR /app/fullcycle-docker
COPY . . 
RUN GOOS=linux go build -ldflags="-w -s"

FROM scratch
WORKDIR /app/fullcycle-docker
COPY --from=estagio1 /app/fullcycle-docker .
ENTRYPOINT ["./fullcycle-docker"]
