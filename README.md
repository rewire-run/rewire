<h1 align="center">
  <a href="https://rewire.run/">
    <img alt="rewire" src="https://rewire.run/brand/rewire-banner.png">
  </a>
</h1>

Drop-in ROS 2 bridge for [Rerun](https://rerun.io) — no ROS 2 runtime or build required.

Stream live ROS 2 topics to the Rerun viewer for real-time visualization. Supports 59 built-in
ROS 2 type mappings out of the box, with extensibility for custom messages.

## Features

- Zero ROS 2 dependency — pure Rust, no colcon or ament needed
- Automatic DDS and Zenoh discovery
- More than 50 built-in type mappings across
- Custom message support via JSON5 mappings
- Real-time diagnostics (hz, bytes/sec, drops, latency)
- Topic filtering with glob patterns

## Install

See the [documentation](https://rewire.run) for installation instructions and usage.

### Nix

This repository is a flake. rewire is unfree, so `allowUnfree` is required.

```bash
nix profile install github:rewire-run/rewire
```

On NixOS, add it as an input and pull the package into your system config:

```nix
{
  inputs.rewire.url = "github:rewire-run/rewire";

  # in your nixosConfiguration modules
  environment.systemPackages = [ inputs.rewire.packages.${system}.rewire ];
  nixpkgs.config.allowUnfree = true;
}
```

An overlay is also exported, if you would rather reach it as `pkgs.rewire`:

```nix
nixpkgs.overlays = [ inputs.rewire.overlays.default ];
```

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
