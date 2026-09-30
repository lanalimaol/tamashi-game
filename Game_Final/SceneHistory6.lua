local composer = require( "composer" )
local emitterParams = require( "emitter" )
 
local scene = composer.newScene()
 

function scene:create( event )
 
    local sceneGroup = self.view

 
end
 
 

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
 
    elseif ( phase == "did" ) then





----------------------------------------------------------------------------------------------------------

local backCena6 = display.newImageRect("fundoSc.jpg", 2000, 1200)
-- backCena6:setFillColor(1)
sceneGroup:insert(backCena6)
backCena6.x = 160
backCena6.y = 100

local back2Cena6 = display.newRect(160,240, 2000, 1200)
back2Cena6.alpha = 0.7
back2Cena6:setFillColor(0)
sceneGroup:insert(back2Cena6)




----------------------------------------------------------------------------------------------------------

local mahouSpriteSheet2 = graphics.newImageSheet( "maguinnegro.png",
                                { width = 128, height = 128, numFrames = 2})

local mahouAnimation2 = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
  


        
            

        }



local mahou2 = display.newSprite( mahouSpriteSheet2, mahouAnimation2 )
mahou2.x = 400
mahou2.y = 540
mahou2.alpha = 0
transition.fadeIn(mahou2, {time = 5000}) 
mahou2.xScale = 6
mahou2.yScale = 6
mahou2:setSequence("run")
mahou2:play()






----------------------------------------------------------------------------------------------------------

local loadingCena5 = graphics.newImageSheet( "loading.png",
                                { width = 128, height = 128, numFrames = 4})

local animationLoading5 = 
        {
            { name = "run", start = 1,count =3 , time = 400, loopCount = 0   },
  


        
            

        }




local loadingCena6 = display.newSprite( loadingCena5, animationLoading5 )
loadingCena6.x = 410
loadingCena6.y = 230
loadingCena6.alpha = 0
transition.fadeIn(loadingCena6, {time = 5000}) 
loadingCena6.xScale = 1
loadingCena6.yScale = 1
loadingCena6:setSequence("run")
loadingCena6:play()





----------------------------------------------------------------------------------------------------------

local emitter = display.newEmitter( emitterParams )
emitter.x = mahou2.x
emitter.y = mahou2.y
emitter.angle = 180
emitter.angleVariance = 360
emitter.startColorRed = 0
emitter.startColorGreen = 0.7
emitter.startColorBlue = 0
emitter.startColorAlpha = 0.7
emitter.startColorVarianceRed = 0
emitter.startColorVarianceGreen = 0.5
emitter.startColorVarianceBlue = 0
emitter.startColorVarianceAlpha = 0.5
emitter.finishColorRed = 0
emitter.finishColorGreen = 0.2
emitter.finishColorBlue = 0
emitter.finishColorAlpha = 0.2
emitter.finishColorVarianceRed = 0
emitter.finishColorVarianceGreen = 0.1
emitter.finishColorVarianceBlue = 0
emitter.finishColorVarianceAlpha =0.5
emitter.startParticleSizeVariance = 4
emitter.finishParticleSize = 3
emitter.finishParticleSizeVariance = 3




----------------------------------------------------------------------------------------------------------

local caracteres = ""
local dialogoCena6 = display.newText({ text = "", x = -30, y = 90, font = "PressStart2P.ttf", fontSize = 10})
dialogoCena6:setFillColor( 1 )
dialogoCena6.anchorX = 0
dialogoCena6.anchorY = 0
caracteres = "Estarei esperando vocês do outro lado da floresta...Boa Sorte!"



----------------------------------------------------------------------------------------------------------
local numero = 1

for i=numero, #caracteres, 1 do
    print(i)
    local delay = i * 30
    print( delay )
    timer.performWithDelay( delay, function()
        dialogoCena6.text = string.sub(caracteres, 1, i)

if (i >= 63) then 

  composer.gotoScene("mainGame")

  timer.performWithDelay( 5000, function (  )
      
        -- audio.pause(canalAudioBG)
        display.remove(loadingCena6)
        display.remove(emitter)
        display.remove(dialogoCena6)
        display.remove(mahou2)
        display.remove(tamashiInDialogue)
        display.remove(dialogue6)
        display.remove(backCena6)
        display.remove(dialogue7)
        timer.cancel("id")

  end, 1 )


end 


end, 1)

end




    end
end


 
 
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