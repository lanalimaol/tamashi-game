local classHUD = {}






function classHUD.novo( x, y )
	
	local grupoHud = display.newGroup()
	grupoHud.x = x
	grupoHud.y = y

	local tempo = 30
	local tempoTexto = display.newText( "Tempo: " .. tempo .. "s", 0, 0, "PressStart2P.ttf", 16 )
	grupoHud:insert( tempoTexto )




	-- local contadorTempo = 
	-- local contadorTempoTexto = display.newText( "Tempo: " .. contadorTempo, -160, 20, nil, 16 )
	-- grupoHud:insert( contadorColetaveisTexto )

	local function diminuirTempo()
		tempo = tempo -1
		tempoTexto.text = "Tempo: " .. tempo .. "s"
		if (tempo <= 0 ) then 
			tempo = 0
			tempoTexto.text = "Tempo: " .. tempo .. "s"

			gameOver(  )
			
		end 
	end

	timer.performWithDelay( 1000, function ()
		diminuirTempo()
	end, 0, "temporizadorSomarDistancia" )

	-- grupoHud.somarColetavel = function ()
	-- 	contadorColetaveis = contadorColetaveis +1
	-- 	contadorColetaveisTexto.text = "Coletaveis: " .. contadorColetaveis
	-- end

	grupoHud.ganharTempo = function (  )
		tempo = tempo + 10
		tempoTexto.text = "Tempo: " .. tempo .. "s"
	end








	return grupoHud
end




return classHUD