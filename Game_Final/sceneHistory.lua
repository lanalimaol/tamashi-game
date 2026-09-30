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





-------CENA 1 JIKAN NO TAMASHI---------

local backCena1 = display.newImageRect("fundoSc.jpg", 2000, 1200)
backCena1:setFillColor(1)
sceneGroup:insert(backCena1)
backCena1.x = 160
backCena1.y = 100



----FIQUEI COM PREGUIÇA DE FAZER OUTROS EMITTER'S OSCAR, VC Q LUTE :^----
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





----------------------AREA DE AUDIO1------------------------
                        --JUDAI--
local parametrosAudioBG = 
    {
        loops = 0, 
        fadein = 0,
        duration = 116000,
        onComplete = reproduzirAoCompletar
    }


local arquivoAudioBG = audio.loadStream( "backScene.mp3" )

local canalAudioBG = audio.play( arquivoAudioBG, parametrosAudioBG )
------------------------------------------------------------



----------------------SPRITESHEET MAHOU CENA1------------------------

local mahouSpriteSheet1 = graphics.newImageSheet( "maguinnegrgrande.png",
                                { width = 384, height = 384, numFrames = 2})

local mahouAnimation1 = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
        }


local mahou1 = display.newSprite( mahouSpriteSheet1, mahouAnimation1 )
mahou1.x = 100
mahou1.y = 470
mahou1.xScale = 2
mahou1.yScale = 2
mahou1:setSequence("run")
mahou1:play()
    






-------------------------FUNÇÃO SEPARADA PARA MOVER MAHOU-----------------------

local function moveMahou1()
    transition.to(mahou1, {x= 340})
end

moveMahou1()




--------------------------SPRITESHEET DO DIALOGO----------------------------

local dialogueSpriteSheet1 = graphics.newImageSheet( "naguentomais2.png",
                                { width = 256, height = 256, numFrames = 2})

local dialogueAnimation1 = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
        }

local dialogue1 = display.newSprite( dialogueSpriteSheet1, dialogueAnimation1 )
dialogue1.x = 390
dialogue1.y = 140
dialogue1.xScale = 2
dialogue1.yScale = 2
dialogue1:setSequence("run")
dialogue1:play()





---------------------------------AREA CONTENDO O TEXTO DO DIALOGO-------------------------------------------

local caracteres = ""
local dialogo1 = display.newText({ text = "", x = 240, y = 90, font = "PressStart2P.ttf", fontSize = 10})
dialogo1:setFillColor( 0 )
dialogo1.anchorX = 0
dialogo1.anchorY = 0
caracteres = "Ah! o que temos aqui?\nOlá, jovem mago de Ouchi!\nDevo imaginar o porque de\nter vindo até mim!\nvocê foi escolhido para\ntrazer tamashi até mim,\nseu receptáculo."



---------------------------FUNÇÃO SEM PARAMETROS QUE SERVE PARA CHAMAR UM BOTÃO NEXT---------------------------

local circleNext2
local function buttonTouch2()

circleNext2 = display.newImageRect("next.png" , 200, 200)
circleNext2.x = 390
circleNext2.y = 380
end





-------------------------"FOR" QUE RETORNA A CADEIA DE CARACTERES LETRA A LETRA------------------------------------

local numero = 1

for i=numero, #caracteres, 1 do
    print(i)
    local delay = i * 30
    print( delay )
    timer.performWithDelay( delay, function()
        dialogo1.text = string.sub(caracteres, 1, i)

if (i >= 162) then 
buttonTouch2()

circleNext2.eventFun2 = function ( event)
    if (event.phase == "began") then
        local square2 = display.newRect( 160, 240, 4000, 4000 )
        square2:setFillColor(0)
        transition.fadeOut( square2, { time=4000 } ) 
        display.remove(emitter)
        display.remove(dialogo1)
        display.remove(mahou1)
        display.remove(backCena1)
        display.remove(dialogue1)
        display.remove(circleNext2)
        timer.cancel("id")
        composer.gotoScene("SceneHistory2")



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