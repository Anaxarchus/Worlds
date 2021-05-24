extends Control

signal atmosphere_color_changed(color)
signal atmosphere_visibility_changed(value)
signal planet_type_changed(value)

var noise_interface = preload("res://GUI/CustomNodes/NoiseInterface/NoiseInterface.tscn")
var color_interface = preload("res://GUI/CustomNodes/ColorInterface/ColorInterface.tscn")

onready var node_generation = $TabContainer/Generation/ScrollContainer/VBoxContainer
onready var node_colors = $TabContainer/Colors/ScrollContainer/VBoxContainer
onready var node_options = $TabContainer/Options/ScrollContainer/VBoxContainer



# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func configure_for_earth_like():
    var cont_noise = noise_interface.instance()
    cont_noise.noise = load("res://Resources/PlanetTextures/Earth/Noise/LandMaskNoiseTexture.tres")
    node_generation.add_child(cont_noise)
    
    var land_noise = noise_interface.instance()
    land_noise.noise = load("res://Resources/PlanetTextures/Earth/Noise/LandNoiseTexture.tres")
    node_generation.add_child(land_noise)
    
    var ocean_noise = noise_interface.instance()
    ocean_noise.noise = load("res://Resources/PlanetTextures/Earth/Noise/OceanNoiseTexture.tres")
    node_generation.add_child(ocean_noise)
    
    var cloud_noise = noise_interface.instance()
    cloud_noise.noise = load("res://Resources/PlanetTextures/Earth/Noise/CloudNoiseTexture.tres")
    node_generation.add_child(cloud_noise)
    
    var land_color = color_interface.instance()
    land_color.color_map = load("res://Resources/PlanetTextures/Earth/Gradients/LandGradientTexture.tres")
    node_colors.add_child(land_color)
    
    var ocean_color = color_interface.instance()
    ocean_color.color_map = load("res://Resources/PlanetTextures/Earth/Gradients/OceanGradientTexture.tres")
    node_colors.add_child(ocean_color)


func configure_for_gas():
    pass


func configure_for_ice():
    pass


func configure_for_rock():
    pass


func clear_menus():
    for child in node_generation.get_children():
        child.queue_free()
    for child in node_colors.get_children():
        child.queue_free()
    


func _on_PlanetType_item_selected(index):
    emit_signal("planet_type_changed", index)
