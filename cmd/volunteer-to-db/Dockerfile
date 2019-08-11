FROM golang:1.12 AS golang-build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build -mod=vendor -o volunteer-to-db cmd/volunteer-to-db/main.go

FROM alpine:3.8
RUN apk add --no-cache ca-certificates
COPY --from=golang-build /build/volunteer-to-db /

EXPOSE 8000

CMD ["/volunteer-to-db"]
