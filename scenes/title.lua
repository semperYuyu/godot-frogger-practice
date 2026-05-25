local title = {
	extends = Control,
}

function title:_ready()
	local Label = self:get_node("HighScoreLabel")
	local global_Variables = self:get_node("/root/GlobalVariables")

	Label.text = "High Score: " .. global_Variables.score
end


function title:_process(delta)
	if Input:is_action_just_pressed("Confirm") then
		self:get_tree():change_scene_to_file("res://scenes/game.tscn")
		-- // call deferred not required since no physics objects in this scene
	end
end

return title
