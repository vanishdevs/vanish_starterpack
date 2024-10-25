### Starter Pack
![](https://img.shields.io/github/downloads/vanishdevs/vanish_starterpack/total?logo=github)
![](https://img.shields.io/github/downloads/vanishdevs/vanish_starterpack/latest/total?logo=github)
![](https://img.shields.io/github/contributors/vanishdevs/vanish_starterpack?logo=github)
![](https://img.shields.io/github/v/release/vanishdevs/vanish_starterpack?logo=github)

This script provides a convenient way for players to receive starter packs containing predefined items by interacting with a designated NPC at a certain location. Below, you'll find everything you need to know about installing, configuring, and using this system effectively.

### Preview

[Watch the video](https://streamable.com/5u1eo9)

### Features

- Allows players to interact with an NPC to receive starter packs.
- Customizable NPC ped, position, and animation.
- Easily configurable starter pack contents.
- Server-side functionality to check and mark players who have received starter packs.

### Installation

- Copy the downloaded script files into your server's resource folder.
- Ensure the script is properly included in your server configuration file (`server.cfg`) to ensure it loads correctly when your server starts.
- Run the install.sql query in your database, before starting the script.
- Ensure that you have the necessary dependencies installed, ox_lib.

### Configuration

Configure the following parameters in the config:

- `Coords`: The position where the NPC will be located.
- `Heading`: The heading of the NPC (where it will be facing).
- `PedSettings`: The model & animation of the NPC (can be found in FiveM docs about peds).
- `Items`: The contents of the starter pack, defined as a table where the key is the item name and the value is the quantity.

### Dependencies

Ensure that the following dependencies is installed:

- `esx, qb, qbox, or ox_core`
- `ox_lib`: [Download here](https://github.com/overextended/ox_lib.git)
- `ox_inventory`: [Download here](https://github.com/overextended/ox_inventory.git) (if applicable)
