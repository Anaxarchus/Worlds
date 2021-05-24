extends Control

signal atmosphere_color_changed(color)
signal atmosphere_visibility_changed(value)
signal planet_type_changed(value)
signal export_sprite(sprite_name, save_path)

var noise_interface = preload("res://GUI/CustomNodes/NoiseInterface/NoiseInterface.tscn")
var color_interface = preload("res://GUI/CustomNodes/ColorInterface/ColorInterface.tscn")

onready var node_generation = $TabContainer/Generation/ScrollContainer/VBoxContainer
onready var node_colors = $TabContainer/Colors/ScrollContainer/VBoxContainer
onready var node_options = $TabContainer/Options/ScrollContainer/VBoxContainer

var atmosphere_color_map:GradientTexture
var file_browser:FileDialog



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
    ocean_color.connect("color_interface_color_changed", self, "_on_color_interface_color_changed")
    
    atmosphere_color_map = ocean_color.color_map
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))


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


func _on_color_interface_color_changed():
    emit_signal("atmosphere_color_changed", Creator.get_average_gradient_color(atmosphere_color_map))


func _on_Capture_pressed():
    file_browser = FileDialog.new()
    add_child(file_browser)
    file_browser.mode = file_browser.MODE_SAVE_FILE
    file_browser.access = file_browser.ACCESS_FILESYSTEM
    file_browser.window_title = "Export"
    file_browser.dialog_text = "Export Sprite as .png"
    file_browser.current_file = "PlanetSprite.png"
    file_browser.resizable = true
    file_browser.connect("confirmed", self, "_on_FileDialog_confirmed")
    file_browser.rect_size = Vector2(700,500)
    file_browser.popup_centered()


func _on_FileDialog_confirmed():
    var path = file_browser.current_dir
    var file = file_browser.current_file
    if file == '':
        file = "PlanetSprite"
    elif "." in file:
        file = file.split(".")[0]
    file_browser.queue_free()
    emit_signal("export_sprite", file, path)
