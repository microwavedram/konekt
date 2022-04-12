const chokidar = require('chokidar');
const fs = require('fs');

const { Server } = require("ws")

const config = require("../config.json")

const wss = new Server({
    port: config["ws_port"],
    autoAcceptConnections: true
})

wss.on('connection', (ws) => {
    const watcher = chokidar.watch("./src",{persistent: true})
    watcher.on('add', (path) => {
        ws.send(JSON.stringify({
            type: "file",
            path: path.substring(3),
            content: fs.readFileSync(path,"utf-8"),
        }))
    })
    watcher.on('change', (path) => {
        ws.send(JSON.stringify({
            type: "file",
            path: path.substring(3),
            content: fs.readFileSync(path,"utf-8"),
        }))
    })
})
