FROM golang:alpine AS builder

# image for build stage
WORKDIR /build
COPY ./app/ .
RUN go build -o app app.go

# image for deploy stage
FROM alpine
WORKDIR /build
COPY --from=builder /build/app /build/app
CMD ["./app"]