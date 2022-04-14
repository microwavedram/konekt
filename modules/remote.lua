-- for wrapping wired remote components
local modem = peripheral.find("modem")
assert(modem ~= nil, "No modem attached")
 
local modem_peripheral = {}
 
function modem_peripheral.new(device)
    local self = {}
    print(device)
    for _,method in pairs(modem.getMethodsRemote(device)) do
        self[method] = function(...)
            return modem.callRemote(device, method, ...)
        end
    end
    return self
end
 
local remote = {wrap = modem_peripheral.new}
 
return remote
