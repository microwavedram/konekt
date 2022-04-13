# konekt
actual IDE support for computercraft



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

Contact me for help ig

