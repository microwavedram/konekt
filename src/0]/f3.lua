local remote = require("remote")
local config = require("config")
local ui = require("ui")

local monitor = ui.wrap(remote.wrap(config.front_monitor_id))

local function render(x,y)
    monitor:blite(1,1,"DEBUG","0","e")
    monitor:blite(1,2,string.format("X:%s Y:%s",x,y),"0","e")
end

while true do
    local event, side, x, y
    repeat
        event, side, x, y = os.pullEvent("monitor_touch")
    until side == config.front_monitor_id
    render(x,y)
end