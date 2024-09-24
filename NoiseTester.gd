extends Node


# Called when the node enters the scene tree for the first time.
@onready var noise: FastNoiseLite = $SeamlessNoiseTexture.texture.noise

var size = 512
var values = []

func _ready() -> void:
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	
	var totalVal = 0
	for x in size:
		for y in size:
			var val = ((1 + noise.get_noise_2d(x,y))/2)
			values.append(val)
			totalVal += val
			
func _refresh_noise():
	pass

# - - - - - - - - - - - - - - - - - - - - - - - - 
# Standard Settings

func _set_noiseType(typeEnum):
	noise.noise_type = typeEnum
	_refresh_noise()

func _set_frequency(typeEnum):
	pass
	
func _set_offset(typeEnum):
	pass
	
func _set_seed(typeEnum):
	pass
# - - - - - - - - - - - - - - - - - - - - - - - - 
# Fractal Returns

func _set_fractalType(typeEnum):
	pass

func _set_fractalGain(typeEnum):
	pass
	
func _set_fractalLacunarity(typeEnum):
	pass
	
func _set_fractalOctaves(typeEnum):
	pass

func _set_fractalPingPongStrength(typeEnum):
	pass
	
func _set_fractalWeightedStrength(typeEnum):
	pass
# - - - - - - - - - - - - - - - - - - - - - - - - 
# Cellular Returns
func _set_cellularReturnType(typeEnum):
	pass

func _set_cellularDistanceFunction(typeEnum):
	pass	

func _set_cellularJitter():
	pass

# - - - - - - - - - - - - - - - - - - - - - - - - 
# Domain Warp Variables
func _set_domain_warp_enabled(newBool):
	pass

func _set_domainWarpType(typeEnum):
	pass

func _set_domainWarpFractalType(typeEnum):
	pass
	
func _set_domainWarpAmplitude(newFloat):
	pass
	
func _set_domainWarpFractalGain(newFloat):
	pass

func _set_domainWarpFractalLacunarity(newFloat):
	pass

func _set_domainWarpOctaves(newInt):
	pass
	
func _set_domainWarpFrequency(newFloat):
	pass
