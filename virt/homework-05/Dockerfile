FROM docker.mirror.hashicorp.services/golang:alpine as build

FROM scratch as artifact
COPY --from=build /terraform/ /

FROM build as release