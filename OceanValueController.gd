extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    update_values()


func update_values():
    $Levels/Biome_1/Color/ColorPickerButton.color = Creator.get_deep_ocean_color()
    $Levels/Biome_2/Color/ColorPickerButton.color = Creator.get_ocean_color()
    $Levels/Biome_3/Color/ColorPickerButton.color = Creator.get_shallow_ocean_color()
    $Levels/Biome_4/Color/ColorPickerButton.color = Creator.get_reef_ocean_color()
    $Levels/Biome_5/Color/ColorPickerButton.color = Creator.get_coastal_ocean_color()
    
    $Noise/Seed/SpinBox.value = Creator.get_ocean_seed()
    $Noise/Octaves/HSlider.value = Creator.get_ocean_octaves()
    $Noise/Persistence/HSlider.value = Creator.get_ocean_persistence()
    $Noise/Period/HSlider.value = Creator.get_ocean_period()
    $Noise/Lacunarity/HSlider.value = Creator.get_ocean_lacunarity()


func _on_Biome_1_color_changed(color):
    Creator.set_deep_ocean_color(color)


func _on_Biome_2_color_changed(color):
    Creator.set_ocean_color(color)


func _on_Biome_3_color_changed(color):
    Creator.set_shallow_ocean_color(color)


func _on_Biome_4_color_changed(color):
    Creator.set_reef_ocean_color(color)


func _on_Biome_5_color_changed(color):
    Creator.set_coastal_ocean_color(color)


func _on_Seed_value_changed(value):
    Creator.set_ocean_seed(value)


func _on_Octaves_value_changed(value):
    Creator.set_ocean_octaves(value)


func _on_Persistence_value_changed(value):
    Creator.set_ocean_persistence(value)


func _on_Period_value_changed(value):
    Creator.set_ocean_period(value)


func _on_Lacunarity_value_changed(value):
    Creator.set_ocean_lacunarity(value)
