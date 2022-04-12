# konekt
actual IDE support for computercraft



# Installation
to get going, first gitclone this repo to a directory

Then run 
```
npm install
```

Ingame on the computer you want to connect to, run
```
pastebin get UuGddYQu konekt.lua
```

# Usage
i reccommend you checkout ngrok for forwarding your websocket port
but, if you really want to, you can port forward the traditional way

Edit the konekt.lua file and change the ws URL to your ngrok URL (or your own ip)
Save the file

Start the Konekt WS server with
```
npm run start
```
Then startup the cc client
run
```
fg konekt
```
You are now good to go
