local Label = {
	extends = Label,
	score = 0
}


function Label:_on_timer_timeout()
	self.score = self.score + 1
	self.text = 'Time Passed: ' .. self.score .. 's'
end


return Label
