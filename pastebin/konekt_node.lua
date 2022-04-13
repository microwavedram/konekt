peripheral.find("modem",rednet.open)
assert(fs.exists(".konekt"), "No WS located")

local file = fs.open(".konekt","r")
local ws = file.readAll()
file.close()

while true do
    local id, message = rednet.receive("konekt")
    if message == "get_ws" then
        print("Pinged by "..tostring(id))
        os.sleep(0.5)
        rednet.broadcast(textutils.serialiseJSON({
            ["ws"] = ws
        }),"konekt")
    end
end