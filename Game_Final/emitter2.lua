--
-- For more information on emitter properties, see the EmitterObject documentation at:
-- https://docs.coronalabs.com/api/type/EmitterObject/index.html
--

local emitterParams = {

	-- General emitter properties
	textureFileName = "qb.png",
	maxParticles = 25,
	angle = -90,
	angleVariance = 360,
	emitterType = 0,  -- Change to 1 for radial emitter type (see below)
	duration = -1,

	-- Point/line/field emitter properties
	speed = 200,
	speedVariance = 0,
	sourcePositionVariancex = 10,
	sourcePositionVariancey = 350,
	gravityx = 0,
	gravityy = 0,
	radialAcceleration = 0,
	radialAccelVariance = 0,
	tangentialAcceleration = 0,
	tangentialAccelVariance = 0,

	-- Radial emitter properties
	maxRadius = 0,
	maxRadiusVariance = 72.00,
	minRadius = 0,
	minRadiusVariance = 0,
	rotatePerSecond = 0,
	rotatePerSecondVariance = 152.90,

	-- General particle properties
	particleLifespan = 0.8,
	particleLifespanVariance = 0.3,
	startParticleSize = 10,
	startParticleSizeVariance = 2,
	finishParticleSize = 1,
	finishParticleSizeVariance = 5,
	rotationStart = 0,
	rotationStartVariance = 0,
	rotationEnd = 0,
	rotationEndVariance = 0,
	
	-- Color/alpha particle properties
	startColorRed = 1,
	startColorGreen = 1,
	startColorBlue = 0,
	startColorAlpha = 0.7,
	startColorVarianceRed = 0,
	startColorVarianceGreen = 0.5,
	startColorVarianceBlue = 0,
	startColorVarianceAlpha = 0.5,
	finishColorRed = 0,
	finishColorGreen = 0.2,
	finishColorBlue = 0.2,
	finishColorAlpha = 0.2,
	finishColorVarianceRed = 0,
	finishColorVarianceGreen = 0,
	finishColorVarianceBlue = 0,
	finishColorVarianceAlpha = 0,
	
	-- Blend mode properties
	blendFuncSource = 770,
	blendFuncDestination = 1
}

return emitterParams
