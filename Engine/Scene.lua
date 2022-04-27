local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local ViewportCanvas = require(script.Parent.Common.ViewportCanvas)

local Scene = {}
Scene.__index = Scene

function Scene.new(resX: number, resY: number, sceneName: string?, fullscreen: boolean)
	local SceneGui = Instance.new("ScreenGui")
	SceneGui.IgnoreGuiInset = true
	SceneGui.ResetOnSpawn = false
	SceneGui.Name = sceneName or "Scene_"..HttpService:GenerateGUID(false)

	local SceneCanvas = Instance.new("Frame")
	SceneCanvas.Name = "Canvas"
	SceneCanvas.Position = UDim2.new(0, 0, 0, 0)
	SceneCanvas.Size = if fullscreen then UDim2.fromScale(1, 1) else UDim2.new(0, 0, 0, 0)
	SceneCanvas.BorderSizePixel = 0
	SceneCanvas.BackgroundColor3 = Color3.new(1, 1, 1)
	SceneCanvas.Visible = false
	SceneCanvas.Parent = SceneGui

	SceneGui.Parent = Players.LocalPlayer

	local Canvas = ViewportCanvas.new(resX, resY)
	Canvas:SetParent(SceneCanvas)

	local self = setmetatable({
		screenGui = SceneGui,
		canvas = Canvas,
		camera = nil
	}, Scene)

	return self
end

return Scene