-- local ui = ui.wrap(periferal.wrap("left"))
-- ui.write("normal write")
-- ui:drawBox(1,1,10,10)

-- make sure to use : for all custom methods

local monitor = {}
monitor.__index = monitor

local function gen(v,i)
    local t = ""
    for _ = 1,i,1 do
        t = t .. v
    end
    return t
end

function monitor.wrap(m)
    local x,y = m.getSize()
    local self = setmetatable(m, monitor)
    self.WIDTH = x
    self.HEIGHT = y
    return self
end

function monitor:drawHLine(x1,x2,y,c,b)
    local delta = x2-x1+1
    self.setCursorPos(x1,y)
    self.blit(gen(" ",delta),gen(c or "0",delta),gen(b or "0",delta))
end

function monitor:drawVLine(y1,y2,x,c,b)
    local delta = y2-y1
    for i = 1,delta,1 do
        self.setCursorPos(x,y1+i)
        self.blit(" ", c or "0", b or "0")
    end
end

function monitor:drawBox(x,y,xs,ys,c,b)
    self:drawHLine(x,x+xs,y,c,b)
    self:drawHLine(x,x+xs,y+ys,c,b)
    self:drawVLine(y,y+ys,x,c,b)
    self:drawVLine(y,y+ys,x+xs,c,b)
end

function monitor:blite(x,y,t,c,b)
    self.setCursorPos(x,y)
    self.blit(t, gen(c or "0", #t), gen(b or "f", #t))
end

function monitor:cblite(x,y,t,c,b)
    self.setCursorPos(x-math.floor(#t/2),y)
    self.blit(t, gen(c or "0", #t), gen(b or "f", #t))
end

function monitor:isInBox(x,y,x1,y1,x2,y2)
    return x >= x1 and x <= x2 and y >= y1 and y <= y2
end

return monitor
