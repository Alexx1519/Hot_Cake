
BUTTON_HEIGHT = 60

Music = love.audio.newSource("LofiCat.mp3","stream")
Music: play()


local 
function newButton( text,fn )
    return{
       text = text,
       fn = fn,

       now = false,
       last = false
    }
end

local buttons = {}
local font = love.graphics.newFont("04B_30__.TTF", 30)
love.graphics.setFont(font)



function love.load( )

    local font = love.graphics.newFont("04B_30__.TTF")
    love.graphics.setFont(font)

    background = love.graphics.newImage('Mesa1.jpg')

    panqueca = love.graphics.newImage('Panqueca.png')

    font = love.graphics.newFont(2)

    font = love.graphics.newFont(30)
    

    -- boton solo para tutilo
    table.insert( buttons, newButton(
               "*Hotcake Game's*",
               function  ( )
                
               end
    ))

    table.insert( buttons, newButton(
               "Eat The Hotcake",
           function  ( )
            
           end

    ))

    table.insert( buttons, newButton(
        "Hit the Hotcake",
        function  ( )
         love.graphics.print(" 2")
        end

    ))

    table.insert( buttons, newButton(
           ".Look for Honey.",
           function  ( )
            love.graphics.print(3)
           end

    ))

    table.insert( buttons, newButton(
           "  * Game Exit *",
           function  ( )
            love.event.quit(0)
           end

    )) 

 
end

function love.update(dt )

    if not Music:isPlaying() then
        Music: play()
    end

end

function love.draw(  )

    love.graphics.draw(background, 0, 0)

    love.graphics.draw(panqueca, 200, 300)

    local ww = love.graphics.getWidth()
    local wh = love.graphics.getHeight()
    
    local button_width = ww * (1.5/3)

    local margin = 10

    
    love.graphics.setColor(254/255, 213/255, 143/255)
    love.graphics.circle("fill", 0, 0, 100, 100)
    love.graphics.circle("fill", 800, 0, 100, 100)
    love.graphics.circle("fill", 800,600 , 100, 100)
    love.graphics.circle("fill", 0, 600, 100, 100)

    local total_height = (BUTTON_HEIGHT + margin) * #buttons
    local cursor_y = 0

    for i, button in ipairs(buttons) do

        button.last = button.now 
        

        local bx = (ww * 0.5) - (button_width * 0.5)
        local by = (wh * 0.5) - (total_height *  0.5) + cursor_y

        local color = {254/255, 136/255, 120/255, 1.5}

        local mx, my = love.mouse.getPosition()


        local hot = mx > bx and mx < bx + button_width and
                    my > by and my < by + BUTTON_HEIGHT

        if hot then
           color = {254/255, 186/255, 173/255, 1.0}
        end 

        button.now = love.mouse.isDown(1)
        if button.now and not button.last and hot then
           button.fn()
        end

        love.graphics.setColor(unpack(color))
        love.graphics.rectangle( 
            "fill",
              bx,
              by,
              button_width,
              BUTTON_HEIGHT

        )
        love.graphics.setColor(1, 1, 1, 1)
 
        
        local textH = font:getHeight(button, text)
        local textW = font:getHeight(button, text) -- Nota : no quiso hagarar el Ancho y quedo torcido :-(

        love.graphics.print(
             button.text,
             font,
             (ww * 0.5) - (textW / 0.16) ,
             by + textH * 0.5
             )
          cursor_y = cursor_y + (BUTTON_HEIGHT + margin)

    end


end