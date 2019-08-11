FROM golang:1.12 AS golang-build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build -mod=vendor -o volunteer-to-api cmd/volunteer-to-api/main.go

FROM alpine:3.8
RUN apk add --no-cache ca-certificates
COPY --from=golang-build /build/volunteer-to-api /

EXPOSE 80

CMD ["/volunteer-to-api"]
