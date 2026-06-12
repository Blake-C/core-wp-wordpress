# Changelog

All notable changes to this image will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Image tags follow the pattern `php{PHP_VERSION}-{MAJOR}.{MINOR}.{PATCH}`.

## [Unreleased]

## [php8.4-1.1.0] - 2026-06-11

### Changed
- Rebuilt on `wordpress:php8.4-fpm-alpine`, now bundling WordPress 7.0 (up from 6.9.4), with `apk upgrade` re-applied for the latest Alpine security patches.
- Updated XDebug 3.4.2 → 3.4.7.

## [php8.4-1.0.0] - 2026-04-30

### Added
- Initial release based on `wordpress:php8.4-fpm-alpine`
- `apk upgrade` applied at build time to patch known CVEs
- XDebug 3.4.2 installed (configuration left to per-project Dockerfiles)
