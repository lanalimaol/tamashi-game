local composer = require( "composer" )
 
local scene = composer.newScene()
 

function scene:create( event )
 
    local sceneGroup = self.view
  
 
end
 

 
function scene:show( event )


    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
 
    elseif ( phase == "did" ) then

----------------------------------------------------------------
----------------------JUDAIZERA PRODUCTIONS---------------------
local parametrosAudioBG = 
    {
        loops = -1, 
        fadein = 0,
        duration = 116000,
        onComplete = reproduzirAoCompletar
    }


local arquivoAudioBG = audio.loadStream( "cenaFinal.mp3" )

local canalAudioBG = audio.play( arquivoAudioBG, parametrosAudioBG )

-----------------------------------------------------------------
-----------------------------------------------------------------

local emitterParams = require( "emitter" )


local back = display.newImageRect("fundo.png", 13000, 1300 )
-- back:setFillColor(1)
sceneGroup:insert(back)
back.x = 160 + 200
back.y = -40


-------------------------------------------------------------------------------------------------

local playerSpriteSheet = graphics.newImageSheet( "maguinnegrgrande.png",
                                { width = 384, height = 384, numFrames = 2})

local playerAnimation = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
    }



local player = display.newSprite( playerSpriteSheet, playerAnimation )
player.x = 400
player.y = 540

player.xScale = -1
player.yScale = 1
player:setSequence("run")
player:play()
    


local playerSpriteSheetB = graphics.newImageSheet( "maguinho.png",
                                { width = 512, height = 512, numFrames = 4})

local playerAnimationB = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
  


        
            

        }



local playerB = display.newSprite( playerSpriteSheetB, playerAnimationB )
playerB.x = 400
playerB.y = 540
playerB.alpha = 0
playerB.xScale = -0.8
playerB.yScale = 0.8
playerB:setSequence("run")
playerB:play()
    

-------------------------------------------------------------------------------------------------

local emitter = display.newEmitter( emitterParams )
emitter.x = playerB.x
emitter.y = playerB.y + (-10)
emitter.alpha = 0
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



local tamashi = display.newSprite( tamashiSS, animationTamashiSS )
tamashi.x = -100
tamashi.y = 540

tamashi.xScale = 1.5
tamashi.yScale =1.5
tamashi:setSequence("run")
tamashi:play()


-------------------------------------------------------------------------------------------------

local function gameLoop()   

tamashi.x = tamashi.x + 2

print("tamashi: " .. tamashi.x)

if (tamashi.x == player.x) then 
transition.fadeOut(player , { time=500 } ) 
transition.fadeOut( tamashi, { time=500 } )
transition.fadeIn( playerB, { time=500 } )  
transition.fadeIn( emitter, { time=500 } )


timer.performWithDelay(5000, function ()
        display.remove(playerB)
        display.remove(emitter)
        display.remove(floor)
        local square2 = display.newRect( 160, 240, 4000, 4000 )
        square2:setFillColor(0)
        transition.fadeOut( square2, { time=4000 } ) 
        composer.gotoScene("FinalScene")
end,1)



end 

end 

Runtime:addEventListener ("enterFrame" , gameLoop )


end



-------------------------------------------------------------------------------------------------



         




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