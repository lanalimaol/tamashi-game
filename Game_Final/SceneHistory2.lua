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






-------CENA 2 JIKAN NO TAMASHI---------


local backCena2 = display.newImageRect("fundoSc.jpg", 2000, 1200)
backCena2:setFillColor(1)
sceneGroup:insert(backCena2)
backCena2.x = 160
backCena2.y = 100




local emitterParams = require( "emitter" )

local emitter = display.newEmitter( emitterParams )
emitter.x = display.contentCenterX
emitter.y = display.contentCenterY - 50
emitter.angle = 180
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



--------------------------------------------------------------------------------------


local mahouSpriteSheet2 = graphics.newImageSheet( "maguinnegro.png",
                                { width = 128, height = 128, numFrames = 2})

local mahouAnimation2 = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
  


        }




local mahou2 = display.newSprite( mahouSpriteSheet2, mahouAnimation2 )
mahou2.x = 340
mahou2.y = 470
mahou2.xScale = 4
mahou2.yScale = 4
mahou2:setSequence("run")
mahou2:play()
    



------------------------------------------------------------------------------------------------------------


local dialogueSpriteSheet1 = graphics.newImageSheet( "naguentomais2.png",
                                { width = 256, height = 256, numFrames = 2})

local dialogueAnimation1 = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
          

        }

local dialogue2 = display.newSprite( dialogueSpriteSheet1, dialogueAnimation1 )
dialogue2.x = 390
dialogue2.y = 140

dialogue2.xScale = 4
dialogue2.yScale = 2
dialogue2:setSequence("run")
dialogue2:play()


--------------------------------------------------------------------------------------------------------------

local caracteres = ""
local dialogo1 = display.newText({ text = "", x = 120, y = 70, font = "PressStart2P.ttf", fontSize = 10})
dialogo1:setFillColor( 0 )
dialogo1.anchorX = 0
dialogo1.anchorY = 0


caracteres = "Há muitos anos atrás\neu era o defensor do vilarejo de Kunigami\nfui escolhido e nomeado como\nGuardião do Vilarejo.\nMas, em uma batalha contra\naquele que queria tomar o vilarejo, o mago Asaki\neu perdi Tamashi, minha alma.\nAsaki era mais poderoso que eu, e para derrotá-lo era\nnecessário selá-lo.\nem troca do selamento,o deus Karito pediu\nminha alma.."






---------------------------------------------------------------------------------------------------------------


local circleNext2
local function buttonTouch2()

    circleNext2 = display.newImageRect("next.png" , 200, 200)
    circleNext2.x = 390
    circleNext2.y = 380
end



----------------------------------------------------------------------------------------------------------------
local numero = 1

for i=numero, #caracteres, 1 do
    print(i)
    local delay = i * 30
    print( delay )
    timer.performWithDelay( delay, function()
        dialogo1.text = string.sub(caracteres, 1, i)

if (i >= 354) then 
buttonTouch2()

circleNext2.eventFun2 = function ( event)
    if (event.phase == "began") then
        display.remove(emitter)
        display.remove(dialogo1)
        display.remove(mahou2)
        display.remove(backCena2)
        display.remove(dialogue2)
        display.remove(circleNext2)
        timer.cancel("id")
        composer.gotoScene("SceneHistory3")

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