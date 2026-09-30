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




-----------------------------------------------------------------------------------------------------

local backCena4 = display.newImageRect("fundoSc.jpg", 2000, 1200)
sceneGroup:insert(backCena4)
backCena4.x = 160
backCena4.y = 100
local back2Cena4 = display.newRect(160,240, 2000, 1200)
back2Cena4.alpha = 0.7
back2Cena4:setFillColor(0)
sceneGroup:insert(back2Cena4)



------------------------------------------------------------------------------------------------------
local relogioCena4 = display.newImageRect( "tie.png", 1024/2,1024/2)
relogioCena4.x = 410
relogioCena4.y =270
relogioCena4.alpha = 0
transition.fadeIn(relogioCena4, {time = 20000}) 


-----------------------------------------------------------------------------------------------------

local emitter = display.newEmitter( emitterParams )
emitter.x = relogioCena4.x
emitter.y = relogioCena4.y
emitter.startParticleSize = 5
emitter.angle = -90
emitter.angleVariance = 360
emitter.startColorRed = 1
emitter.startColorGreen = 1
emitter.startColorBlue = 0
emitter.startColorAlpha = 0.7
emitter.startColorVarianceRed = 0
emitter.startColorVarianceGreen = 0.5
emitter.startColorVarianceBlue = 0
emitter.startColorVarianceAlpha = 0.5
emitter.finishColorRed = 0
emitter.finishColorGreen = 0.2
emitter.finishColorBlue = 0.2
emitter.finishColorAlpha = 0.2
emitter.finishColorVarianceRed = 0
emitter.finishColorVarianceGreen = 0
emitter.finishColorVarianceBlue = 0
emitter.finishColorVarianceAlpha = 0


---------------------------------------------------------------------------------------------------------------

local caracteres = ""
local dialogoCena4 = display.newText({ text = "", x = -30, y = 90, font = "PressStart2P.ttf", fontSize = 10})
dialogoCena4:setFillColor( 1 )
dialogoCena4.anchorX = 0
dialogoCena4.anchorY = 0


caracteres = "Devo lembrá-lo, a floresta é encantada e tem um tempo regressivo para tentar\nsair de lá. Mas, existe um item que lhe concederá tempo. Em troca disso todas\nas almas que estão lá não podem usar magia para se defender ao tentar sair, apenas\ntentar desviar dos ataques inimigos.."


----------------------------------------------------------------------------------------------------------------

local circleNext4
local function buttonTouch4()
circleNext4 = display.newImageRect("next.png" , 200, 200)
circleNext4.x = 400
circleNext4.y = 430
end




----------------------------------------------------------------------------------------------------------------

local numero = 1

for i=numero, #caracteres, 1 do
    print(i)
    local delay = i * 30
    print( delay )
    timer.performWithDelay( delay, function()
        dialogoCena4.text = string.sub(caracteres, 1, i)

if (i >= 282) then 
buttonTouch4()

circleNext4.eventFun4 = function ( event)
    if (event.phase == "began") then 
        display.remove(emitter)
        display.remove(dialogoCena4)
        display.remove(relogioCena4)
        display.remove(backCena4)
        display.remove(circleNext4)
        timer.cancel("id")
        composer.gotoScene("SceneHistory5")



    end 
end
circleNext4:addEventListener("touch", circleNext4.eventFun4)


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