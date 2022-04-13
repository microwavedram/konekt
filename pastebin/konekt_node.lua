peripheral.find("modem",rednet.open)
assert(fs.exists(".konekt"), "No WS located")

local file = fs.open(".konekt","r")
local ws = file.readAll()
file.close()

while true do
    local id, message = rednet.receive("konekt")
    if message == "get_ws" then
        rednet.send(id,ws,"konekt")
    end
end