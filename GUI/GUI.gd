extends Control

signal atmosphere_color_changed(color)
signal atmosphere_visibility_changed(value)
signal planet_type_changed(value)
signal export_sprite(sprite_name, save_path)
signal cloud_visibility_changed(value)

export(NodePath) var node_atmosphere

var noise_interface = preload("res://GUI/CustomNodes/NoiseInterface/NoiseInterface.tscn")
var color_interface = preload("res://GUI/CustomNodes/ColorInterface/ColorInterface.tscn")

onready var node_generation = $TabContainer/Generation/ScrollContainer/VBoxContainer
onready var node_colors = $TabContainer/Colors/ScrollContainer/VBoxContainer
onready var node_options = $TabContainer/Options/ScrollContainer/VBoxContainer

var atmosphere_color_map:GradientTexture
var shader:VisualShader



# Called when the node enters the scene tree for the first time.
func _ready():
    $TabContainer/Options/ScrollContainer/VBoxContainer/AtmosphereSettings/BottomOut.value = Creator.atmosphere_day_outer
    $TabContainer/Options/ScrollContainer/VBoxContainer/AtmosphereSettings/BottomIn.value = Creator.atmosphere_day_inner
    $TabContainer/Options/ScrollContainer/VBoxContainer/AtmosphereSettings/TopOut.value = Creator.atmosphere_night_outer
    $TabContainer/Options/ScrollContainer/VBoxContainer/AtmosphereSettings/TopIn.value = Creator.atmosphere_night_inner
    $TabContainer/Options/ScrollContainer/VBoxContainer/AtmosphereSettings/Brightness.value = Creator.atmosphere_interior_brightness


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
    
    var cloud_color = color_interface.instance()
    cloud_color.color_map = load("res://Resources/PlanetTextures/Earth/Gradients/CloudGradientTexture.tres")
    cloud_color.skip_first = false
    node_colors.add_child(cloud_color)
    
    var land_color = color_interface.instance()
    land_color.color_map = load("res://Resources/PlanetTextures/Earth/Gradients/LandGradientTexture.tres")
    node_colors.add_child(land_color)
    
    var ocean_color = color_interface.instance()
    ocean_color.color_map = load("res://Resources/PlanetTextures/Earth/Gradients/OceanGradientTexture.tres")
    node_colors.add_child(ocean_color)
    ocean_color.connect("color_interface_color_changed", self, "_on_color_interface_color_changed")
    
    atmosphere_color_map = ocean_color.color_map
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))
    
    $TabContainer/Options/ScrollContainer/VBoxContainer/Clouds.disabled = false
    
    $TabContainer/Options/ScrollContainer/VBoxContainer/Atmosphere.pressed = true


func configure_for_gas():
    var gas_noise = noise_interface.instance()
    gas_noise.noise = load("res://Resources/PlanetTextures/Gaseous/Noise/GaseousNoiseTexture.tres")
    node_generation.add_child(gas_noise)
    
    var gas_color = color_interface.instance()
    gas_color.color_map = load("res://Resources/PlanetTextures/Gaseous/Gradients/GaseousGradientTexture.tres")
    node_colors.add_child(gas_color)
    gas_color.connect("color_interface_color_changed", self, "_on_color_interface_color_changed")
    
    atmosphere_color_map = gas_color.color_map
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))
    
    $TabContainer/Options/ScrollContainer/VBoxContainer/Atmosphere.pressed = true


func configure_for_ice():
    pass


func configure_for_rock():
    var rock_noise = noise_interface.instance()
    rock_noise.noise = load("res://Resources/PlanetTextures/Rocky/Noise/RockyNoiseTexture.tres")
    node_generation.add_child(rock_noise)
    
    var rock_color = color_interface.instance()
    rock_color.color_map = load("res://Resources/PlanetTextures/Rocky/Gradients/RockyGradientTexture.tres")
    rock_color.skip_first = false
    node_colors.add_child(rock_color)
    
    atmosphere_color_map = rock_color.color_map
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))
    $TabContainer/Options/ScrollContainer/VBoxContainer/Atmosphere.pressed = true


func clear_menus():
    for child in node_generation.get_children():
        child.queue_free()
    for child in node_colors.get_children():
        child.queue_free()
    $TabContainer/Options/ScrollContainer/VBoxContainer/Clouds.disabled = true
    


func _on_PlanetType_item_selected(index):
    emit_signal("planet_type_changed", index)


func _on_color_interface_color_changed():
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))


func _on_Capture_pressed():
    $Export.popup_centered()


func _on_Clouds_toggled(button_pressed):
    emit_signal("cloud_visibility_changed", button_pressed)


func _on_Atmosphere_toggled(button_pressed):
    emit_signal("atmosphere_visibility_changed", button_pressed)


func _on_TopOut_value_changed(value):
    Creator.atmosphere_night_outer = value
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))


func _on_TopIn_value_changed(value):
    Creator.atmosphere_night_inner = value
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))


func _on_BottomOut_value_changed(value):
    Creator.atmosphere_day_outer = value
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))


func _on_BottomIn_value_changed(value):
    Creator.atmosphere_day_inner = value
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))


func _on_Brightness_value_changed(value):
    Creator.atmosphere_interior_brightness = value
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))


func _on_Export_export_sprite(sprite_name, path, style, size):
    emit_signal("export_sprite", sprite_name, path, style, size)
