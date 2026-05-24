local game = {
	extends = Node2D,
}

function game:_on_timer_timeout()
--// remember, to use signal functions, you must connect them to a script
	print("Timer has triggered :D")
end

function game:_on_area_2d_body_entered(body)
	print("what the")
	print(type(body))
end
return game
