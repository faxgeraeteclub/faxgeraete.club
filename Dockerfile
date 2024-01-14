FROM alpine:3.19.0 as hugo-build

RUN apk add hugo

COPY src /tmp/hugo-build/

WORKDIR /tmp/hugo-build/

RUN hugo

FROM scratch AS output
COPY --from=hugo-build /tmp/hugo-build/ /