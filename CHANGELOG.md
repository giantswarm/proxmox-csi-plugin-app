# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Update upstream proxmox-csi-plugin chart to v0.21.0.

### Fixed

- The `helm.sh/chart` label is valid for long chart versions: the 63-character cut trims the whole trailing run of `-`, `.` and `_`.
- Fix changelog generation script.

### Added

- Run the sync script automatically on Renovate vendir branches and push the result for review.
- Add a check which fails a pull request if the sync script was not run.

- Disable Helm image reference verification in CI config.
- Add Github action to create an issue in `giantswarm/giantswarm` for Team Rocket on vendir updates.
- Revert 'Disable Helm image reference verification in CI config'.
- Stop overriding appVersion in chart metadata.
- Ensure node/controller images use the upstream release version as their tag.
- Use Linux tools to manipulate chart label instead of an inscrutable Perl command.
- Remove unnecessary files from the chart dir.
- Update architect to v10.14.8 (giantswarm/proxmox-csi-plugin-app#58)
- Update carvel-dev/vendir to v0.46.3 (giantswarm/proxmox-csi-plugin-app#68)

### Fixed

- The `helm.sh/chart` label is valid for long chart versions: the 63-character cut trims the whole trailing run of `-`, `.` and `_`.
- Clean up the mess in `sync/sync.sh` caused by the chart label change.

## [0.2.0] - 2026-08-10

### Changed

- chore(deps): update vendir https://github.com/sergelogvinov/proxmox-csi-plugin to v0.20.0
- Generally improve chart sync hygiene.

## [0.1.0] - 2026-08-07

### Changed

- Update chart to upstream `v0.19.1`.
- Update chart to upstream `v0.18.0`.
- changed: `app.giantswarm.io` label group was changed to `application.giantswarm.io`
- Update Proxmox app icon to `https://s.giantswarm.io/app-icons/proxmox/2/light.svg` (replacing the upstream third-party icon).
- Update Renovate config to disable image tag updates in values.yaml

[Unreleased]: https://github.com/giantswarm/proxmox-csi-plugin-app/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/giantswarm/proxmox-csi-plugin-app/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/giantswarm/proxmox-csi-plugin-app/releases/tag/v0.1.0
