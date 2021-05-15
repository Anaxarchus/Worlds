extends Node


var land_noise:NoiseTexture = preload("res://Noise/LandNoiseTexture.tres")
var ocean_noise:NoiseTexture = preload("res://Noise/OceanNoiseTexture.tres")
var mask_noise:NoiseTexture = preload("res://Noise/LandMaskNoiseTexture.tres")

var land_gradient:GradientTexture = preload("res://Gradients/LandGradientTexture.tres")
var ocean_gradient:GradientTexture = preload("res://Gradients/OceanGradientTexture.tres")
var mask_gradient:GradientTexture = preload("res://Gradients/LandBaseGradientTexture.tres")

var mask_seed:int setget set_mask_seed, get_mask_seed
var mask_octaves:int setget set_mask_octaves, get_mask_octaves
var mask_persistence:float setget set_mask_persistence,get_mask_persistence
var mask_period:float setget set_mask_period,get_mask_period
var mask_lacunarity:float setget set_mask_lacunarity,get_mask_lacunarity
var mask_resolution:Vector2 setget set_mask_resolution,get_mask_resolution

var ocean_seed:int setget set_ocean_seed,get_ocean_seed
var ocean_octaves:int setget set_ocean_octaves,get_ocean_octaves
var ocean_persistence:float setget set_ocean_persistence,get_ocean_persistence
var ocean_period:float setget set_ocean_period,get_ocean_period
var ocean_lacunarity:float setget set_ocean_lacunarity,get_ocean_lacunarity
var ocean_resolution:Vector2 setget set_ocean_resolution,get_ocean_resolution

var land_seed:int setget set_land_seed,get_land_seed
var land_octaves:int setget set_land_octaves,get_land_octaves
var land_persistence:float setget set_land_persistence,get_land_persistence
var land_period:float setget set_land_period,get_land_period
var land_lacunarity:float setget set_land_lacunarity,get_land_lacunarity
var land_resolution:Vector2 setget set_land_resolution, get_land_resolution


# Mask setters and getters

func set_mask_seed(value:int):
    mask_noise.noise.seed = value

func get_mask_seed():
    return mask_noise.noise.seed


func set_mask_persistence(value:float):
    mask_noise.noise.persistence = value

func get_mask_persistence():
    return mask_noise.noise.persistence


func set_mask_period(value:float):
    mask_noise.noise.period = value

func get_mask_period():
    return mask_noise.noise.period


func set_mask_lacunarity(value:float):
    mask_noise.noise.lacunarity = value

func get_mask_lacunarity():
    return mask_noise.noise.lacunarity


func set_mask_octaves(value:int):
    mask_noise.noise.octaves = value

func get_mask_octaves():
    return mask_noise.noise.octaves


func set_mask_resolution(value:Vector2):
    mask_noise.height = value.y
    mask_noise.width = value.x

func get_mask_resolution():
    return Vector2(mask_noise.width,mask_noise.height)

# End mask setters and getters


# Ocean setters and getters

    # Ocean Noise
    
func set_ocean_seed(value:int):
    ocean_noise.noise.seed = value

func get_ocean_seed():
    return ocean_noise.noise.seed


func set_ocean_persistence(value:float):
    ocean_noise.noise.persistence = value

func get_ocean_persistence():
    return ocean_noise.noise.persistence


func set_ocean_period(value:float):
    ocean_noise.noise.period = value

func get_ocean_period():
    return ocean_noise.noise.period


func set_ocean_lacunarity(value:float):
    ocean_noise.noise.lacunarity = value

func get_ocean_lacunarity():
    return ocean_noise.noise.lacunarity


func set_ocean_octaves(value:int):
    ocean_noise.noise.octaves = value

func get_ocean_octaves():
    return ocean_noise.noise.octaves


func set_ocean_resolution(value:Vector2):
    ocean_noise.width = value.x
    ocean_noise.height = value.y

func get_ocean_resolution():
    return Vector2(ocean_noise.width,ocean_noise.height)

    # End Ocean Noise
    
    # Ocean Color

func set_deep_ocean_color(value:Color):
    ocean_gradient.gradient.set_color(2,value)

func get_deep_ocean_color():
    return ocean_gradient.gradient.get_color(2)


func set_ocean_color(value:Color):
    ocean_gradient.gradient.set_color(3,value)

func get_ocean_color():
    return ocean_gradient.gradient.get_color(3)


func set_shallow_ocean_color(value:Color):
    ocean_gradient.gradient.set_color(4,value)

func get_shallow_ocean_color():
    return ocean_gradient.gradient.get_color(4)


func set_reef_ocean_color(value:Color):
    ocean_gradient.gradient.set_color(5,value)

func get_reef_ocean_color():
    return ocean_gradient.gradient.get_color(5)


func set_coastal_ocean_color(value:Color):
    ocean_gradient.gradient.set_color(6,value)

func get_coastal_ocean_color():
    return ocean_gradient.gradient.get_color(6)


func get_ocean_biome_count():
    var still_counting:bool = true
    var biome_count:int = 1
    while still_counting:
        if ocean_gradient.gradient.get_color(biome_count):
            biome_count += 1
        else:
            return biome_count


func get_ocean_biome(value:int):
    return ocean_gradient.gradient.get_color(value)


func set_ocean_biome(index:int, value:Color):
    ocean_gradient.gradient.set_color(index, value)

    # End Ocean Color

# End ocean setters and getters


# Land setters and getters

    # Land Noise

func set_land_seed(value:int):
    land_noise.noise.seed = value

func get_land_seed():
    return land_noise.noise.seed


func set_land_persistence(value:float):
    land_noise.noise.persistence = value

func get_land_persistence():
    return land_noise.noise.persistence


func set_land_period(value:float):
    land_noise.noise.period = value

func get_land_period():
    return land_noise.noise.period


func set_land_lacunarity(value:float):
    land_noise.noise.lacunarity = value

func get_land_lacunarity():
    return land_noise.noise.lacunarity


func set_land_octaves(value:int):
    land_noise.noise.octaves = value

func get_land_octaves():
    return land_noise.noise.octaves


func set_land_resolution(value:Vector2):
    land_noise.width = value.x
    land_noise.height = value.y

func get_land_resolution():
    return Vector2(land_noise.width,land_noise.height)

    # End Land Noise


    # Land Color


func get_land_biome_count():
    var still_counting:bool = true
    var biome_count:int = 1
    while still_counting:
        if land_gradient.gradient.get_color(biome_count):
            biome_count += 1
        else:
            return biome_count


func get_land_biome(value:int):
    return land_gradient.gradient.get_color(value)


func set_land_biome(index:int, value:Color):
    land_gradient.gradient.set_color(index, value)

# End land setters and getters
    
    
