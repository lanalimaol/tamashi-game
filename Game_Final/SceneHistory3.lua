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





-------------------------------------------------------------------------------------------------------------------------

local backCena3 = display.newImageRect("fundoSc.jpg", 2000, 1200)
sceneGroup:insert(backCena3)
backCena3.x = 160
backCena3.y = 100

local back2Cena3 = display.newRect(160,240, 2000, 1200)
back2Cena3.alpha = 0.7
back2Cena3:setFillColor(0)
sceneGroup:insert(back2Cena3)


    
--------------------------------------------------------------------------------------------------------------------------

local tamashiSpriteSheetCena3 = graphics.newImageSheet( "tamashifita13.png",
                                { width = 192, height = 192, numFrames = 12})

local tamashiAnimationCena3 = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },

            

        }


local tamashiCena3 = display.newSprite( tamashiSpriteSheetCena3, tamashiAnimationCena3 )
tamashiCena3.x = 400
tamashiCena3.y = 270
tamashiCena3.alpha = 0
transition.fadeIn(tamashiCena3, {time = 10000}) 
tamashiCena3.xScale = 4
tamashiCena3.yScale = 4
tamashiCena3:setSequence("run")
tamashiCena3:play()



----------------------------------------------------------------------------------------------------------------------------

local emitter = display.newEmitter( emitterParams )
emitter.x = tamashiCena3.x
emitter.y = tamashiCena3.y
emitter.startParticleSize = 5
emitter.angle = -90
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




------------------------------------------------------------------------------------------------------------------------
local caracteres = ""
local dialogoCena3 = display.newText({ text = "", x = -30, y = 90, font = "PressStart2P.ttf", fontSize = 10})
dialogoCena3:setFillColor( 1 )
dialogoCena3.anchorX = 0
dialogoCena3.anchorY = 0


caracteres = "Tamashi é uma alma negra carregada de mana. sem ela, eu não posso usar magia, pois\ntodos os meus poderes estão concentrados nela. Dessa forma, eu preciso da minha alma\npara poder voltar a defender o vilarejo."




-------------------------------------------------------------------------------------------------------------------------

local circleNext3
local function buttonTouch3()

    circleNext3 = display.newImageRect("next.png" , 200, 200)
    circleNext3.x = 400
    circleNext3.y = 430
end

--------------------------------------------------------------------------------------------------------------------------

local numero = 1

for i=numero, #caracteres, 1 do
    print(i)
    local delay = i * 30
    print( delay )
    timer.performWithDelay( delay, function()
        dialogoCena3.text = string.sub(caracteres, 1, i)

if (i >= 211) then 
buttonTouch3()

circleNext3.eventFun3 = function ( event)
    if (event.phase == "began") then 
        display.remove(emitter)
        display.remove(dialogoCena3)
        display.remove(tamashiCena3)
        display.remove(tamashiInDialogue)
        display.remove(dialogue6)
        display.remove(backCena3)
        display.remove(dialogue7)
        display.remove(circleNext3)
        timer.cancel("id")
        composer.gotoScene("SceneHistory4")



    end 
end
circleNext3:addEventListener("touch", circleNext3.eventFun3)


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