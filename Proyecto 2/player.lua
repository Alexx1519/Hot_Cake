Player = {}


function Player:load()
    self.x = 100/2 -- Otra vez no hagarro love.graphics.getWidth ()/2
    self.y = love.graphics.getHeight() /2
    self.w = 10 -- Otra vez no hagarro self.width
    self.height = 200
    self.speed = 500

    Yo = love.graphics.newImage('plato.png')
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()
end

function Player:move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt 
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function Player:checkBoundaries()
    if self.y < 0 then
        self.y = 0
     elseif self.y + self.height > love.graphics.getHeight() then
       self.y = love.graphics.getHeight() - self.height
     end
end


function Player:draw()
   
   love.graphics.rectangle("fill", self.x, self.y, self.w, self.height)

   love.graphics.draw(Yo, self.x -35, self.y -30)
end