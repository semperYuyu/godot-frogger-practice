local player = {
	extends = Node2D,
}

local direction = Vector2(1, 0)
local speed = 5


function player:_physics_process(delta)
	 self.position = self.position + direction * speed
end
return player;
