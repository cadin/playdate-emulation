-- global pd color values 
BLACK = {0.193, 0.184, 0.158}
WHITE = {0.747, 0.757, 0.743}
PURPLE = {0.461, 0, 0.967}

local SCREENW = 400
local SCREENH = 240

local canvas
local deviceImg
local deviceScale = 1.18

function setPlaydateWindow(useDevice, scale)
	love.graphics.setLineStyle('rough')
	if useDevice then
		playdateDevice(scale)
	else 
		playdateWindow(scale)
	end
end

function playdateDevice(scale)
	love.graphics.setBackgroundColor(PURPLE)
	deviceImg = love.graphics.newImage("images/device-wShadow.png")
	love.window.setMode(600 * deviceScale , 509 * deviceScale , { highdpi=false})
	love.window.setTitle("Playdate")
end

function playdateWindow(scale)
	local s = scale or 1
	love.window.setMode(SCREENW * s, SCREENH * s)
	love.window.setTitle("Playdate Screen @" .. scale .. "x")
end

function createPlaydateCanvas()
	canvas = love.graphics.newCanvas(SCREENW, SCREENH)
	canvas:setFilter("nearest", "nearest", 1)

	return canvas
end

function playdateDraw(useDevice, scale)
	if useDevice then
		love.graphics.draw(deviceImg, 0, 0, 0, 0.5 * deviceScale, 0.5 * deviceScale)
		love.graphics.draw(canvas, 66, 63)
	else
		love.graphics.draw(canvas, 0, 0, 0, scale, scale)
	end
	
end