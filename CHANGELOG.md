# Changelog

All notable changes to this image will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Image tags follow the pattern `php{PHP_VERSION}-{MAJOR}.{MINOR}.{PATCH}`.

## [Unreleased]

## [php8.4-1.2.1] - 2026-09-13

### Changed
- Rebuilt on the `wordpress:php8.4-fpm-alpine` base, which now bundles WordPress 7.1 (up from 7.0) on PHP 8.4.25 and Alpine 3.24.1, with `apk upgrade` re-applied for the latest Alpine security patches. XDebug stays at 3.5.3, and the Dockerfile is unchanged.
- Pinned every action in the publish workflow to a release commit SHA, since a tag or branch reference can be moved to different code after it is reviewed:
  - `actions/checkout` v4 to v7.0.1
  - `docker/setup-buildx-action` v3 to v4.3.0
  - `docker/login-action` v3 to v4.6.0
  - `docker/metadata-action` v5 to v6.2.0
  - `docker/build-push-action` v6 to v7.3.0
  - `snyk/actions/docker` from the `master` branch to v1.0.0

## [php8.4-1.2.0] - 2026-07-05

### Changed
- Security rebuild on the `wordpress:php8.4-fpm-alpine` base (Alpine 3.24.1, PHP 8.4.23), re-applying `apk upgrade` to clear the latest base-image CVEs flagged by Snyk. WordPress remains at 7.0.
- Updated XDebug 3.4.7 → 3.5.3.

## [php8.4-1.1.1] - 2026-06-11

### Changed
- Security rebuild on the updated `wordpress:php8.4-fpm-alpine` base (now Alpine 3.24, up from 3.23). `apk upgrade` clears 41 base-image CVEs flagged by Snyk — including a High in `libxml2` (Type Confusion) plus issues in `openssl`, `imagemagick`, `libcurl`, and `libpng`. No Dockerfile change.

## [php8.4-1.1.0] - 2026-06-11

### Changed
- Rebuilt on `wordpress:php8.4-fpm-alpine`, now bundling WordPress 7.0 (up from 6.9.4), with `apk upgrade` re-applied for the latest Alpine security patches.
- Updated XDebug 3.4.2 → 3.4.7.

## [php8.4-1.0.0] - 2026-04-30

### Added
- Initial release based on `wordpress:php8.4-fpm-alpine`
- `apk upgrade` applied at build time to patch known CVEs
- XDebug 3.4.2 installed (configuration left to per-project Dockerfiles)
