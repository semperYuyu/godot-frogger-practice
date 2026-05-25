local player = {
	extends = CharacterBody2D,
}

function player:_ready()
	direction = Vector2()
	speed = 100
	AnimatedSprite2D = self:get_node("AnimatedSprite2D")
end

function player:animation()
	if direction:length() == 0 then
	-- // have to check length instead of not
	-- // Vector2() is still truthy in lua, so not wont work !
		AnimatedSprite2D.frame = 0
	elseif direction.x ~= 0 then
		AnimatedSprite2D:play("Horizontal")
		AnimatedSprite2D.flip_h = direction.x > 0
	elseif direction.y < 0 then
		AnimatedSprite2D:play("Up")
	elseif direction.y > 0 then
		AnimatedSprite2D:play("Down")
	end
	return
end


function player:_physics_process(delta_Time)
--// input:get_vector() takes all of your inputs and returns a vector based on them
	 direction = Input:get_vector("Left", "Right", "Up", "Down")
	 self.velocity = direction * speed
	 self:animation()
	 self:move_and_slide()

	 if Input:is_action_just_pressed("Confirm") then
		print("no way")
	 end
	 --if Input:is_action_pressed("Confirm") and cooldown <= 0 then
	 	--print("no way")
		--cooldown = 1
	 --elseif cooldown > 0 then
	 	--cooldown = cooldown - delta_Time
	 --end
	--// couldve also used is_action_just_pressed() instead of a cooldown


	 --// line 11 is the same as 4 if statements checking input and returning a vector
	 -- (i.e.) if Input:is_action_pressed("Left") then
	 --        	direction = Vector2.LEFT
	 --        elseif... etc. etc.
end

return player;
