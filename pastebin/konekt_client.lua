local modem = peripheral.find("modem")

local ws

-- dis fuckin stupid
string.split = function(str, pat, limit)
    local t = {}
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(t, cap)
        end

        last_end = e + 1
        s, e, cap = str:find(fpat, last_end)

        if limit ~= nil and limit <= #t then
            break
        end
    end

    if last_end <= #str then
        cap = str:sub(last_end)
        table.insert(t, cap)
    end

    return t
end

if modem then
    peripheral.find("modem",rednet.open)
end

local function isInTable(t,v)
    for _,v2 in pairs(t) do
        if v == v2 then
            return true
        end
    end
    return false
end

local function updateLocalFile(ws)
    if fs.exists(".konekt") then
        fs.delete(".konekt")
    end
    local file = fs.open(".konekt","w")
    file.write(ws)
    file.close()
end


local function connectWS(WS)
    local ws, err = http.websocket(WS)
    if ws then
        print("Connected to websocket")
        updateLocalFile(WS)
        while true do
            local responce, binary = ws.receive()
            local data = textutils.unserialiseJSON(responce)
            if data.type == "file" then
                local path = string.split(data.path,"]")
                if os.getComputerID() == tonumber(string.sub(path[1],2,#path[1])) then
                    print(path[2])
                    local file = fs.open(path[2],"w")
                    file.write(data.content)
                    file.close()
                end
            end
        end
    else
        error(err)
    end
end

local function netGetWS()
    if modem.isWireless then
        print("Getting WS wirelessly from nodes")
    else
        print("Getting WS from LAN")
    end

    local blacklist = {}

    rednet.broadcast("get_ws","konekt")
    for i = 1,3,1 do
        local id, message = rednet.receive("konekt",5)
        if not isInTable(blacklist,id) then
            local parse
            local success, err = pcall(function()parse =textutils.unserialiseJSON(message)end)
            if success then
                if parse["ws"] ~= nil then 
                    return parse["ws"]
                end
            end    
        end
        print("Attempt "..tostring(i))   
    end
    return nil
end

if modem then
    ws = netGetWS()
    if ws == nil then
        print("Could not get WS from localfile or network")
    end
end
if fs.exists(".konekt") and not ws then
    print("Getting WS from local file")
    local file = fs.open(".konekt","r")
    ws = file.readAll()
    file.close()
else
    if ws == nil then
        print("Could not get WS from localfile or network")
        print("Please Enter Manualy")
        ws = read()
    end
end

for i = 1,5,1 do
    print("\n")
    print("Connection Attempt "..tostring(i))
    local success, err = pcall(connectWS,ws)
    if success then
        error("Konekt Stopped? HOW?")
    else
        if err == "Terminated" then
            error("Terminated")
        end
        print(err)
    end
    os.sleep(1)
end
print("Connection Failed")