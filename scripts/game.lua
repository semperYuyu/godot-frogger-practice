local game = {
	extends = Node2D,
}

function go_to_title(body)
	print(body)
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
	car:connect("body_entered", Callable(go_to_title))
end


function game:_on_area_2d_body_entered(body)
	print("what the")
end

return game
