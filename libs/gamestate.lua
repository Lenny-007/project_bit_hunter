-- gamestate library

gamestate 		= { } 	-- function library / global value database
gamestate.data 	= { }	-- gamestate database
gamestate.active= ""	-- default value

function gamestate.create( n )
	local obj = { }
	-- default callback functions of the gamestate 
	function obj:draw(			)	end
	function obj:update(		)	end
	function obj:keypressed(	)	end
	function obj:keyreleased(	)	end
	function obj:mousepressed(	) 	end
	function obj:mousereleased(	) 	end
	function obj:focus(			)	end
	function obj:mousefocus(	)	end
	function obj:quit(			)	end
	-- dynamic link from the gamestate-object to the gamestate-database
	gamestate.data[n] = {}
	setmetatable(gamestate.data[n],obj)
	return obj
end

function gamestate.switch(name)
	if gamestate.active == name then
		error("gamestate is already running")
	else
		if gamestate.data[name] ~= nil then
			gamestate.active = name
		else
			error("gamestate does not exist")
		end
	end
end

function gamestate.draw()
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:draw()
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end

function gamestate.update(dt)
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:update(dt)
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end

function gamestate.keypressed(key)
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:keypressed(key)
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end

function gamestate.keyreleased()
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:keyreleased()
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end

function gamestate.mousepressed(x,y,button)
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:mousepressed(x,y,button)
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end

function gamestate.mousereleased(x,y,button)
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:mousereleased(x,y,button)
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end

function gamestate.focus(f)
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:focus(f)
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end

function gamestate.mousefocus(f)
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:mousefocus(f)
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end

function gamestate.quit()
	if gamestate.active ~= "" then
		if gamestate.data[gamestate.active] ~= nil then
			local obj = getmetatable(gamestate.data[gamestate.active])
			obj:quit()
		else
			error("gamestate does not exist")
		end
	else
		return
	end
end