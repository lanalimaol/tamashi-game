local classColetaveis = {}






function classColetaveis.novo( )
	
       local relogio = display.newImageRect( "relogio.png", 32, 32 )
       relogio.x = 2192
       relogio.y = 288
       relogio.id = "relogio"
       physics.addBody( relogio, "kinematic", {isSensor = true} )

	return relogio
end

function classColetaveis.novo2( )
	
       local relogio = display.newImageRect( "relogio.png", 32, 32 )
       relogio.x = 4016
       relogio.y = 320
       relogio.id = "relogio"
       physics.addBody( relogio, "kinematic", {isSensor = true} )

	return relogio
end

function classColetaveis.novo3( )
	
       local relogio = display.newImageRect( "relogio.png", 32, 32 )
       relogio.x = 5760
       relogio.y = 672
       relogio.id = "relogio"
       physics.addBody( relogio, "kinematic", {isSensor = true} )

	return relogio
end

function classColetaveis.novo4( )
	
       local relogio = display.newImageRect( "relogio.png", 32, 32 )
       relogio.x = 6672
       relogio.y = 528
       relogio.id = "relogio"
       physics.addBody( relogio, "kinematic", {isSensor = true} )

	return relogio
end

function classColetaveis.novo5( )
	
       local relogio = display.newImageRect( "relogio.png", 32, 32 )
       relogio.x = 8224
       relogio.y = 256
       relogio.id = "relogio"
       physics.addBody( relogio, "kinematic", {isSensor = true} )

	return relogio
end




return classColetaveis