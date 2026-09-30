local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 -- grupo cena
 -- todos os objetos fora da camera ficarao dentro desse grupo

    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
 
    elseif ( phase == "did" ) then



local back = display.newImageRect("fundoSc.jpg", 2000, 1200)
back:setFillColor(1)
sceneGroup:insert(back)
back.x = 160
back.y = 100


local playerSpriteSheet = graphics.newImageSheet( "maguinnegro.png",
                                { width = 128, height = 128, numFrames = 2})

local playerAnimation = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
  


        
            

        }

local player = display.newSprite( playerSpriteSheet, playerAnimation )
player.x = 40
player.y = 300

player.xScale = 2
player.yScale = 2
player:setSequence("run")
player:play()





local caracteres = ""
local dialogo1 = display.newText({ text = "", x = 170, y = 140, font = "PressStart2P.ttf", fontSize = 10})
dialogo1:setFillColor( 1 )
dialogo1.anchorX = 0
dialogo1.anchorY = 0



local circleNext2
local function buttonTouch2()

circleNext2 = display.newText("next" , 170, 260, nil, 32)
circleNext2:setFillColor(1)
end


caracteres = "Devo imaginar o porque\nde ter vindo até mim!\nEstá pronto para guiar\na minha alma? Irei contar\na você sobre a floresta onde\nela foi condenada a vagar."





-- #(hashtag) + o nome da variável que guarda o texto
-- retorna o numero total de caracteres dentro da variavel de texto

local numero = 1

for i=numero, #caracteres, 1 do
    print(i)
    local delay = i * 100
    print( delay )
    timer.performWithDelay( delay, function()
        dialogo1.text = string.sub(caracteres, 1, i)

if (i >= 152) then 
buttonTouch2()

circleNext2.eventFun2 = function ( event)
    if (event.phase == "began") then 
        display.remove(dialogo1)
        display.remove(player)
        display.remove(back)
        
        composer.gotoScene("mainGame")



    end 
end
circleNext2:addEventListener("touch", circleNext2.eventFun2)


end 


end, 1)

end






         




    end
end


 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
 
    elseif ( phase == "did" ) then
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene