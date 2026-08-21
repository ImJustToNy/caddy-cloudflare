# Caddy + caddy-dns/cloudflare, built the way the official caddy image docs describe.
# Both stages come from the official library image; only the binary is replaced.
ARG CADDY_VERSION=2.11.4

FROM caddy:${CADDY_VERSION}-builder-alpine AS builder
# Pinned on purpose: a plugin bump is a deliberate commit, not a side effect of a rebuild.
ARG CLOUDFLARE_PLUGIN_VERSION=v0.2.4
RUN xcaddy build --with github.com/caddy-dns/cloudflare@${CLOUDFLARE_PLUGIN_VERSION}

FROM caddy:${CADDY_VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
