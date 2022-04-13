peripheral.find("modem",rednet.open)

while true do
    redstone.setAnalogOutput("bottom",15)
    while true do
        if fs.exists("disk") then
            break
        end
        os.sleep(1)
    end
    if fs.exists("disk/user.txt") then
        local file = fs.open("disk/user.txt","r")
        local userid = file.readAll()
        rednet.broadcast(
            textutils.serialiseJSON(
                {["type"] = "auth", ["message"] = "login", ["meta"] = userid}
            )
            ,"json"
        )
        local id, message
        repeat
            id, message = rednet.receive("json")
        until textutils.unserialiseJSON(message).type == "auth" and textutils.unserialiseJSON(message).message == "unload"
    else
        rednet.broadcast(
            textutils.serialiseJSON(
                {["type"] = "error", ["message"] = "Invalid Keycard"}
            ),
            "json"
        )
        redstone.setAnalogOutput("bottom",0)
    end
    repeat
        os.sleep(1)
    until fs.exists("disk") == false
end