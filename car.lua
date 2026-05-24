local car = {
	extends = Area2D,
}


local direction = Vector2.LEFT
local speed = 2

function car:_process(delta)
	self.position = self.position + (direction * speed)
end

return car
