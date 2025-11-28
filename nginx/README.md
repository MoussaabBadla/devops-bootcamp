# NGINX , cheat sheet and snippets

This folder contains workshop materials and quick references for NGINX used in this repository.

Files and purpose
- `nginx/nginx-workshop-slides.md` — Marp slide deck used for the workshop (presentation).
- `nginx/nginx-workshop-slides.pdf` — exported PDF of the slides.
- `nginx/nginx-cheatsheet.md` — the main cheat sheet (beginner → advanced). It contains examples and instructions for running NGINX locally and in Docker. The cheat sheet intentionally omits SSL/TLS certificate examples per the workshop scope.
- `nginx/snippets/` — a collection of small, reusable `include` files you can copy or mount into `/etc/nginx/snippets/` inside a container or use directly on the host. See usage examples in the cheat sheet.

Snippets included (brief)
- `proxy-headers.conf` — forward Host and client IP headers to backends.
- `gzip-params.conf` — recommended gzip settings for `http {}`.
- `health-check.conf` — simple `/health` endpoint for LB health checks.
- `cache.conf` — `proxy_cache_path` and example usage to enable caching.
- `security-headers.conf` — typical security headers (CSP, X-Frame-Options, etc.).
- `maintenance.conf` — file-based maintenance mode helper.

How to use the snippets

1) For containerized testing, mount the repo `snippets/` into the container and include them from `/etc/nginx/snippets/`.

Example (run container with mounts):

```bash
docker run -d --name nginx-site \
  -p 80:80 \
  -v $(pwd)/nginx/conf.d:/etc/nginx/conf.d:ro \
  -v $(pwd)/nginx/snippets:/etc/nginx/snippets:ro \
  nginx:stable
```

2) In your server or location block, include the needed snippets:

```nginx
include /etc/nginx/snippets/proxy-headers.conf;
include /etc/nginx/snippets/security-headers.conf;
```

Testing and common commands
- `nginx -t` — validate config (or `docker exec <container> nginx -t` for containerized NGINX).
- `nginx -s reload` — graceful reload (or run inside container with `docker exec`).
- Use `curl -I` and `docker logs -f` to validate behavior.