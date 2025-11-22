--BHOP is not possible until i find a work around just use velocity--
local CFG = {
    EB = 0xA0; --left shift
    JB = 0x06; --mb5
    px = 0x05; --mb4
    speed = 23 --bhop speed
}

local edging = false
local jbing = false
local pxing = false
local bhop = true --set to false when doing gui - doink
local playerS = game:GetService("Players")
local player = playerS.LocalPlayer.Character
local hum = player:WaitForChild("Humanoid")
local hrp = player:WaitForChild("HumanoidRootPart")
local white = Color3.new(1, 1, 1) --white
local cam = game:GetService("Workspace"):WaitForChild("Camera")

local ebTxt = Drawing.new("Text")
ebTxt.Position = Vector2.new(950, 750)
ebTxt.Text = "EB"
ebTxt.Color = white
ebTxt.Visible = false

local JBTxt = Drawing.new("Text")
JBTxt.Position = Vector2.new(950, 734)
JBTxt.Text = "JB"
JBTxt.Color = white
JBTxt.Visible = false

local PxTxt = Drawing.new("Text")
PxTxt.Position = Vector2.new(950, 717)
PxTxt.Text = "PX"
PxTxt.Color = white
PxTxt.Visible = false



print("movement sex intialized.")
--local velocityS = loadstring(game:HttpGet("https://raw.githubusercontent.com/d0inks/mvmnt_matcha/refs/heads/main/velo.lua"))() --not important for now
--loop--
while true do
    local EBpressed = iskeypressed(CFG.EB)
    local JBpressed = iskeypressed(CFG.JB)
    local PXpressed = iskeypressed(CFG.px)
    if EBpressed then
        if player and not edging then
            ebTxt.Visible = true
            edging = true
            local dir = hrp.AssemblyLinearVelocity
             for i=1,5 do wait()
                    hrp.AssemblyLinearVelocity = Vector3.new(dir.X * 1.2, dir.Y * 0, dir.Z * 1.2) - Vector3.new(0,15,0)
                end
                wait()
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X * 1.8, hrp.AssemblyLinearVelocity.Y * 1, hrp.AssemblyLinearVelocity.Z * 2)
                spawn(function()
                    wait(0.1)
                    edging = false
                    ebTxt.Visible = false
                end)
        end
    end
    if JBpressed then
        if player and not jbing then
            JBTxt.Visible = true
            jbing = true
    --find a way to do jump bug--
        end
	else
        jbing = false
        JBTxt.Visible = false
    end
    if PXpressed then
        if player and not pxing then
      pxing = true
        PxTxt.Visible = true
        end
	else
        pxing = false
        PxTxt.Visible = false
            --pixel surf!--
    end
    wait(0.0001)
end
