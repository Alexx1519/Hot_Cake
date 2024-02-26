Music = love.audio.newSource("LofiCat.mp3","stream")
Music: play()

function love.load()
    target = {}
    target.x = 410
    target.y = 500
    target.radius = 70
    target.sprite = love.graphics.newImage('P1.png')

    bot = {}
    bot.x = 140
    bot.y = 548
    
    
    score = 0
   
    
    gameFont = love.graphics.newFont(40)

    background = love.graphics.newImage('mesa2.png')

    local font = love.graphics.newFont("04B_30__.TTF", 30)
    love.graphics.setFont(font)  

end

function love.update(dt)
   
end

function love.draw()

  love.graphics.draw(background, 0, 0)
  
   love.graphics.setColor(254/255, 213/255, 143/255)
   love.graphics.circle("fill", 0, 0, 100, 100)
   love.graphics.circle("fill", 800, 0, 100, 100)
   love.graphics.circle("fill", 800,600 , 100, 100)
   love.graphics.circle("fill", 0, 600, 100, 100)

   --love.graphics.setColor(250/255, 128/255, 114/255)
   --love.graphics.rectangle("fill", bot.x , bot.y , 170, 40)
   --love.graphics.setColor(1, 1, 1)
   --love.graphics.print("Volver", 150, 550)



   love.graphics.setColor(161/255, 130/255, 98/255, 1.0)
   love.graphics.circle("fill",target.x, target.y,target.radius)
   
   love.graphics.setColor(1,1,1)
   love.graphics.setFont(gameFont)
   love.graphics.print(score, 100, 50)

   love.graphics.draw(target.sprite, target.x - 50, target.y - 50)

end

function love.mousepressed( x, y, button, istouch, presses )
  if button == 1 then
    local mouseToTarget = DistanciaMause(x , y , target.x, target.y)
    if mouseToTarget < target.radius then
        score = score + 1

      src1 = love.audio.newSource("Morder.mp3", "static")
      src1:setVolume(0.1)
      src1:setPitch(1)
      src1:play()

        target.x = math.random( target.radius, love.graphics.getWidth() - target.radius )
        target.y = math.random(
           target.radius, love.graphics.getHeight() - target.radius)
    end
  end
end

function DistanciaMause(x1, y1, x2, y2)

  return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )

end


