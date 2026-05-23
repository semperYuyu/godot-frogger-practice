local trees_n_boxes_size_scale = {
	extends = Node2D,
}

--// i do believe that this script is temporary and just for testing :D
function trees_n_boxes_size_scale:_ready()
	print(self.scale, "init")
	scale_Change_Rate = 1.5 --// purposefully not local
	time_Passed = 0
end
function trees_n_boxes_size_scale:_physics_process(delta_Time)
	--// please never name your scripts like this again
	print(math.floor(time_Passed), self.scale)
	self.scale = self.scale * (scale_Change_Rate ^ delta_Time)
	--// every second, scale increases by 50%
	
	
	-- claude's explanation as to why ^delta_Time is superiour to 
	-- self.scale + (self.scale * scale_Change_Rate * delta_Time)
	-- when trying to reach an amount of increase per second
	--[[
		The key idea is: what does "1.5x per second" actually mean?
It means if delta summed up to exactly 1.0 (one full second), you want to multiply by exactly 1.5. So you need:
rate ^ delta   →   1.5 ^ 1.0   =   1.5  ✓
Now imagine that second is split across 4 frames of delta 0.25 each:
frame 1: scale * 1.5^0.25
frame 2: scale * 1.5^0.25
frame 3: scale * 1.5^0.25
frame 4: scale * 1.5^0.25
When you multiply them all together:
1.5^0.25 * 1.5^0.25 * 1.5^0.25 * 1.5^0.25
= 1.5^(0.25 + 0.25 + 0.25 + 0.25)
= 1.5^1.0
= 1.5  ✓
That's just how exponent rules work — a^x * a^y = a^(x+y). So no matter how many frames fit into a second, the deltas always add up to 1.0 and you always get exactly 1.5x.
Why your original approach was wrong:
lua-- this adds scale * 1.5 * delta each frame
-- at 60fps: adding 1.5/60 sixty times = adding 1.5 total
-- but addition isn't how scaling works!
self.scale = self.scale + self.scale * 1.5 * delta
The problem is that as your scale grows, each frame adds a bigger amount, making it spiral out of control faster than intended. The ^delta approach always stays true to "exactly 1.5x per second" no matter what.
	
	]]--
	time_Passed = time_Passed + delta_Time

end

return trees_n_boxes_size_scale
