love.load = function ()
   filled = {}
   x,y = 0,0
   speed = 50
   currentCollumn = 0
   placed = {}
   active = {}
   active.rotation = 0
   active.isDead = false
   active.pos = 0
   active.height = 100
   active.figure = '|'
   active.reset = function () 
      placed = {}
      filled = {}
      active.isDead = false
      active.pos = 0
      active.height = 100
      active.figure = 't'
      speed = 1
   end
   figures = {'t', '|', 'square', 'L'} 

   figures.t = function (offsetX, offsetY) 
      if active.rotation == 0 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 0 + offsetX, 50+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 50 + offsetX, 50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 100 + offsetX, 50+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 50 + offsetX, 0+offsetY)
      elseif active.rotation == 1 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 0 + offsetX, 0+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 0 + offsetX, 50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 0 + offsetX, 100+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 50 + offsetX, 50+offsetY)
      elseif active.rotation == 2 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 0 + offsetX, -50+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 50 + offsetX, -50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 100 + offsetX, -50+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 50 + offsetX, 0+offsetY)
      elseif active.rotation == 3 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 100 + offsetX, 0+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 100 + offsetX, 50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 100 + offsetX, 100+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 50 + offsetX, 50+offsetY)
      end
   end

   figures['|'] = function(offsetX, offsetY)
      if (active.rotation % 2) == 0 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 00 + offsetX, 50+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 50 + offsetX, 50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 100 + offsetX, 50+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 150 + offsetX, 50+offsetY)
      elseif (active.rotation %2) == 1 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 50 + offsetX, 0+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 50 + offsetX, 50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 50 + offsetX, 100+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 50 + offsetX, 150+offsetY)
      end
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
      if active.rotation == 0 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 0+ offsetX, 50+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 50 + offsetX, 50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 100+ offsetX, 50+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 100+ offsetX, 0+offsetY)
      elseif active.rotation == 1 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 50+ offsetX, 0+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 50 + offsetX, 50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 50+ offsetX, 100+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 0+ offsetX, 100+offsetY)
      elseif active.rotation == 2 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 0+ offsetX, 0+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 50 + offsetX, 0+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 100+ offsetX, 0+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 0+ offsetX, 50+offsetY)
      elseif active.rotation == 3 then
         love.graphics.setColor(1, 0, 1, 1)
         figures.tile( 50+ offsetX, 0+offsetY)
         love.graphics.setColor(0.75, 0, 1, 1)
         figures.tile( 50 + offsetX, 50+offsetY)
         love.graphics.setColor(0.5, 0, 1, 1)
         figures.tile( 50+ offsetX, 100+offsetY)
         love.graphics.setColor(0.25, 0, 1, 1)
         figures.tile( 100+ offsetX, 0+offsetY)
      end
   end

   figures.tile = function(offsetX, offsetY)
      love.graphics.rectangle('fill', 0+ offsetX, offsetY, 50, 50)
   end

   figures.tiles = function (fig, col, row) 
      local result = {}

      if active.figure == '|' then
         if (active.rotation % 2) == 0 then
            table.insert(result, {column=col,row=50+row})
            table.insert(result, {column=col+1,row=50+row})
            table.insert(result, {column=col+2,row=50+row})
            table.insert(result, {column=col+3,row=50+row})
         elseif (active.rotation %2) == 1 then
            table.insert(result, {column=col, row=0+row})
            table.insert(result, {column=col, row=50+row})
            table.insert(result, {column=col, row=100+row})
            table.insert(result, {column=col, row=150+row})
         end
      end


      if fig == 't' then
      if active.rotation == 0 then
         table.insert(result, {column=0 + col, row=50+row})
         table.insert(result, {column=1 + col, row=50+row})
         table.insert(result, {column=2 + col, row=50+row})
         table.insert(result, {column=1 + col, row=0+row})
      elseif active.rotation == 1 then
         table.insert(result, {column=0 + col, row=0+row})
         table.insert(result, {column=0 + col, row=50+row})
         table.insert(result, {column=0 + col, row=100+row})
         table.insert(result, {column=1 + col, row=50+row})
      elseif active.rotation == 2 then
         table.insert(result, {column=0 + col, row=-50+row})
         table.insert(result, {column=1 + col, row=-50+row})
         table.insert(result, {column=2 + col, row=-50+row})
         table.insert(result, {column=3 + col, row=0+row})
      elseif active.rotation == 3 then
         table.insert(result, {column=2 + col, row=0+row})
         table.insert(result, {column=2 + col, row=50+row})
         table.insert(result, {column=2 + col, row=100+row})
         table.insert(result, {column=1 + col, row=50+row})
      end
      end

      if fig == 'square' then
         table.insert(result, {column=col, row=row+50})
         table.insert(result, {column=col+1, row=row+50})
         table.insert(result, {column=col, row=row})
         table.insert(result, {column=col+1, row=row})
      end

      if fig == 'L' then
      if active.rotation == 0 then
         table.insert(result, {column=0+ col, row=50+row})
         table.insert(result, {column=1 + col, row=50+row})
         table.insert(result, {column=2+ col, row=50+row})
         table.insert(result, {column=2+ col, row=0+row})
      elseif active.rotation == 1 then
         table.insert(result, {column=1+ col, row=0+row})
         table.insert(result, {column=1 + col, row=50+row})
         table.insert(result, {column=1+ col, row=100+row})
         table.insert(result, {column=0+ col, row=100+row})
      elseif active.rotation == 2 then
         table.insert(result, {column=0+ col, row=0+row})
         table.insert(result, {column=1 + col, row=0+row})
         table.insert(result, {column=2+ col, row=0+row})
         table.insert(result, {column=0+ col, row=50+row})
      elseif active.rotation == 3 then
         table.insert(result, {column=1+ col, row=0+row})
         table.insert(result, {column=1 + col, row=50+row})
         table.insert(result, {column=1+ col, row=100+row})
         table.insert(result, {column=2+ col, row=0+row})
      end

      end
      return result
   end

   figures.calcRowNr = function (number) 
      return ((math.ceil(number/50)-1)*50)
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
      if (filled[figures.calcRowNr(place.row)] ~= nil) then
         love.graphics.setColor(0.25, 0.5, 1, 1)
      else
         love.graphics.setColor(0.25, 0, 1, 1)
      end
     figures.tile(place.column*50, place.row) 
  end
end

love.update = function(dt)
   if active.isDead then
      return
   end
  for k,place in pairs(placed) do
      if (filled[figures.calcRowNr(place.row)] ~= nil) then
         placed[k] = nil
      end
  end
  for k,place in pairs(placed) do
     drops = 0
     for k,nothing in pairs(filled) do
        if figures.calcRowNr(place.row) < k then
           drops = drops + 1
        end
     end
     place.row = place.row + drops * 50
  end

  filled = {}

   mouseX, mouseY = love.mouse.getPosition()
   width, height = love.graphics.getDimensions( )

   x = x + 1
   y = y + 1

   active.pos = active.pos + speed * dt

   insert = function (offset) 
      if active.pos < 50 then
         active.isDead = true
         return
      end

      for k,v in pairs(figures.tiles(active.figure, currentCollumn, figures.calcRowNr(active.pos) + offset)) do
         table.insert(placed, v)
      end

      active.pos = 0
      active.figure = figures[math.random(#figures)]

      if active.figure == '|' then
         active.height = 50
      else 
         active.height = 100
      end

      counters = {}
      for k,place in pairs(placed) do
         existing = counters[figures.calcRowNr(place.row)]
         if
         existing == nil then
            counters[figures.calcRowNr(place.row)] = 1
         else
            counters[figures.calcRowNr(place.row)] = existing + 1
         end
      end

      for k,v in pairs(counters) do
         if v >= 13 then
            filled[k] = true
         end
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
      speed = speed + 10
   end
   if isrepeat then
      return
   end
   if key == "up" then
      active.rotation = (active.rotation + 1) % 4
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
