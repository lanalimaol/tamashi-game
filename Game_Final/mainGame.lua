local composer = require ( "composer" )
local physics = require ( "physics" )
local classHUD = require("classHUD")
local classePlayer = require ( "classPlayer" )
local perspective = require ("perspective")
local classColetaveis = require ("classColetaveis")
local classInimigos = require ("classInimigos")
local emitterParams = require( "emitter2" )


local scene = composer.newScene()


function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end

 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
 
    elseif ( phase == "did" ) then -- AQUI VAI O CÓDIGO DA MINHA FASE


        local camera = perspective.createView()
        camera:prependLayer()


        physics.start( )
        physics.setGravity( 0, 15 )
        --physics.setDrawMode( "hybrid" )





        local centroY = 300
        local centroX = 400



        local fundo1 = display.newImageRect( "img/1.png", 9600/2.4, 1350/2.4 )
        local fundo12 = display.newImageRect( "img/1.png", 9600/2.4, 1350/2.4 )
        local fundo13 = display.newImageRect( "img/1.png", 9600/2.4, 1350/2.4 )
        camera:add (fundo1, 1)
        fundo1.x = 1600
        fundo1.y = centroY - 100 
        camera:add (fundo12, 1)
        fundo12.x = 5600
        fundo12.y = centroY - 100 
        camera:add (fundo13, 1)
        fundo13.x = 9600
        fundo13.y = centroY - 100 
        local fundo2 = display.newImageRect( "img/2.png", 13000/1.4, 1350/1.4 )
        local fundo22 = display.newImageRect( "img/2.png", 13000/1.4, 1350/1.4 )
        camera:add (fundo2, 3)
        fundo2.x = centroX - 3100
        fundo2.y = centroY - 400
        camera:add (fundo22, 3)
        fundo22.x = centroX + 6150
        fundo22.y = centroY - 400
        local fundo3 = display.newImageRect( "img/3.png", 13000/1.6, 1350/1.6 )
        local fundo32 = display.newImageRect( "img/3.png", 13000/1.6, 1350/1.6 )
        camera:add (fundo3, 5)
        fundo3.x = centroX - 3100
        fundo3.y = centroY - 270 
        camera:add (fundo32, 5)
        fundo32.x = centroX + 5000
        fundo32.y = centroY - 270 
        local fundo4 = display.newImageRect( "img/4.png", 5000, 600 )
        camera:add (fundo4, 8)
        fundo4.x = centroX 
        fundo4.y = centroY 
        local fundo5 = display.newImageRect( "img/5.png", 12500, 800 )
        camera:add (fundo5, 1)
        fundo5.x = centroX + 3000
        fundo5.y = centroY - 700
        local fundo51 = display.newImageRect( "img/5.png", 12500, 800 )
        camera:add (fundo51, 1)
        fundo51.x = centroX + 3000
        fundo51.y = centroY + 500
        

        local grupoHUD = classHUD.novo( centroX , 60)


      

       
       
        local limiteMapa = display.newRect(-4300, 300, 20, 500)
        physics.addBody( limiteMapa, "kinematic" )
        camera:add (limiteMapa, 1)
        limiteMapa.alpha = 0



---------------------------------------mapa e plataformas----------------------------------------------------

        -- solicita acesso as funcoes do script ponytiled (script para criar o tilemap)
    local tiled = require ( "com.ponywolf.ponytiled" )


    local json = require ( "json" )

    display.setDefault("magTextureFilter", "nearest")
    display.setDefault("minTextureFilter", "nearest")


    -- transforma as informacoes que estao no em formato JSON e passa para o formato LUA 
    local informacaoDoMapa = json.decodeFile(system.pathForFile("exemplo.json" ))  -- arquivo exportado do TILED


    --funcao do ponytiled que recebe uma informacao do mapa em LUA 
    local mapa = tiled.new(informacaoDoMapa)
    camera:add (mapa, 1)
    local start = mapa:findObject ("start")


-----------mapa e plataformas-----------------

    local moverMapa = require ( "com.ponywolf.plugins.dragable" )
    mapa = moverMapa.new(mapa)



    local function criaPlataforma ( xInicial, yInicial, xFinal, yFinal, tempo, atraso )


        local plataforma = display.newImageRect( "plataforma.png", 240, 200 )
        plataforma.id = "floor"
        physics.addBody( plataforma, "static", {box = {y= -5, x=0, halfWidth = 65, halfHeight = 24, angle = 0}, friction = 3} )
        plataforma.x = xInicial
        plataforma.y = yInicial
        camera:add (plataforma, 1)

        local function movePlataforma (  )

        transition.to( plataforma, { x = xFinal, y= yFinal, time = tempo, delay = atraso, onComplete = function ()
        transition.to( plataforma, { x= xInicial, y = yInicial, time = tempo, delay = atraso, onComplete = movePlataforma } )
        end } )
        
        end
        movePlataforma()
      
    end
    criaPlataforma (1152, 448, 1520, 448, 2000, 0 )
    criaPlataforma (3024, 480, 3024, 368, 2000, 0 )

    criaPlataforma (7856, 624, 7856, 368, 2000, 0 )
    criaPlataforma (8192, 368, 8192, 624, 2000, 0 )
    criaPlataforma (8496, 624, 8496, 368, 2000, 0 )


---------------------------------player--------------------------------------

    local player = classePlayer.novo( start.x, start.y, grupoHUD, classColetaveis, classInimigos )
    player.xScale = 1
    player.yScale = 1
    physics.addBody(player, "dynamic", {radius = 22, friction = 3})
    player.isFixedRotation = true 
    camera:add (player, 1)

----------------------------------------------------------------------------
---------------------------JUDAIZERA PRODUCTIONS----------------------------
local parametrosAudioBG = 
    {
        loops = -1, 
        fadein = 0,
        duration = 116000,
        -- onComplete = reproduzirAoCompletar
    }


local arquivoAudioBG = audio.loadStream( "backScene.mp3" )

local canalAudioBG = audio.play( arquivoAudioBG, parametrosAudioBG )

--------------------------------------------------------------------------
--------------------------------------------------------------------------
-----------------------------------coletaveis-----------------------------

        local emitter = display.newEmitter( emitterParams )
        camera:add(emitter, 1)
        emitter.x = 2192
        emitter.y = 285
        emitter.sourcePositionVariancex = 0
        emitter.sourcePositionVariancey = 0
        emitter.angle = -90

        local emitter2 = display.newEmitter( emitterParams )
        camera:add(emitter2, 1)
        emitter2.x = 4016
        emitter2.y = 320
        emitter2.sourcePositionVariancex = 0
        emitter2.sourcePositionVariancey = 0
        emitter2.angle = -90

        local emitter3 = display.newEmitter( emitterParams )
        camera:add(emitter3, 1)
        emitter3.x = 5760
        emitter3.y = 672
        emitter3.sourcePositionVariancex = 0
        emitter3.sourcePositionVariancey = 0
        emitter3.angle = -90

        local emitter4 = display.newEmitter( emitterParams )
        camera:add(emitter4, 1)
        emitter4.x = 6672
        emitter4.y = 528
        emitter4.sourcePositionVariancex = 0
        emitter4.sourcePositionVariancey = 0
        emitter4.angle = -90
        
        local emitter5 = display.newEmitter( emitterParams )
        camera:add(emitter5, 1)
        emitter5.x = 8224
        emitter5.y = 256
        emitter5.sourcePositionVariancex = 0
        emitter5.sourcePositionVariancey = 0
        emitter5.angle = -90


        local relogio1 = classColetaveis.novo ()
        camera:add (relogio1, 1)
        local relogio2 = classColetaveis.novo2 ()
        camera:add (relogio2, 1)
        local relogio3 = classColetaveis.novo3 ()
        camera:add (relogio3, 1)
        local relogio4 = classColetaveis.novo4 ()
        camera:add (relogio4, 1)
        local relogio5 = classColetaveis.novo5 ()
        camera:add (relogio5, 1)


        

----------------------------inimigos----------------------------------




    local slime = classInimigos.slime ()
    camera:add (slime, 1)


    local mago = classInimigos.mago ( )
    camera:add (mago, 1)

    local function inimigoAtirando (  )

        local balaSpriteSheet = graphics.newImageSheet( "estrela.png",

                                { width = 64, height = 64, numFrames = 60})

        local balaAnimation = 
            {
                { name = "run", start =1, count = 30 , time = 500, loopCount = 0   }                
            }
        local bala = display.newSprite( balaSpriteSheet, balaAnimation )
        camera:add (bala, 1)
        bala:setSequence("run")
        bala:play()
        bala.id = "bala"
        physics.addBody( bala, "static", {box = {y= 0, x=0, halfWidth = 20, halfHeight = 20, angle = 0}} )
            bala.x = mago.x
            bala.y = mago.y


             if ( player.x >= 6384 and player.x <= 7152) then
                    
                 transition.to( bala, { y= player.y, x= player.x, time = 1500, onComplete = function ()
                     display.remove( bala )      
                 end} )

             end           
    end
    timer.performWithDelay( 1500, inimigoAtirando, 0)

    local maguinhoSpriteSheet = graphics.newImageSheet( "maguinnegro.png",
                                { width = 128, height = 128, numFrames = 2})

    local maguinhoAnimation = 
            {
                { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
            }

    local maguinho = display.newSprite( maguinhoSpriteSheet, maguinhoAnimation )
    physics.addBody( maguinho, "static" )
    maguinho.id = "maguinho"
    maguinho.x = 9376
    maguinho.y = 315
    maguinho.xScale = -3
    maguinho.yScale = 3
    maguinho:setSequence("run")
    maguinho:play()
    camera:add (maguinho, 1)

    function fim(  )
        timer.cancelAll( )
        display.remove( grupoHUD )
        display.remove( player )
        camera:destroy ()
        audio.pause(canalAudioBG)

        composer.gotoScene("FinalScene2")
    end


    function gameOver(  )
        audio.pause( canalAudioBG )
        timer.cancelAll( )
        display.remove( grupoHUD )    
        camera:destroy ()
        Runtime:removeEventListener ("key", player.verificaTecla )
        Runtime:removeEventListener("enterFrame", player.movimento)
        composer.gotoScene("cenaGameOver")
    end



           -- Não há necessidade de alterar
    --      camadas     1   2    3    4    5    6    7   8
    camera:setParallax( 1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.1, 0 ) -- Aqui alteramos o "Parallax" na ordem decrescente para cada layer

    camera.damping = 10 -- Controla a fluidez da camera ao seguir o player
    camera:setFocus( player ) -- Troca o foco para o player
    camera:track() -- Inicia a perseguição da camer
    camera:setMasterOffset (0, 110)
        
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