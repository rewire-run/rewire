<h1 align="center">
  <a href="https://rewire.run/">
    <img alt="rewire" src="https://rewire.run/brand/rewire-banner.png">
  </a>
</h1>

Drop-in ROS 2 bridge for [Rerun](https://rerun.io) — no ROS 2 runtime or build required.

Stream live ROS 2 topics to the Rerun viewer for real-time visualization. Supports 74 built-in
ROS 2 type mappings out of the box, with extensibility for custom messages.

## Features

- Zero ROS 2 dependency — pure Rust, no colcon or ament needed
- Automatic DDS and Zenoh discovery
- 74 built-in type mappings across the common ROS 2 interface packages
- Custom message support via JSON5 mappings
- Real-time diagnostics (hz, bytes/sec, drops, latency)
- Topic filtering with glob patterns

## Install

See the [documentation](https://rewire.run) for installation instructions and usage.

### Nix

This repository is a flake.

```bash
nix run github:rewire-run/rewire -- --version   # try it, installs nothing
nix profile add github:rewire-run/rewire        # install for the current user
```

On NixOS, add it as an input and pull the package into your system config:

```nix
{
  inputs.rewire.url = "github:rewire-run/rewire";

  # in your nixosConfiguration modules
  environment.systemPackages = [ inputs.rewire.packages.${system}.rewire ];
}
```

An overlay is also exported, if you would rather reach it as `pkgs.rewire`:

```nix
nixpkgs.overlays = [ inputs.rewire.overlays.default ];
nixpkgs.config.allowUnfree = true;
```

rewire is unfree. The commands and the `packages` output above allow it for their own nixpkgs
instance and need nothing from you. The overlay puts rewire on your `pkgs`, so that route alone
needs `allowUnfree` in your own configuration.

Binaries come from this repository's releases; nothing is built from source. Supported systems are
listed in [`sources.json`](sources.json), which is regenerated on every release.

## Related Repositories

| Repository | Description |
|------------|-------------|
| [viewer](https://github.com/rewire-run/viewer) | Rewire viewer based on Rerun API for bridge introspection |
| [extras](https://github.com/rewire-run/extras) | Shared Rerun archetypes and types for the Rewire ecosystem |
| [docker](https://github.com/rewire-run/docker) | Docker images for Rewire |

### Examples

| Repository | Description |
|------------|-------------|
| [turtlebot3-example](https://github.com/rewire-run/turtlebot3-example) | TurtleBot3 simulation visualized in Rerun |
| [camera-example](https://github.com/rewire-run/camera-example) | ROS 2 camera/image streaming to Rerun |
| [custom-mappings-example](https://github.com/rewire-run/custom-mappings-example) | Custom message mapping with JSON5 |

## Community

This repository hosts [discussions](https://github.com/rewire-run/rewire/discussions) and
[issues](https://github.com/rewire-run/rewire/issues) for rewire. Bug reports, feature requests,
and questions are welcome.
