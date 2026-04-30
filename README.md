# core-wp-wordpress

A security-patched WordPress PHP-FPM Alpine Docker image published to Docker Hub as `digitalblake/core-wp-wordpress`.

Built on top of the official `wordpress:php8.4-fpm-alpine` image with:

- All Alpine packages upgraded at build time (`apk upgrade`) to patch known CVEs
- XDebug installed (not configured — leave `xdebug.ini` to per-project Dockerfiles)

The official WordPress Docker images only rebuild on new WordPress releases. This image rebuilds on a regular cadence and whenever security patches land, so Snyk findings in the base layer are addressed without waiting for upstream.

## Tags

| Tag | Description |
|---|---|
| `php8.4-X.Y.Z` | Pinned build for PHP 8.4 line |
| `php8.4-latest` | Latest build for PHP 8.4 line |
| `latest` | Alias for the current active PHP line |

## Usage in a project Dockerfile

```dockerfile
FROM digitalblake/core-wp-wordpress:php8.4-latest

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY php-opcache-dev.ini /usr/local/etc/php/conf.d/php-opcache.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
```

Project-specific config files (`xdebug.ini`, `php-opcache-dev.ini`, `www.conf`) are intentionally kept out of this image so each project controls its own PHP-FPM tuning and XDebug settings.

## Versioning

Tags use the pattern `php{PHP_VERSION}-{MAJOR}.{MINOR}.{PATCH}`.

- **MAJOR** — PHP major/minor line change (e.g. `php8.4` → `php8.5`)
- **MINOR** — new capability added (e.g. new PHP extension, XDebug version bump)
- **PATCH** — rebuild for security patches only, no functional changes

## Releasing a new version

1. Apply changes to the `Dockerfile`
2. Update `CHANGELOG.md`
3. Commit and push to `main`
4. Tag the commit: `git tag php8.4-X.Y.Z && git push origin php8.4-X.Y.Z`

The GitHub Actions workflow builds and pushes the image to Docker Hub automatically on tag push.

## Rebuilding for security patches (patch release)

No Dockerfile changes are needed for a patch release — just retag and push:

```sh
git tag php8.4-X.Y.Z
git push origin php8.4-X.Y.Z
```

## Requirements

Docker Hub credentials must be stored as repository secrets:

| Secret | Value |
|---|---|
| `DOCKERHUB_USERNAME` | Docker Hub username |
| `DOCKERHUB_TOKEN` | Docker Hub access token (not password) |
