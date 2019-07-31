FROM golang:1.10 as build

WORKDIR /go/src/github.com/charlieegan3/cloud-billing-exporter

COPY . .

RUN CGO_ENABLED=0 go build -o /cloud-billing-exporter

FROM gcr.io/distroless/base
COPY --from=build /cloud-billing-exporter /

CMD ["/cloud-billing-exporter"]
