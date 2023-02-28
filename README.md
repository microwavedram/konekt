# konekt
external IDE support for computercraft via a folder on a players machine that autosyncs via a websocket to ingame filesystems.
You do not even need serverside access

**see /modules/ for some useful stuff i created in my short adventure into computercraft**

# Features
- Machine independant folders
- Nested Directory Support
- Supports all file-types
- Rednet Websocket URL sharing between computers
- No server access required

# Installation (konekt-server)
to get going, first clone this repo to a directory

Then run 
```
npm install
```
(You will need nodejs installed)

i reccommend you checkout ngrok for forwarding your websocket port
but, if you really want to, you can port forward the traditional way

To start the websocket run
```
npm run start
```

# Installation (cc:tweaked (ingame) )
Run 
```
pastebin run naNXiSPL
```
and follow the instructions

Konekt-Node allows other computers share the websocket


# Usage

To start Konekt on the computer ingame, run konekt_client
(if you selected add to startup.lua in the install it will already be running)

Note down the ID of the computer you have konekt running on.
If you do not know your computers id you can run
```
pastebin run 7XP4rwcT
```
and it will print out the id

- To get started, Navigate into your websocket folder. 
- Then add a new folder to ./src
- Name this folder the computers ID appended with a "]"

Only files in a computers folder will sync to said computer

# Notes and stuff
- Directorys will be created when a file is put inside
- Files will resync when you save them
- I reccomend you used Visual Studio Code combined with the LUA extention (sumneko) and computercraft plugin (JackMacWindows) as you can add the computercraft globals to the lua extentions settings
- Per-Machine config is stored in the .konekt file
- Websockets do have a data limit so you might run into issues with big files (Maybe a chunking fix?)
- Currently has issues on multiplayers servers with multiple konekt users as one global channel is used to send the rednet requests
(lets just realise that you are probably gonna be the only one using konekt)
(this can be circumvented by used wired connections or normal modems, **just be careful when using ender modems while others also use konekt**)

Contact me for help ig (Crazylegs#7064)

for contributing, message me or something

