peripheral.find("modem",rednet.open)

while true do
    local id, message
    repeat
        redstone.setAnalogOutput("back",15)
            for i = 1,16,1 do
                turtle.select(i)
                turtle.drop()
            end
        redstone.setAnalogOutput("back",0)
    until redstone.getInput("left") == true
    print("starting count")
    local count = 0
    rednet.broadcast(
        textutils.serialiseJSON(
            {["type"] = "diamond_count", ["message"] = count}
        )
        ,"json"
    ) 
    while redstone.getInput("left") do
        for i = 1,16,1 do
            count = count + turtle.getItemCount(i)
            turtle.select(i)
            turtle.dropDown()
        end
        rednet.broadcast(
            textutils.serialiseJSON(
                {["type"] = "diamond_count", ["message"] = count}
            )
            ,"json"
        )
    end

    rednet.broadcast(
        textutils.serialiseJSON(
            {["type"] = "diamond_count", ["message"] = count}
        )
        ,"json"
    )
end
