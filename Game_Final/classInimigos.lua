local classInimigos = {}

function classInimigos.slime ( )

	local inimigoSpriteSheet = graphics.newImageSheet( "slime.png",

								{ width = 384, height = 384, numFrames = 8})

	local inimigoAnimation = 
			{
				{ name = "run", start = 1,count = 8 , time = 700, loopCount = 0   }				
			}



	local inimigo = display.newSprite( inimigoSpriteSheet, inimigoAnimation )

	inimigo.x = 3504
	inimigo.y = 490
	inimigo.id = "inimigo"
	inimigo:setSequence("run")
	inimigo:play()
    physics.addBody( inimigo, "static", {box = {x = 0, y = 0, halfWidth = 20, halfHeight = 20, angle = 0}} )

	local function criaInimigo ( xInicial, yInicial, xFinal, yFinal, tempo, atraso )

        local function moveInimigo (  )

        transition.to( inimigo, { x = xFinal, y= yFinal, time = tempo, delay = atraso, onComplete = function ()
        inimigo.xScale = -1
        transition.to( inimigo, { x= xInicial, y = yInicial, time = tempo, delay = atraso, onComplete = moveInimigo } )
        end } )
        inimigo.xScale = 1
        
        end
        moveInimigo() 
    end
    criaInimigo (3504, 490, 4368, 490, 5000, 0 )

    return inimigo 

end



function classInimigos.mago ( classePlayer )


	local inimigoSpriteSheet = graphics.newImageSheet( "mago.png",

								{ width = 80, height = 80, numFrames = 10})

	local inimigoAnimation = 
			{
				{ name = "run", frames = {6, 7, 8, 9, 10} , time = 500, loopCount = 0   }				
			}



	local inimigo = display.newSprite( inimigoSpriteSheet, inimigoAnimation )

	inimigo.x = 6736
	inimigo.y = 135
	inimigo:scale( 2, 2 )
	inimigo.id = "inimigo"
	inimigo:setSequence("run")
	inimigo:play()
    physics.addBody( inimigo, "static" )

    

    return inimigo
end


return classInimigos