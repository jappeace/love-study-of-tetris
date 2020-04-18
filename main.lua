love.load = function ()
   x,y = 0,0
   currentCollumn = 0
   placed = {}
   active = {}
   active.pos = 0
   active.height = 100
   active.figure = 't'
   figures = {'t', '|', 'square', 'L'} 

   figures.t = function (offsetX, offsetY) 
      love.graphics.setColor(1, 0, 1, 1)
      love.graphics.rectangle('fill', 0 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.75, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.5, 0, 1, 1)
      love.graphics.rectangle('fill', 100 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.25, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + offsetX, 0+offsetY, 50, 50)
   end

   figures['|'] = function(offsetX, offsetY)
      love.graphics.setColor(1, 0, 1, 1)
      love.graphics.rectangle('fill', 00 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.75, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.5, 0, 1, 1)
      love.graphics.rectangle('fill', 100 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.25, 0, 1, 1)
      love.graphics.rectangle('fill', 150 + offsetX, 50+offsetY, 50, 50)
   end

   figures.square = function(offsetX, offsetY)
      love.graphics.setColor(1, 0, 1, 1)
      love.graphics.rectangle('fill', 0 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.75, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.5, 0, 1, 1)
      love.graphics.rectangle('fill', 0 + offsetX, 00+offsetY, 50, 50)
      love.graphics.setColor(0.25, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + offsetX, 00+offsetY, 50, 50)
   end

   figures.L= function(offsetX, offsetY)
      love.graphics.setColor(1, 0, 1, 1)
      love.graphics.rectangle('fill', 0+ offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.75, 0, 1, 1)
      love.graphics.rectangle('fill', 50 + offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.5, 0, 1, 1)
      love.graphics.rectangle('fill', 100+ offsetX, 50+offsetY, 50, 50)
      love.graphics.setColor(0.25, 0, 1, 1)
      love.graphics.rectangle('fill', 100+ offsetX, 0+offsetY, 50, 50)
   end

end

-- love.graphics.rectangle('fill', 0+ (currentCollumn * 50), 50+active.pos, 50, 50)

love.draw = function ()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print('Hello, World!' .. currentCollumn , 500, 300)

  love.graphics.print('Hello, World!' .. active.figure, 400, 400)
  love.graphics.line( x, y, mouseX, mouseY)

  figures[active.figure]((currentCollumn * 50), active.pos)
  for k,place in pairs(placed) do
     figures[place['figure']](place['column'] * 50, place['row'])
  end
end

love.update = function(dt)
   mouseX, mouseY = love.mouse.getPosition()
   width, height = love.graphics.getDimensions( )
   x = x + 1
   y = y + 1
   active.pos = active.pos + 1 
   -- collision detect
   if (active.pos + active.height) >= height then
      table.insert(placed, {figure=active.figure, column=currentCollumn, row=active.pos})
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
