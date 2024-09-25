extends Node


# Called when the node enters the scene tree for the first time.
@onready var noise: FastNoiseLite = $"Borders/GUI Box/Control_Vis Split/Visualizer Creation/NoiseViewer/MarginContainer/SeamlessNoiseTexture".texture.noise

@onready var noise_type_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CoreVariablesBlock/CoreVariables/Option/NoiseTypeSelector"
@onready var fractal_type_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/FractalVariables/CoreVariables/Option2/FractalTypeSelector"
@onready var return_type_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CellularDistanceVariables/CoreVariables/HBoxContainer/Option4/CellularReturnTypeSelector"
@onready var cellular_distance_function_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CellularDistanceVariables/CoreVariables/HBoxContainer/Option3/CellularDistanceFunctionSelector"
@onready var domain_warp_type_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/DomainWarpVariables/DomainWarpVariables/HBoxContainer/Option5/DomainWarpTypeSelector"
@onready var domain_warp_fractal_type_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/DomainWarpVariables/DomainWarpVariables/HBoxContainer/Option6/DomainFractalType/EnumSelector"

@onready var seed_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CoreVariablesBlock/CoreVariables/ControlVariables/Option7/SeedInput"
@onready var frequency_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CoreVariablesBlock/CoreVariables/ControlVariables/Option8/FrequencyInput"
@onready var offset1_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CoreVariablesBlock/CoreVariables/ControlVariables/Option9/HBoxContainer/OffsetInput1"
@onready var offset2_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CoreVariablesBlock/CoreVariables/ControlVariables/Option9/HBoxContainer/OffsetInput2"
@onready var offset3_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CoreVariablesBlock/CoreVariables/ControlVariables/Option9/HBoxContainer/OffsetInput3"
@onready var fractal_gain_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/FractalVariables/CoreVariables/ControlVariables/Option7/GainInput"
@onready var fractal_lacunarity_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/FractalVariables/CoreVariables/ControlVariables/Option8/LacunarityInput"
@onready var fractal_octaves_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/FractalVariables/CoreVariables/ControlVariables/Option9/OctavesInput" 
@onready var fractal_ping_pong_strength_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/FractalVariables/CoreVariables/ControlVariables/Option10/PingPongStrengthInput"
@onready var fractal_weighted_strength_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/FractalVariables/CoreVariables/ControlVariables/Option11/WeightedStrengthInput"
@onready var cellular_jitter_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/CellularDistanceVariables/CoreVariables/ControlVariables/Option11/CellularJitterInput"
@onready var domain_warp_frequency_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/DomainWarpVariables/DomainWarpVariables/ControlVariables/Option11/DomainWarpFrequencyInput"
@onready var domain_warp_fractal_gain_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/DomainWarpVariables/DomainWarpVariables/ControlVariables/Option8/DomainFractalGainInput"
@onready var domain_warp_fractal_lacunarity_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/DomainWarpVariables/DomainWarpVariables/ControlVariables/Option9/DomainFractalLacunarityInput"
@onready var domain_warp_fractal_octaves_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/DomainWarpVariables/DomainWarpVariables/ControlVariables/Option10/DomainFractalOctaveInput"
@onready var domain_warp_amplitude_loc = $"Borders/GUI Box/Control_Vis Split/Buttons/DomainWarpVariables/DomainWarpVariables/ControlVariables/Option7/AmplitudeInput"
@onready var warp_enabled = false

@onready var locations = {
	noise_type_loc:null,fractal_type_loc:null,return_type_loc:null,cellular_distance_function_loc:null,
	domain_warp_type_loc:null,domain_warp_fractal_type_loc:null,seed_loc:returnType.INT,frequency_loc:returnType.FLOAT,
	offset1_loc:returnType.FLOAT,offset2_loc:returnType.FLOAT,offset3_loc:returnType.FLOAT,fractal_gain_loc:returnType.FLOAT,fractal_lacunarity_loc:returnType.FLOAT,
	fractal_octaves_loc:returnType.INT,fractal_ping_pong_strength_loc:returnType.FLOAT,cellular_jitter_loc:returnType.FLOAT,domain_warp_frequency_loc:returnType.FLOAT,
	domain_warp_fractal_gain_loc:returnType.FLOAT,domain_warp_fractal_lacunarity_loc:returnType.FLOAT,domain_warp_fractal_octaves_loc:returnType.INT,domain_warp_amplitude_loc:returnType.FLOAT}

@onready var vals = [
	noise.noise_type,noise.fractal_type,noise.cellular_return_type,noise.cellular_distance_function,
	noise.domain_warp_type,noise.domain_warp_fractal_type,noise.seed,noise.fractal_octaves,
	noise.domain_warp_fractal_octaves,noise.frequency,noise.offset,noise.fractal_gain,
	noise.fractal_lacunarity,noise.fractal_ping_pong_strength,noise.fractal_weighted_strength,noise.cellular_jitter,
	noise.domain_warp_frequency,noise.domain_warp_fractal_gain,noise.domain_warp_fractal_lacunarity,noise.domain_warp_amplitude]

enum returnType {INT,FLOAT}

func _ready() -> void:
	_refresh_noise()

func _refresh_noise():
	noise.noise_type = _parse_noise_type(_prefill_input_if_empty(noise_type_loc,null))
	noise.fractal_type = _parse_fractal_type(_prefill_input_if_empty(fractal_type_loc,null))
	noise.cellular_return_type = _parse_return_type(_prefill_input_if_empty(return_type_loc,null))
	noise.cellular_distance_function = _parse_distance_function(_prefill_input_if_empty(cellular_distance_function_loc,null))
	noise.domain_warp_type = _parse_domain_warp_type(_prefill_input_if_empty(domain_warp_type_loc,null))
	noise.domain_warp_fractal_type = _parse_domain_warp_fractal_type(_prefill_input_if_empty(domain_warp_fractal_type_loc,null))

	noise.seed = _prefill_input_if_empty(seed_loc,returnType.INT)
	noise.fractal_octaves = _prefill_input_if_empty(fractal_octaves_loc,returnType.INT)
	noise.domain_warp_fractal_octaves = _prefill_input_if_empty(domain_warp_fractal_octaves_loc,returnType.INT)
	noise.frequency = _prefill_input_if_empty(frequency_loc,returnType.FLOAT)
	noise.offset = Vector3(_prefill_input_if_empty(offset1_loc,returnType.FLOAT),_prefill_input_if_empty(offset2_loc,returnType.FLOAT),_prefill_input_if_empty(offset3_loc,returnType.FLOAT))
	noise.fractal_gain = _prefill_input_if_empty(fractal_gain_loc,returnType.FLOAT)
	noise.fractal_lacunarity = _prefill_input_if_empty(fractal_lacunarity_loc,returnType.FLOAT)
	noise.fractal_ping_pong_strength = _prefill_input_if_empty(fractal_ping_pong_strength_loc,returnType.FLOAT)
	noise.fractal_weighted_strength = _prefill_input_if_empty(fractal_weighted_strength_loc,returnType.FLOAT)
	noise.cellular_jitter = _prefill_input_if_empty(cellular_jitter_loc,returnType.FLOAT)
	noise.domain_warp_frequency = _prefill_input_if_empty(domain_warp_frequency_loc,returnType.FLOAT)
	noise.domain_warp_fractal_gain = _prefill_input_if_empty(domain_warp_fractal_gain_loc,returnType.FLOAT)
	noise.domain_warp_fractal_lacunarity =  _prefill_input_if_empty(domain_warp_fractal_lacunarity_loc,returnType.FLOAT)
	noise.domain_warp_amplitude = _prefill_input_if_empty(domain_warp_amplitude_loc,returnType.FLOAT)
	noise.domain_warp_enabled = warp_enabled

	print("Refreshed: ", noise.frequency)
# - - - - - - - - - - - - - - - - - - - - - - - - 
# Helper Functions

func _prefill_input_if_empty(location,unit):
	if location.get_class() == "OptionButton":
		return int(location.selected)
	elif location.get_class() == "LineEdit":
		if unit == returnType.INT:
			return int(_prefill_text_if_empty(location))
		elif unit == returnType.FLOAT:
			return float(_prefill_text_if_empty(location))

func _prefill_text_if_empty(location):
	if location.text == "":
		return location.placeholder_text
	else:
		return location.text
		
# Warp Enabled Checker
func _warp_enabler(state:bool) -> void:
	warp_enabled = state

# Enum Parsers
func _parse_noise_type(type):
	match type:
		0: return FastNoiseLite.NoiseType.TYPE_SIMPLEX
		1: return FastNoiseLite.NoiseType.TYPE_SIMPLEX_SMOOTH
		2: return FastNoiseLite.NoiseType.TYPE_CELLULAR
		3: return FastNoiseLite.NoiseType.TYPE_PERLIN
		4: return FastNoiseLite.NoiseType.TYPE_VALUE_CUBIC
		5: return FastNoiseLite.NoiseType.TYPE_VALUE

func _parse_fractal_type(type):
	match type:
		0: return FastNoiseLite.FractalType.FRACTAL_NONE
		1: return FastNoiseLite.FractalType.FRACTAL_FBM
		2: return FastNoiseLite.FractalType.FRACTAL_RIDGED
		3: return FastNoiseLite.FractalType.FRACTAL_PING_PONG

func _parse_return_type(type):
	match type:
		0: return FastNoiseLite.CellularReturnType.RETURN_CELL_VALUE
		1: return FastNoiseLite.CellularReturnType.RETURN_DISTANCE
		2: return FastNoiseLite.CellularReturnType.RETURN_DISTANCE2
		3: return FastNoiseLite.CellularReturnType.RETURN_DISTANCE2_ADD
		4: return FastNoiseLite.CellularReturnType.RETURN_DISTANCE2_SUB
		5: return FastNoiseLite.CellularReturnType.RETURN_DISTANCE2_MUL
		6: return FastNoiseLite.CellularReturnType.RETURN_DISTANCE2_DIV

func _parse_distance_function(type):
	match type:
		0: return FastNoiseLite.CellularDistanceFunction.DISTANCE_EUCLIDEAN
		1: return FastNoiseLite.CellularDistanceFunction.DISTANCE_EUCLIDEAN_SQUARED
		2: return FastNoiseLite.CellularDistanceFunction.DISTANCE_MANHATTAN
		3: return FastNoiseLite.CellularDistanceFunction.DISTANCE_HYBRID

func _parse_domain_warp_type(type):
	match type:
		0: return FastNoiseLite.DomainWarpType.DOMAIN_WARP_SIMPLEX
		1: return FastNoiseLite.DomainWarpType.DOMAIN_WARP_SIMPLEX_REDUCED
		2: return FastNoiseLite.DomainWarpType.DOMAIN_WARP_BASIC_GRID

func _parse_domain_warp_fractal_type(type):
	match type:
		0: return FastNoiseLite.DomainWarpFractalType.DOMAIN_WARP_FRACTAL_NONE
		1: return FastNoiseLite.DomainWarpFractalType.DOMAIN_WARP_FRACTAL_PROGRESSIVE
		2: return FastNoiseLite.DomainWarpFractalType.DOMAIN_WARP_FRACTAL_PROGRESSIVE
