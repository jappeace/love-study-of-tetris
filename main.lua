love.load = function ()
   x,y = 0,0
   speed = 1
   currentCollumn = 0
   placed = {}
   active = {}
   active.isDead = false
   active.pos = 0
   active.height = 100
   active.figure = 't'
   active.reset = function () 
      placed = {}
      active.isDead = false
      active.pos = 0
      active.height = 100
      active.figure = 't'
      speed = 1
   end
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

   figures.tiles = function (fig, col, row) 
      local result = {}

      if active.figure == '|' then
         table.insert(result, {column=col, row=row})
         table.insert(result, {column=col+1, row=row})
         table.insert(result, {column=col+2, row=row})
         table.insert(result, {column=col+3, row=row})
      end

      if fig == 't' then
         table.insert(result, {column=col, row=row+50})
         table.insert(result, {column=col+1, row=row+50})
         table.insert(result, {column=col+2, row=row+50})
         table.insert(result, {column=col+1, row=row})
      end

      if fig == 'square' then
         table.insert(result, {column=col, row=row+50})
         table.insert(result, {column=col+1, row=row+50})
         table.insert(result, {column=col, row=row})
         table.insert(result, {column=col+1, row=row})
      end

      if fig == 'L' then
         table.insert(result, {column=col, row=row+50})
         table.insert(result, {column=col+1, row=row+50})
         table.insert(result, {column=col+2, row=row+50})
         table.insert(result, {column=col+2, row=row})
      end
      return result
   end

end

-- love.graphics.rectangle('fill', 0+ (currentCollumn * 50), 50+active.pos, 50, 50)

love.draw = function ()
  if active.isDead then
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.print('Oh noes, you died!!!' .. currentCollumn , 500, 300)
      love.graphics.print('Press any key to restart', 300, 500)
     return
  end

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
   if active.isDead then
      return
   end

   mouseX, mouseY = love.mouse.getPosition()
   width, height = love.graphics.getDimensions( )

   x = x + 1
   y = y + 1

   active.pos = active.pos + speed

   insert = function (offset) 
      if active.pos < 50 then
         active.isDead = true
         return
      end

      for k,v in pairs(figures.tiles(active.figure, currentCollumn, active.pos + offset)) do
         table.insert(placed, v)
      end
      active.pos = 0
      active.figure = figures[math.random(#figures)]

      if active.figure == '|' then
         active.height = 50
      else 
         active.height = 100
      end
   end

   collisionCheckActiveTile = function (gridTile, actTile )
      if gridTile.column ~= actTile.column then
         return false
      end
      if gridTile.row < (actTile.row + 50) and (gridTile.row + 50) > actTile.row then
         return true
      end
      return false
   end

   collisionCheck = function (gridTile)
      for k,v in pairs(figures.tiles(active.figure, currentCollumn, active.pos)) do
         if collisionCheckActiveTile(gridTile,v) then
            return true
         end
      end
      return false
   end

   -- collision detect
  for k,place in pairs(placed) do
     if collisionCheck(place) then
      insert(0)
     end
  end
   if (active.pos + active.height) >= height then
      insert(0)
   end

end

love.keypressed = function(key, unicode, isrepeat)
   if active.isDead then
      active.reset()
      return
   end
   if key == "down" then
      speed = speed + 1
   end
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
