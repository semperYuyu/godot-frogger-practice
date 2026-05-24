local car = {
	extends = Area2D,
	direction = Vector2.LEFT,
	speed = 200
}


function car:_ready()
	if self.position.x < 192 then
		self.direction = Vector2.RIGHT
		self.flip_h = true
	end

	return
end

function car:_physics_process(delta)
	self.position = self.position + (self.direction * self.speed * delta)

	return
end

function car:_on_visible_on_screen_notifier_2d_screen_exited()
	self:queue_free()

	return
end

return car
