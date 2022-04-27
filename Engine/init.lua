local Core = script.Core
local Common = script.Common

local Scene = require(script.Scene)

local Engine = {}
Engine.__index = Engine

function Engine.new()
	local self = setmetatable({
		renderEpsilon = 100,
		scenes = {}
	}, Engine)
end

function Engine.NewScene(resX: number, resY: number, sceneName: string?)
	return Scene.new(resX, resY, sceneName, true)
end

function Engine:DestroyAllScenes()

end

return Engine