local Core = script.Core
local Common = script.Common

local Scene = require(script.Scene)
local ViewportCanvas = require(Common.ViewportCanvas)

local Engine = {}
Engine.__index = Engine

function Engine.new()
	local self = setmetatable({
		renderEpsilon = 100,
		scenes = {}
	}, Engine)
end

function Engine.NewScene(sceneName: string)
	return Scene.new(sceneName, true)
end

function Engine:DestroyAllScenes()

end

return Engine