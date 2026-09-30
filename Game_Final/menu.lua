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



        grupoFundo = display.newGroup()
        grupoFrente = display.newGroup()

        -- Load module containing table of emitter params
local emitterParams = require( "emitter" )

-- Create and position emitter object
local emitter = display.newEmitter( emitterParams )
emitter.x = display.contentCenterX
emitter.y = display.contentCenterY - 50







local parametrosAudioBG = 
    {

        loops = 1,-- -1 é inifinito 
        fadein = 0,
        channel = 1, -- canal por onde o audio vai passar, neste caso, esse audio de BG estará sempre no canal 1
        duration = 145000, 
        onComplete = reproduzirAoCompletar
    


    }

    local arquivoAudioBG =  audio.loadStream("reprise2.mp3")-- para musicas grandes

    local canalAudioBG = audio.play(arquivoAudioBG , parametrosAudioBG) -- toca o arquivo de audio com os parametros definidos 







         

        local fundo4 = display.newImageRect( "img/4.png", 13000/1.9, 1350/1.9 )
        sceneGroup:insert(fundo4)
        fundo4.x = 160
        fundo4.y =  380  
       
        local fundo2 = display.newImageRect( "img/2.png", 13000/1.9, 1350/1.9 )
        sceneGroup:insert(fundo2)
        fundo2.x = 160
        fundo2.y =  380  
        
        local fundo1 = display.newImageRect( "img/1.png", 9600/3.4, 1350/3.4 )
        sceneGroup:insert(fundo1)
        fundo1.x =  120
        fundo1.y =  200
        
        local fundo5 = display.newImageRect( "img/5.png", 13000/1.9, 1350/1.9 )   
        sceneGroup:insert(fundo5)
        fundo5.x =  160 
        fundo5.y =  900
        
        
   

         local tituloGame = display.newImageRect( "jknt.png", 128*4, 128*2)
         tituloGame.x = 410
         tituloGame.y = 80
         -- tituloGame:setFillColor(0, 0 , 1)
         sceneGroup:insert(tituloGame)

         local startSprite = graphics.newImageSheet( "start.png",
                                { width = 128, height = 128, numFrames = 2})

local startAnimation = 
        {
            { name = "runStart", start = 1,count =2 , time = 400, loopCount = 0   },
   


        
            

        }



local startAnm = display.newSprite( startSprite, startAnimation )
  sceneGroup:insert(startAnm)

startAnm.x = 400
startAnm.y = 120

startAnm.xScale = 1.5
startAnm.yScale = 1.5
startAnm:setSequence("runStart")
startAnm:play()



      





         local playerSpriteSheet = graphics.newImageSheet( "tamashi4.png",
                                { width = 192, height = 192, numFrames = 8})

local playerAnimation = 
        {
            { name = "run", start = 1,count =2 , time = 400, loopCount = 0   },
            { name = "idle", start =3 , time = 400, loopCount = 0},
            { name = "idle2", start =7 , time = 400, loopCount = 0   }


        
            

        }

local player2 = display.newSprite( playerSpriteSheet, playerAnimation )
player2.x = 200
player2.y = 350
player2.xScale = 2
player2.yScale = 2
player2:setSequence("run")
player2:play()



        -- physics.addBody(startGame , "static", { box = startGamePhy })
    


         local function iniciarGame(event)

            if (event.phase == "began") then 

                print("entrou na fase1")
                local square = display.newRect( 160, 240, 4000,4000 )
                square:setFillColor(0)
                transition.fadeOut( square, { time=4000 } )
                audio.pause(canalAudioBG)
                -- audio.play(arquivoAudioMoeda)
                 startAnm.xScale = 1.4
                 startAnm.yScale = 1.4

            elseif (event.phase == "ended") then 
                 startAnm.xScale = 1.5
                
                 composer.gotoScene("sceneHistory")
                 display.remove(player2)
                 display.remove(emitter)
                 audio.pause(canalAudioBG)
                 



             -- body
             end 
         end
         startAnm:addEventListener("touch" , iniciarGame)




         




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