-- colors library

colors = {}

function colors.new(rv,gv,bv,av)
	local color = {
		r = rv,
		g = gv,
		b = bv,
		a = av,
	}
	function color:set()
		love.graphics.setColor(self.r,self.g,self.b,self.a)
	end
	function color:setTransparency(a)
		self.a = a
	end
	function color:setR(r)
		self.r = r
	end
	function color:setG(g)
		self.g = g
	end
	function color:setB(b)
		self.b = b
	end
	return color
end

