require("player")
require("ball")
require("ai")
Music = love.audio.newSource("LofiCat.mp3","stream")
Music: play()

function love.load()
    Player:load()
    Ball:load()
    AI:load()
    background = love.graphics.newImage('Mesa3.jpg')
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
    
end
function love.draw()
    love.graphics.draw(background, 0, 0)

    love.graphics.setColor(254/255, 213/255, 143/255)
    love.graphics.circle("fill", 0, 0, 100, 100)
    love.graphics.circle("fill", 800, 0, 100, 100)
    love.graphics.circle("fill", 800,650 , 100, 100)
    love.graphics.circle("fill", 0, 650, 100, 100)

    love.graphics.setColor(1, 1, 1)

    Player:draw()
    AI:draw()
    Ball:draw()
    

end


function checkCollision(a, b)
    if a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.height > b.y and a.y < b.y + b.height then
     return true
    else
     return false
    end
end