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



---------------------------------------------------------------------------------------------------------------------



local backCena5 = display.newImageRect("fundoSc.jpg", 2000, 1200)
sceneGroup:insert(backCena5)
backCena5.x = 160
backCena5.y = 100

local back2Cena5 = display.newRect(160,240, 2000, 1200)
back2Cena5.alpha = 0.7
back2Cena5:setFillColor(0)
sceneGroup:insert(back2Cena5)


---------------------------------------------------------------------------------------------------------------------

local slimeSpriteSheetCena5 = graphics.newImageSheet( "slime.png",
                                { width = 384, height = 384, numFrames = 8})

local slimeAnimationCena5 = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
  


        
            

        }



local slimeCena5 = display.newSprite( slimeSpriteSheetCena5, slimeAnimationCena5 )
slimeCena5.x = 410
slimeCena5.y = 270
slimeCena5.alpha = 0
transition.fadeIn(slimeCena5, {time = 20000}) 
slimeCena5.xScale = 4
slimeCena5.yScale = 4
slimeCena5:setSequence("run")
slimeCena5:play()
---------------------------------------------------------------------------------------------------------------------

local emitter = display.newEmitter( emitterParams )
emitter.x = slimeCena5.x
emitter.y = slimeCena5.y
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


---------------------------------------------------------------------------------------------------------------------



local caracteres = ""
local dialogoCena5 = display.newText({ text = "", x = -30, y = 90, font = "PressStart2P.ttf", fontSize = 10})
dialogoCena5:setFillColor( 1 )
dialogoCena5.anchorX = 0
dialogoCena5.anchorY = 0

caracteres = "A floresta tamebém conta com almas amaldiçoadas que não retornaram ao seu receptáculo,\ncaso você seja atingido por eles será redirecionado ao mesmo lugar sempre,\nessa é uma magia de loop infinito..."


---------------------------------------------------------------------------------------------------------------------


local circleNext5
local function buttonTouch5()

    circleNext5 = display.newImageRect("next.png" , 200, 200)
    circleNext5.x = 420
    circleNext5.y = 430
end



---------------------------------------------------------------------------------------------------------------------


local numero = 1

for i=numero, #caracteres, 1 do
    print(i)
    local delay = i * 30
    print( delay )
    timer.performWithDelay( delay, function()
        dialogoCena5.text = string.sub(caracteres, 1, i)

if (i >= 205) then 
buttonTouch5()

circleNext5.eventFun5 = function ( event)
    if (event.phase == "began") then 
        display.remove(emitter)
        display.remove(dialogoCena5)
        display.remove(slimeCena5)
        display.remove(tamashiInDialogue)
        display.remove(dialogue6)
        display.remove(backCena5)
        display.remove(dialogue7)
        display.remove(circleNext5)
        timer.cancel("id")
        composer.gotoScene("SceneHistory6")



    end 
end
circleNext5:addEventListener("touch", circleNext5.eventFun5)


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