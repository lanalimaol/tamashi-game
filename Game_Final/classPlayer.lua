local classPlayer = {}

function classPlayer.novo( x, y, grupoHUD, classColetaveis, classInimigos )



		print( "Player colocado na tela!" )

	local playerSpriteSheet = graphics.newImageSheet( "tamashifita13.png",
								{ width = 192, height = 192, numFrames = 12})

	local playerAnimation = 
			{
				{ name = "run", start = 5,count =4 , time = 400, loopCount = 0   },
				{ name = "idle", frames = {3} , time = 400, loopCount = 0},
				{ name = "idle2", frames = {7} , time = 400, loopCount = 0   }					
			}



local player = display.newSprite( playerSpriteSheet, playerAnimation )

player.x = 2000
player.y = y
player:setSequence("idle")
player:play()




player.contaPulo = 0


player.verificaTecla = function ( event )

print ("alow")
	 	if (event.phase == "down") then
		 	
		 	if (event.keyName == "left" ) then
		 		direcao = "esquerda"
		 		player.xScale = -1 
		 		player:setSequence("run")
				player:play()
		 		
		 	elseif (event.keyName == "right" ) then
		 		direcao = "direita"
		 		player.xScale = 1
		 		player:setSequence("run")
				player:play()
			end

		 	if (event.keyName == "space" and player.contaPulo <=1 ) then
		 		player:setSequence("idle2")
				player:play()
				player.contaPulo = player.contaPulo + 1
	 			player:setLinearVelocity( 0, -200)

		 	end

		 	--momento que solta a tecla 
		elseif (event.phase == "up") then
			
			if (event.keyName == "left" ) then
				direcao = ""
				player:setSequence("idle")
				player:play()
			elseif (event.keyName == "right" ) then
				direcao = ""
				player:setSequence("idle")
				player:play()
			elseif (event.keyName == "space" ) then
		 		

			end
		end
	 end
	 Runtime:addEventListener ("key", player.verificaTecla )




	 player.movimento = function ( event )
	 	if (direcao == "esquerda") then
	 		player.x = player.x - 2.7
	 	elseif (direcao == "direita") then
	 		player.x = player.x + 2.7
	 	end
	 end
	 Runtime:addEventListener("enterFrame", player.movimento)

----------------------------------------------------------------
---------------------JUDAIZERA PRODUCTIONS----------------------

local parametrosAudioCL = 
	{
		loops = 0, 
		fadein = 2500,
		channel = 1,
		duration = 25000,
		onComplete = reproduzirAoCompletar
	}
----------------------------------------------------------------
----------------------------------------------------------------

local arquivoAudioCL = audio.loadStream( "collect.mp3" )


	  local function colisao ( self, event )
    	if (event.phase == "began") then 
    		if (event.other.id == "relogio") then 
    			display.remove( event.other )
    			grupoHUD.ganharTempo()
    			audio.play( arquivoAudioCL )
    		elseif (event.other.name == "floor") then 
    			player.contaPulo = 0
    		elseif (event.other.name == "buraco1") then 
    			timer.performWithDelay( 10, function ( )
    				player.x = 992
    				player.y = 416
    			end, 1 )
    		elseif (event.other.name == "buraco2") then 
    			timer.performWithDelay( 10, function ( )
    				player.x = 4432
    				player.y = 464
    			end, 1 )
    		elseif (event.other.name == "buraco3") then 
    			timer.performWithDelay( 10, function ( )
    				player.x = 7520
    				player.y = 512
    			end, 1 )
    		elseif (event.other.id == "floor") then 
    			player.contaPulo = 0
    		elseif (event.other.id == "inimigo") then 
    			timer.performWithDelay( 10, function ( )
    				player.x = 3184
    				player.y = 320
    			end, 1 )
    		elseif (event.other.id == "bala") then 
    			timer.performWithDelay( 10, function ( )
    				player.x = 6256
    				player.y = 448
    			end, 1 )
    		elseif (event.other.id == "maguinho") then 
    			Runtime:removeEventListener ("key", player.verificaTecla )
    			Runtime:removeEventListener("enterFrame", player.movimento)
    			fim()
    		end
    	end
    	
    end
    --coloca a funcao de colisao dentro de uma variavel para que possa ser usado o ------self-------
    player.collision = colisao 
    player:addEventListener( "collision" )







return player
 -- retorno do objeto criado no momento pela funcao
end 

-- function classPlayer.novoSecreto()
-- 	print( "Player Secreto colocado na tela!" )

-- end


return classPlayer -- Retorna todas as funcões da classe para usar no jogos