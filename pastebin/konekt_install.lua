print("Welcome to the Konekt Installer")
if fs.exists("konekt_client.lua") then
    fs.delete("konekt_client.lua")
end
if fs.exists("konekt_node.lua") then
    fs.delete("konekt_node.lua")
end
shell.run("pastebin get NLmyy2iR konekt_client.lua")
print("Should Konekt overide and add its self to startup.lua? (y/n)")
if read() == "y" then
    if fs.exists("startup.lua") then
        fs.delete("startup.lua")
    end
    local file = fs.open("startup.lua","w")
    if fs.exists("konekt_node.lua") then
        file.write("shell.run(\"fg konekt_client\")\nshell.run(\"fg konekt_node\")")
    else
        file.write("shell.run(\"fg konekt_client\")")
    end
    file.close()
end