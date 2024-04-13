### Starter Pack Script

This script provides a convenient way for players to receive starter packs containing predefined items by interacting with a designated NPC at a certain location. Below, you'll find everything you need to know about installing, configuring, and using this system effectively.

### Preview

[Watch the video](https://cdn.discordapp.com/attachments/998425345806041088/1228806318756991049/vanish_starterpack.mp4?ex=662d6210&is=661aed10&hm=a68a3608529e82f4250bdb772e3a1b8eac0e23e258b6539abba1bc33c95978c8&)

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
- `Ped`: The model of the NPC (can be found in FiveM docs about peds).
- `PedAnim`: The scenario the NPC will be performing while standing.
- `Items`: The contents of the starter pack, defined as a table where the key is the item name and the value is the quantity.

### Dependencies

Ensure that the following dependency is installed:

- `ox_lib`: [Download here](https://github.com/overextended/ox_lib.git)
- `ox_inventory`: [Download here](https://github.com/overextended/ox_inventory.git)
