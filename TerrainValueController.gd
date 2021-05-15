extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    update_values()


func update_values():
    $Levels/Beach/Color/ColorPickerButton.color = Creator.get_beach_color()
    $Levels/Biome_1/Color/ColorPickerButton.color = Creator.get_biome_1_color()
    $Levels/Biome_2/Color/ColorPickerButton.color = Creator.get_biome_2_color()
    $Levels/Biome_3/Color/ColorPickerButton.color = Creator.get_biome_3_color()
    $Levels/Biome_4/Color/ColorPickerButton.color = Creator.get_biome_4_color()
    $Levels/Biome_5/Color/ColorPickerButton.color = Creator.get_biome_5_color()
    $Levels/Biome_6/Color/ColorPickerButton.color = Creator.get_biome_6_color()
    
    $Noise/Seed/SpinBox.value = Creator.get_land_seed()
    $Noise/Octaves/HSlider.value = Creator.get_land_octaves()
    $Noise/Persistence/HSlider.value = Creator.get_land_persistence()
    $Noise/Period/HSlider.value = Creator.get_land_period()
    $Noise/Lacunarity/HSlider.value = Creator.get_land_lacunarity()
    


func _on_Beach_color_changed(color):
    Creator.set_beach_color(color)


func _on_Biome_1_color_changed(color):
    Creator.set_biome_1_color(color)


func _on_Biome_2_color_changed(color):
    Creator.set_biome_2_color(color)


func _on_Biome_3_color_changed(color):
    Creator.set_biome_3_color(color)


func _on_Biome_4_color_changed(color):
    Creator.set_biome_4_color(color)


func _on_Biome_5_color_changed(color):
    Creator.set_biome_5_color(color)


func _on_Biome_6_color_changed(color):
    Creator.set_biome_6_color(color)


func _on_Seed_value_changed(value):
    Creator.set_land_seed(value)


func _on_Octaves_value_changed(value):
    Creator.set_land_octaves(value)


func _on_Persistence_value_changed(value):
    Creator.set_land_persistence(value)


func _on_Period_value_changed(value):
    Creator.set_land_period(value)


func _on_Lacunarity_value_changed(value):
    Creator.set_land_lacunarity(value)
