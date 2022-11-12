FROM golang:alpine AS builder

# image for build stage
WORKDIR /build
ADD go.mod .
COPY main.go .
RUN go build -o app main.go

# image for deploy stage
FROM alpine
WORKDIR /build
COPY --from=builder /build/app /build/app
CMD ["./app"]