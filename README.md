# caddy-cloudflare

Official [`caddy`](https://hub.docker.com/_/caddy) image plus the
[`caddy-dns/cloudflare`](https://github.com/caddy-dns/cloudflare) module, built by
GitHub Actions in this repo. Nothing else is added or patched.

    ghcr.io/imjusttony/caddy-cloudflare:latest
    ghcr.io/imjusttony/caddy-cloudflare:<caddy-version>

## How it updates

`build.yml` runs daily. It builds and pushes when

- the latest upstream Caddy release has no tag here yet, or
- it is Sunday (refreshes the Alpine base for CVE fixes even without a Caddy release), or
- it was started by hand with `force`.

The DNS module version is pinned in the `Dockerfile` (`CLOUDFLARE_PLUGIN_VERSION`).
Bump it on purpose, then run the workflow with `force`.

## Verify an image

    gh attestation verify oci://ghcr.io/imjusttony/caddy-cloudflare:latest --repo ImJustToNy/caddy-cloudflare

## Build locally (e.g. during disaster recovery)

    docker build --build-arg CADDY_VERSION=2.11.4 -t caddy-cloudflare:local .
