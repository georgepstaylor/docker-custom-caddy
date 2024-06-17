FROM caddy:2.8.1-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@v1.1.29 --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
