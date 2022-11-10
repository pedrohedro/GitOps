FROM golang:1.19 as build
WORKDIR /app
COPY . .
RUN  go build -o server

FROM scratch
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT ["./server"]

#pedrohedro/gitops-fc:latest