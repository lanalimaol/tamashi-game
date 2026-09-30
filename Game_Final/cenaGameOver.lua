local composer = require( "composer" )
local emitterParams = require( "emitter3" )
 
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

         
        local emitter = display.newEmitter( emitterParams )
        emitter.x = 100
        emitter.y = 300
        local texto = display.newText( "GAME OVER" , 400, 280, "PressStart2P.ttf", 45 )


        local texto1 = display.newText( "Retornar ao menu" , 400, 420, "PressStart2P.ttf", 20 )

        function retornarMenu (event )
            if (event.phase == "began") then 

                display.remove( texto )
                display.remove( texto1 )
                display.remove  (emitter)
                composer.gotoScene("menu")

            end

        end
        texto1:addEventListener( "touch", retornarMenu )


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