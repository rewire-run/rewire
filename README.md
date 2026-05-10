<h1 align="center">
  <a href="https://www.rewire.run/">
    <img alt="rewire" src="https://github.com/user-attachments/assets/2f69363d-f5c8-4fd0-9a54-4c3975ae1d23">
  </a>
</h1>

# Rewire

Drop-in ROS 2 bridge for [Rerun](https://rerun.io) — no ROS 2 runtime or build required.

Stream live ROS 2 topics to the Rerun viewer for real-time visualization. Supports 54 built-in
ROS 2 type mappings out of the box, with extensibility for custom messages.

## Features

- Zero ROS 2 dependency — pure Rust, no colcon or ament needed
- Automatic DDS and Zenoh discovery
- 54 built-in type converters across `std_msgs`, `sensor_msgs`, `geometry_msgs`, `nav_msgs`,
  `vision_msgs`, `tf2_msgs`, and `rcl_interfaces`
- Custom message support via JSON5 mappings
- Real-time diagnostics (hz, bytes/sec, drops, latency)
- Topic filtering with glob patterns

## Install

See the [documentation](https://rewire.run) for installation instructions and usage.

## Related Repositories

| Repository | Description |
|------------|-------------|
| [rewire-viewer](https://github.com/rewire-run/rewire-viewer) | Rewire viewer based on Rerun API for bridge introspection |
| [rewire-extras](https://github.com/rewire-run/rewire-extras) | Shared Rerun archetypes and types for the Rewire ecosystem |
| [rewire-docker](https://github.com/rewire-run/rewire-docker) | Docker images for Rewire |

### Examples

| Repository | Description |
|------------|-------------|
| [rewire-turtlebot3-example](https://github.com/rewire-run/rewire-turtlebot3-example) | TurtleBot3 simulation visualized in Rerun |
| [rewire-camera-example](https://github.com/rewire-run/rewire-camera-example) | ROS 2 camera/image streaming to Rerun |
| [rewire-custom-mappings-example](https://github.com/rewire-run/rewire-custom-mappings-example) | Custom message mapping with JSON5 |

## Community

This repository hosts [discussions](https://github.com/rewire-run/rewire/discussions) and
[issues](https://github.com/rewire-run/rewire/issues) for rewire. Bug reports, feature requests,
and questions are welcome.
