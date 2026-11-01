# SQUABIX Spawners

Spawner nodes for 3D games. They spawn scenes, particles, sounds, and waves of enemies.

## Classes

- `Spawner3D`
- `SceneSpawner3D`
- `ParticleSpawner3D`
- `Duplicator3D`
- `AudioSpawner3D`
- `MultiSpawner3D`
- `WaveSpawner3D`
- `WaveSpawnerWave`

## Use

1. Add a `SceneSpawner3D` and fill `scenes`.
2. Call `spawn()`, or set `spawn_frequency` and turn on `autostart_timer`.
3. Connect to the `spawned` signal to use each new node.
4. Add several spawners to a `MultiSpawner3D` to run them together.
5. Add a `WaveSpawner3D` and fill `waves` with `WaveSpawnerWave` resources.
6. Call `start()` on the `WaveSpawner3D`.

## Demo

See it in the game: https://github.com/squabix/craftlander

## Needs

Godot 4.5 or newer.

## License

MIT. See `LICENSE`.
Icons are from another project. See `THIRD_PARTY.md`.
