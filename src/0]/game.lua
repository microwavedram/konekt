local remote = require("remote")
local config = require("config")
local ui = require("ui")

local monitor = ui.wrap(remote.wrap(config.front_monitor_id))

peripheral.find("modem",rednet.open)

local token = nil
local username = ""
local loggedin = false

local function drawDepositMenu()
    monitor.clear()
    monitor:drawBox(1,1,monitor.WIDTH-1,monitor.HEIGHT-1,"0","b")

    monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2)-8,"Deposit Menu","0","f")
    monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2)-2,"Please Put your diamonds into the chute","0","f")
    monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2)+3,"Finish","0","5")
end

local function drawMainMenu(isLoggedIn,username)
    monitor.clear()
    monitor:drawBox(1,1,monitor.WIDTH-1,monitor.HEIGHT-1)

    monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2)-8,"Blackjack","0","f")

    if isLoggedIn == true then
        monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2)-2,"Play","0","5")
        monitor:cblite(math.floor(monitor.WIDTH/2)-5,math.floor(monitor.HEIGHT/2),"Withdraw","0","b")
        monitor:cblite(math.floor(monitor.WIDTH/2)+4,math.floor(monitor.HEIGHT/2),"Deposit","0","b")
        monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2)+2,"Logout","0","e")
        monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2)-4,string.format("Logged in as %s!",username),"0","f")
    else
        monitor:cblite(math.floor(monitor.WIDTH/2),math.floor(monitor.HEIGHT/2),"Login","0","5")
    end
end

while true do
    loggedin = token ~= nil
    drawMainMenu(loggedin,username)
    if loggedin then
        
        while true do
            local event, side, x, y
            repeat
                 event, side, x, y = os.pullEvent("monitor_touch")
            until side == config.front_monitor_id
            if monitor:isInBox(x,y,26,16,32,16) == true then
                drawDepositMenu()
                redstone.setAnalogOutput("front",true)
                local event, side, x, y
                repeat
                    event, side, x, y = os.pullEvent("monitor_touch")
                until side == config.front_monitor_id and monitor:isInBox(x,y,22,19,27,19)
                redstone.setAnalogOutput("front",false)
            end
        end
    else
        while true do
            local event, side, x, y
            repeat
                 event, side, x, y = os.pullEvent("monitor_touch")
            until side == config.front_monitor_id
            if monitor:isInBox(x,y,23,16,27,16) == true then
                token = "ajshfdksafd"
                username = "goggy"
                break
            end
        end
    end
end