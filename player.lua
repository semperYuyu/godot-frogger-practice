local player = {
	extends = CharacterBody2D,
}

local direction = Vector2(1, 1)
local speed = 100
local cooldown = 0


function player:_physics_process(delta_Time)
--// input:get_vector() takes all of your inputs and returns a vector based on them
	 direction = Input:get_vector("Left", "Right", "Up", "Down")
	 self.velocity = direction * speed
	 self:move_and_slide()
	
	 if Input:is_action_pressed("Something") and cooldown <= 0 then
	 	print("something")
		cooldown = 1
	 elseif cooldown > 0 then
	 	cooldown = cooldown - delta_Time
	 end
	--// couldve also used is_action_just_pressed() instead of a cooldown
	
	
	 --// line 11 is the same as 4 if statements checking input and returning a vector
	 -- (i.e.) if Input:is_action_pressed("Left") then 
	 --        	direction = Vector2.LEFT
	 --        elseif... etc. etc.
end
return player;
