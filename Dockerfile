FROM klakegg/hugo:ext-alpine AS builder
COPY . /src
RUN cd /src/hugo-theme-academic-cv && hugo --minify

FROM caddy:latest
COPY --from=builder /src/hugo-theme-academic-cv/public /srv
