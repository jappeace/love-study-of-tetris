love.load = function ()
   x,y = 0,0
   currentCollumn = 0
   placed = {}
   active = {}
   active.pos = 0
   active.height = 100
   active.figure = 't'
   figures = {'t', '|', 'square', 'L'} 

   figures.t = function () 
      love.graphics.setColor(1, 0, 1, 1)
      love.graphics.rectangle('fill', 0 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.75, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.5, 0, 1, 1)
      love.graphics.rectangle('fill', 100 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.25, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + (currentCollumn * 50), 0+active.pos, 50, 50)
   end

   figures['|'] = function()
      love.graphics.setColor(1, 0, 1, 1)
      love.graphics.rectangle('fill', 00 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.75, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.5, 0, 1, 1)
      love.graphics.rectangle('fill', 100 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.25, 0, 1, 1)
      love.graphics.rectangle('fill', 150 + (currentCollumn * 50), 50+active.pos, 50, 50)
   end

   figures.square = function()
      love.graphics.setColor(1, 0, 1, 1)
      love.graphics.rectangle('fill', 0 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.75, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.5, 0, 1, 1)
      love.graphics.rectangle('fill', 0 + (currentCollumn * 50), 00+active.pos, 50, 50)
      love.graphics.setColor(0.25, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + (currentCollumn * 50), 00+active.pos, 50, 50)
   end

   figures.L= function()
      love.graphics.setColor(1, 0, 1, 1)
      love.graphics.rectangle('fill', 0+ (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.75, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.5, 0, 1, 1)
      love.graphics.rectangle('fill', 100+ (currentCollumn * 50), 50+active.pos, 50, 50)
      love.graphics.setColor(0.25, 0, 1, 1)
      love.graphics.rectangle('fill', 100+ (currentCollumn * 50), 0+active.pos, 50, 50)
   end

end

love.draw = function ()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print('Hello, World!' .. currentCollumn , 500, 300)

  love.graphics.print('Hello, World!' .. active.figure, 400, 400)
  love.graphics.line( x, y, mouseX, mouseY)

  figures[active.figure]()
  for k,place in pairs(placed) do
     figures[place]()
  end
end

love.update = function(dt)
   mouseX, mouseY = love.mouse.getPosition()
   width, height = love.graphics.getDimensions( )
   x = x + 1
   y = y + 1
   active.pos = active.pos + 1 
   if (active.pos + active.height) >= height then
      table.insert(placed, active.figure)
      active.pos = 0
      active.figure = figures[math.random(#figures)]
   end
end

love.keypressed = function(key, unicode, isrepeat)
   if isrepeat then
      return
   end

   if key == "left" then
      isLeftMovable = false
      if currentCollumn > 0 then
         currentCollumn = currentCollumn - 1
      end
   end
   if key == "right" then
      if currentCollumn < 10 then
      currentCollumn = currentCollumn + 1
      end
   end
end
