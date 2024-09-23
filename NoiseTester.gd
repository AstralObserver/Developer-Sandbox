extends Node


# Called when the node enters the scene tree for the first time.
@onready var noise: FastNoiseLite = $SeamlessNoiseTexture.texture.noise

var x = 100
var y = 100
var values = []

func _ready() -> void:
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	
	var totalVal = 0
	for n in x:
		for m in y:
			var val = ((1 + noise.get_noise_2d(n,m))/2)
			values.append(val)
			totalVal += val
			
	print("Count: ",values.size())
	print("Max: ",values.max())
	print("Min: ",values.min())
	print("Mean: ",(totalVal/values.size()))
