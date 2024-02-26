require ("collision")

Music = love.audio.newSource("LofiCat.mp3","stream")
Music: play()

function love.load()
    local font = love.graphics.newFont("04B_30__.TTF", 30)
    love.graphics.setFont(font)


    math.randomseed(os.time())
   
    player = {}
    player.x = 50
    player.y = 300
    player.w = 80
    player.h = 70

    coins = {}
   
    score = 0
   
    background = love.graphics.newImage('Mesa4.jpg')

    Miel = love.graphics.newImage('miel.png')
    
    Hotcake = love.graphics.newImage('Hotcake4.png')
end


function love.update(dt)
   if love.keyboard.isDown("right") then
       player.x = player.x + 4
   elseif love.keyboard.isDown("left") then
       player.x = player.x - 4
   elseif love.keyboard.isDown("down") then
       player.y = player.y + 4
   elseif love.keyboard.isDown("up") then
       player.y = player.y - 4
   end
    
    for i = #coins, 1, -1 do
        local coin = coins[i]
         if AABB(player.x, player.y, player.w, player.h, coin.x, coin.y, coin.w, coin.h) then
           table.remove(coins, i)
           score = score + 1
           src1 = love.audio.newSource("Miel.mp3", "static")
           src1:setVolume(0.5)
           src1:setPitch(1)
           src1:play()
         end
    end


   if math.random() < 0.01 then
    local coin = {}
    coin.w = 16
    coin.h = 16
    coin.x = math.random(0, 600 - coin.w)
    coin.y = math.random(0, 600 - coin.h)
    table.insert(coins, coin)
   end

end

function love.draw()

    love.graphics.draw(background, 0, 0)

    love.graphics.setColor(254/255, 213/255, 143/255)
    love.graphics.circle("fill", 0, 0, 100, 100)
    love.graphics.circle("fill", 800, 0, 100, 100)
    love.graphics.circle("fill", 800,600 , 100, 100)
    love.graphics.circle("fill", 0, 600, 100, 100)

    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
    love.graphics.draw(Hotcake, player.x - 25, player.y - 15)

    for i = 1, #coins, 1 do
        local coin = coins[i]
    
        love.graphics.rectangle("fill", coin.x, coin.y, coin.w, coin.h)
        love.graphics.draw(Miel, coin.x - 10, coin.y - 20)

    end
    
    love.graphics.setColor(254/255, 186/255, 173/255, 1.0)
    love.graphics.rectangle("fill", 189, 10, 270, 50)
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("SCORE: "..score, 200, 20)
end  