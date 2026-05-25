local game = {
	extends = Node2D,
}

game.change_scene = function(self)
	self:get_tree():change_scene_to_file("res://scenes/title.tscn")
end

game.go_to_title = function (self, body)
	print(body)
	self:call_deferred("change_scene")
end

function game:_ready()
	car_Scene = ResourceLoader:load("res://scenes/car.tscn")
	Objects = self:get_node("Objects")
	car_Start_Positions = self:get_node("CarStartPositions")
end



function game:_on_car_timer_timeout()
	local car = car_Scene:instantiate()
	local position_Marker = car_Start_Positions:get_children():pick_random()
	car.position = position_Marker.position

	Objects:add_child(car)
	car:connect("body_entered", Callable(self, "go_to_title"))
end


function game:_on_area_2d_body_entered(body)
	print("what the")
	local Label = self:get_node("/root/Game/CanvasLayer/Label")
	local global_Variables = self:get_node("/root/GlobalVariables")

	if Label.score < global_Variables.score or global_Variables.score == 0 then
		global_Variables.score = Label.score
	end
	self:call_deferred("change_scene")
	-- // call_deferred is specifically looking for the name of a method rather than a normal function
	-- // so I have to make the function a method of the object calling call_deferred
end

return game
