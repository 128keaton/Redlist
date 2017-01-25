# Redlist
A Rails app which appends to a Minecraft whitelist

Requires rcon to be enabled on the server.

## Installation:
`gem install redlist`

## Usage:

### Add player to whitelist and reload:

`Redlist.add('path-to-whitelist.json', 'username', 'rcon-password', 'rcon-ip' = "127.0.0.1", 'rcon-port' = "25575")`

### Just reload whitelist

`Redlist.updateList('rcon-ip' = "127.0.0.1", 'rcon-port' = "25575")`
