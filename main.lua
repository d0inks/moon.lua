--https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes keycode--
--MOVEMENT LUA FOR MATCHA EXTERNAL ROBLOX
--BHOP is not done yet just use velocity--
local CFG = {
    --binds
    EB = 0xA0; --lshift
    JB = 0x06; --mb5
    ps = 0x05; --mb4
    velocityind = true; --do u want velocity indicator on?
    velocolors = true; --do u want velocity colors to change
    watermark = true; --do u want watermark on?
    topright = true; --watermark on top right if false itll be top left
    rainbow = true; --rainbow watermark if false will use color below
    cwatermark = Color3.fromRGB(255,255,255); --custom watermark color in RGB
    name  = "yourname" --put whatever name u want under idk characters
}
--CREDITS
--To opensky for their create function i took from(their arsenal skin changer project)
--To chatgpt for help lol
local GUIChecks = {
    edgebug = true;
    jumpbug = true;
    pixelsurf = true;
    bhop = true
}
local edging = false
local jbing = false
local psing = false
local bhop = true --set to false when doing gui - doink
local playerS = game:GetService("Players")
local player = playerS.LocalPlayer
local white = Color3.fromRGB(255,255,255) --white
local pos = Vector2.new(950, 720)--txt pos
local green = Color3.fromRGB(0,255,0)--green
local orange = Color3.fromRGB(250, 137, 0) --orange
local grey = Color3.fromRGB(32,32,32)
local UIObjects = {}
local function Create(type, props) --lowk pasted this dont tell anyone but it was soo useful see how cleaner my code is
    local obj = Drawing.new(type)
    for k, v in pairs(props) do obj[k] = v end
    table.insert(UIObjects, obj)
    return obj
end
--WATERMARK
local box = Create("Square", {Visible = CFG.watermark,Filled = true,Color = grey,Size = Vector2.new(140,30)})
local outbox = Create("Square",{Visible = CFG.watermark,Filled = false,Size = Vector2.new(141,31)})
local rtxt = Create("Text",{Text = "moon",Visible = CFG.watermark,Outline = false,})
local wmtxt = Create("Text", {Text = ".lua |"..CFG.name,Visible = CFG.watermark,Outline = false,})

if CFG.topright == false then
    box.Position = Vector2.new(10,80)
    outbox.Position = Vector2.new(10,80)
    rtxt.Position = Vector2.new(22,90)
    wmtxt.Position = Vector2.new(20,90)
elseif CFG.topright == true then
    rtxt.Position = Vector2.new(1780,19)
    wmtxt.Position = Vector2.new(1810,19)
    box.Position = Vector2.new(1775,10)
    outbox.Position = Vector2.new(1775,10)
end
--end of watermark
local velo = Create("Text",{Visible = CFG.velocityind,Position = pos,Color = white,Outline = false})
local ebTxt = Create("Text",{Position = Vector2.new(960, 750),Text = "EB",Color = white,Visible = false,Outline = false})
local JBTxt = Create("Text",{Position = Vector2.new(945, 750),Text = "JB",Color = white, Visible = false, Outline = false})
local PsTxt = Create("Text",{Position = Vector2.new(980, 750),Text = "PS",Color = white,Visible = false,Outline = false})
print("moon.lua by doink :)")
print("discord server -- https://discord.gg/BxAWmtP7cp")
--loop--
local function GetHRP()
    local chars = player.Character
    return chars:WaitForChild("HumanoidRootPart")
end
local pre = 0
local h = 0
local t = 0
while true do
        local EBpressed = iskeypressed(CFG.EB)
        local JBpressed = iskeypressed(CFG.JB)
        local Pspressed = iskeypressed(CFG.ps)
        if CFG.rainbow == true then
            h = (h + 0.005) % 1
            rtxt.Color = Color3.fromHSV(h, 1, 1)
        else
            rtxt.Color = CFG.cwatermark
        end
        t = (t - 0.005) % 1 --uses same logic from h bc im lazy asf
        outbox.Color = Color3.fromHSV(1,0,t)
        task.wait()
        if EBpressed then
            if player and not edging then
                local hrp = GetHRP()
                local dir = hrp.AssemblyLinearVelocity
                if math.abs(dir.X) > 1 and  math.abs(dir.Y) > 1 or math.abs(dir.Z) > 1 and  math.abs(dir.Y) > 1  then
                    ebTxt.Visible = true
                    edging = true
                    ebTxt.Color = green
                    for i=1,5 do
                        wait()
                        hrp.AssemblyLinearVelocity = Vector3.new(dir.X * 1.2, dir.Y * 0, dir.Z * 1.2) - Vector3.new(0,15,0)
                    end
                    wait()
                    hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X * 1.8, hrp.AssemblyLinearVelocity.Y * 1, hrp.AssemblyLinearVelocity.Z * 2)
                    spawn(function()
                        wait(0.2)
                        edging = false
                        ebTxt.Visible = false
                        ebTxt.Color = white
                    end)
                end
            end
        else
            edging = false
            ebTxt.Visible = false
            ebTxt.Color = white
        end
        if JBpressed then
            if player and not jbing then
                local hrp = GetHRP()
                local dir = hrp.AssemblyLinearVelocity
                if math.abs(dir.X) > 1 or math.abs(dir.Z) > 1 then
                    JBTxt.Visible = true
                    jbing = true
                    if dir.Y > 1 then
                        hrp.AssemblyLinearVelocity = Vector3.new(dir.X*1.5,dir.Y * -1.5, dir.Z*1.5)
                    else
                        hrp.AssemblyLinearVelocity = Vector3.new(dir.X*1.5,dir.Y * 2, dir.Z*1.5)
                    end
                    wait(0.1)
                    hrp.AssemblyLinearVelocity = Vector3.new(dir.X*2, 25, dir.Z*2)
                    JBTxt.Color = green
                    wait(0.2)
                    JBTxt.Color = white
                end
            end
        else
            jbing = false
            JBTxt.Color = white
            JBTxt.Visible = false
        end
 if Pspressed then
        local hrp = GetHRP()
        if not psing then
            psing = true
            PsTxt.Visible = true
            PsTxt.Color = green
        end
        local dir = hrp.AssemblyLinearVelocity
        hrp.AssemblyLinearVelocity = Vector3.new(dir.X * 1.1, dir.Y, dir.Z * 1.1)
    else
        psing = false
        PsTxt.Visible = false
        PsTxt.Color = white
    end
        local hrp = GetHRP()
        local speed = hrp.AssemblyLinearVelocity
        local bx = math.abs(speed.X^2)
        local bz = math.abs(speed.Z^2)
        local totalVel = math.sqrt(bx + bz) --calcs horizontal velocity
        local toVel = string.format("%.2f", totalVel)
        velo.Text = toVel
        if totalVel > pre and totalVel > 1 and CFG.velocolors == true then
            velo.Color = green
        elseif totalVel < pre and totalVel > 1 and CFG.velocolors == true  then
            velo.Color = orange
        elseif totalVel < 1 and CFG.velocolors == true  then
            velo.Color = white
        end
        wait(0.0001)
        pre = totalVel
        if bhop and iskeypressed(0x20) then
            keypress(0x20)
            keyrelease(0x20)
        end
end
