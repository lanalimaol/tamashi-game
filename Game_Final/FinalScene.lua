local composer = require( "composer" )
local emitterParams = require( "emitter" )
 
local scene = composer.newScene()
 

function scene:create( event )
 
    local sceneGroup = self.view

 
end
 
 
-- show()
function scene:show( event )


    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
 
    elseif ( phase == "did" ) then






local back = display.newImageRect("fundo.png", 13000, 1300 )
-- back:setFillColor(1)
sceneGroup:insert(back)
back.x = 160 + 200
back.y = -40




-------------------------------------------------------------------------------------------------

local playerSpriteSheetB = graphics.newImageSheet( "maguinho.png",
                                { width = 512, height = 512, numFrames = 4})

local playerAnimationB = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
  


        
            

        }



local playerB = display.newSprite( playerSpriteSheetB, playerAnimationB )
playerB.x = 400
playerB.y = 540
-- playerB.alpha = 0
playerB.xScale = -0.8
playerB.yScale = 0.8
playerB:setSequence("run")
playerB:play()

-------------------------------------------------------------------------------------------------

local emitter = display.newEmitter( emitterParams )
emitter.x = playerB.x
emitter.y = playerB.y + (-10)
-- emitter.alpha = 0
emitter.angle = -90
emitter.maxParticles = 100
emitter.sourcePositionVariancex = 9
emitter.sourcePositionVariancey = 9
emitter.startColorRed = 1
emitter.startColorGreen = 0
emitter.startColorBlue = 1
emitter.startColorAlpha = 1
emitter.startColorVarianceRed = 0
emitter.startColorVarianceGreen = 0
emitter.startColorVarianceBlue = 0.5
emitter.startColorVarianceAlpha = 1
emitter.finishColorRed = 0
emitter.finishColorGreen = 0
emitter.finishColorBlue = 1
emitter.finishColorAlpha = 0.2
emitter.finishColorVarianceRed = 0
emitter.finishColorVarianceGreen = 0
emitter.finishColorVarianceBlue = 1
emitter.finishColorVarianceAlpha =0.5
emitter.startParticleSizeVariance = 9
emitter.finishParticleSize = 3
emitter.finishParticleSizeVariance = 3



-------------------------------------------------------------------------------------------------
local floor = display.newImageRect("plataforma.png", 400 , 240 )
floor.x = 400
floor.y = 620

-------------------------------------------------------------------------------------------------

local tamashiSS = graphics.newImageSheet( "tamashifita13.png",
                                { width = 192, height = 192, numFrames = 12})

local animationTamashiSS = 
        {
            { name = "run", start = 8,count =1 , time = 400, loopCount = 0   },
  


        
            

        }





-------------------------------------------------------------------------------------------------

local function gameLoop()   
playerB.y = playerB.y -1
emitter.y = playerB.y -1

if (playerB.y == 500 ) then 

    transition.to( playerB, { y = 430, time = 800 , onComplete = function ()
    transition.to( playerB, { y= 510, time = 800, onComplete = movePlataforma } )
        end } )

end 

end 

Runtime:addEventListener ("enterFrame" , gameLoop )

    
     -------------------------------------------------------------------------------------------------   
            



local caracteres = ""
local dialogo1 = display.newText({ text = "", x = -30, y = 70, font = "PressStart2P.ttf", fontSize = 10})
dialogo1:setFillColor( 1 )
dialogo1.anchorX = 0
dialogo1.anchorY = 0




caracteres = "Você conseguiu, nobre mago de Ouchi! Serei eternamente grato pela sua coragem \nde ajudar-me. Agora você poderá voltar em paz para casa, e eu, poderei protegê-los\nenquanto eu puder. Agora vá."




-------------------------------------------------------------------------------------------------

local numero = 1

for i=numero, #caracteres, 1 do
    print(i)
    local delay = i * 30
    print( delay )
    timer.performWithDelay( delay, function()
        dialogo1.text = string.sub(caracteres, 1, i)

if (i >= 195) then 

    timer.performWithDelay( 5000, function ( ... )

        audio.stop(canalAudioFloresta)
        display.remove(floor)
        display.remove(emitter)
        display.remove(dialogo1)
        display.remove(player)
        display.remove(playerB)
        Runtime:removeEventListener("enterFrame" , gameLoop)
        display.remove(back)
        display.remove(dialogue)
        display.remove(circleNext2)
        timer.cancel("id")
        composer.gotoScene("menu")

    end, 1 )




    


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