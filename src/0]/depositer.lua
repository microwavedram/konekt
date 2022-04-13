local remote = require("remote")
local config = require("config")
local ui = require("ui")

peripheral.find("modem",rednet.open)

local monitor = ui.wrap(remote.wrap(config.front_monitor_id))

while true do
    local id, message
    repeat
        id, message = rednet.receive("json")        
    until textutils.unserialiseJSON(message).type == "diamond_count"
    monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2),string.format("%s Diamonds",message.message),"0","b")
end