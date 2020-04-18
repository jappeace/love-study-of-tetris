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
      figures.tile( 0 + offsetX, 50+offsetY)
      love.graphics.setColor(0.75, 0, 1, 1)
      figures.tile( 50 + offsetX, 50+offsetY)
      love.graphics.setColor(0.5, 0, 1, 1)
      figures.tile( 100 + offsetX, 50+offsetY)
      love.graphics.setColor(0.25, 0, 1, 1)
      figures.tile( 50 + offsetX, 0+offsetY)
   end

   figures['|'] = function(offsetX, offsetY)
      love.graphics.setColor(1, 0, 1, 1)
      figures.tile( 00 + offsetX, 50+offsetY)
      love.graphics.setColor(0.75, 0, 1, 1)
      figures.tile( 50 + offsetX, 50+offsetY)
      love.graphics.setColor(0.5, 0, 1, 1)
      figures.tile( 100 + offsetX, 50+offsetY)
      love.graphics.setColor(0.25, 0, 1, 1)
      figures.tile( 150 + offsetX, 50+offsetY)
   end

   figures.square = function(offsetX, offsetY)
      love.graphics.setColor(1, 0, 1, 1)
      figures.tile( 0 + offsetX, 50+offsetY)
      love.graphics.setColor(0.75, 0, 1, 1)
      figures.tile( 50 + offsetX, 50+offsetY)
      love.graphics.setColor(0.5, 0, 1, 1)
      figures.tile( 0 + offsetX, 00+offsetY)
      love.graphics.setColor(0.25, 0, 1, 1)
      figures.tile( 50 + offsetX, 00+offsetY)
   end

   figures.L= function(offsetX, offsetY)
      love.graphics.setColor(1, 0, 1, 1)
      figures.tile( 0+ offsetX, 50+offsetY)
      love.graphics.setColor(0.75, 0, 1, 1)
      figures.tile( 50 + offsetX, 50+offsetY)
      love.graphics.setColor(0.5, 0, 1, 1)
      figures.tile( 100+ offsetX, 50+offsetY)
      love.graphics.setColor(0.25, 0, 1, 1)
      figures.tile( 100+ offsetX, 0+offsetY)
   end

   figures.tile = function(offsetX, offsetY)
      love.graphics.rectangle('fill', 0+ offsetX, offsetY, 50, 50)
   end

end

-- love.graphics.rectangle('fill', 0+ (currentCollumn * 50), 50+active.pos, 50, 50)

love.draw = function ()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print('Hello, World!' .. currentCollumn , 500, 300)

  love.graphics.print('Hello, World!' .. active.figure .. ' - ' .. active.height, 400, 400)
  love.graphics.line( x, y, mouseX, mouseY)

  figures[active.figure]((currentCollumn * 50), active.pos)

  for k,place in pairs(placed) do
     figures.tile(place.column*50, place.row) 
  end

end


love.update = function(dt)
   mouseX, mouseY = love.mouse.getPosition()
   width, height = love.graphics.getDimensions( )

   x = x + 1
   y = y + 1

   active.pos = active.pos + 5 

   insert = function () 
      if active.figure == '|' then
         table.insert(placed, {column=currentCollumn, row=active.pos})
         table.insert(placed, {column=currentCollumn+1, row=active.pos})
         table.insert(placed, {column=currentCollumn+2, row=active.pos})
         table.insert(placed, {column=currentCollumn+3, row=active.pos})
      end
      if active.figure == 't' then
         table.insert(placed, {column=currentCollumn, row=active.pos+50})
         table.insert(placed, {column=currentCollumn+1, row=active.pos+50})
         table.insert(placed, {column=currentCollumn+2, row=active.pos+50})
         table.insert(placed, {column=currentCollumn+1, row=active.pos})
      end
      if active.figure == 'square' then
         table.insert(placed, {column=currentCollumn, row=active.pos+50})
         table.insert(placed, {column=currentCollumn+1, row=active.pos+50})
         table.insert(placed, {column=currentCollumn, row=active.pos})
         table.insert(placed, {column=currentCollumn+1, row=active.pos})
      end

      if active.figure == 'L' then
         table.insert(placed, {column=currentCollumn, row=active.pos+50})
         table.insert(placed, {column=currentCollumn+1, row=active.pos+50})
         table.insert(placed, {column=currentCollumn+2, row=active.pos+50})
         table.insert(placed, {column=currentCollumn+2, row=active.pos})
      end

      active.pos = 0
      active.figure = figures[math.random(#figures)]

      if active.figure == '|' then
         active.height = 50
      else 
         active.height = 100
      end
   end

   collisionCheck = function (place)
      return place.column == currentCollumn and active.pos + active.height == place.row
   end

   -- collision detect
  for k,place in pairs(placed) do
     if collisionCheck(place) then
      insert()
     end
  end

   if (active.pos + active.height) >= height then
      insert()
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
