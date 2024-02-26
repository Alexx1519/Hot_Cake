 

AI = {}


function AI:load()
    self.w = 10
    self.height = 200
    self.x = 1350/2
    self.y = love.graphics.getHeight() / 2
    self.yVel = 0
    self.speed = 500

    self.timer = 0
    self.rate = 1

    Yo = love.graphics.newImage('plato2.png')

end

function AI:update(dt)
    self:move(dt)
    self.timer = self.timer + dt
    if self.timer > self.rate then
       self.time = 0
       self:acquireTarget()
    end
end

function AI:move(dt)
    self.y = self.y + self.yVel * dt
end

function AI:acquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end

function AI:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.height)

    love.graphics.draw(Yo, self.x - 43 , self.y - 20)
end