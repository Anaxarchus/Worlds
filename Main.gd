extends Control


var color_button = preload("res://CustomNodes/ColorInput.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
    ui_update()
    generate_color_buttons()


# Getting shader values

func ui_update():
    pass


func generate_color_buttons():
    for x in range(Creator.get_land_biome_count()-1):
        x += 1
        var button = color_button.instance()
        button.set_color_input_title("Land_" + String(x))
        button.biome = button.biomes.LAND
        button.index = x
        button.biome_color = Creator.get_land_biome(x)
        $Popups/LandBiomeColors/Panel/VBoxContainer/ScrollContainer/ColorButtons.add_child(button)
    
    for x in range(Creator.get_ocean_biome_count()-1):
        x += 1
        var button = color_button.instance()
        button.set_color_input_title("Ocean_" + String(x))
        button.biome = button.biomes.OCEAN
        button.index = x
        button.biome_color = Creator.get_ocean_biome(x)
        $Popups/OceanBiomeColors/Panel/VBoxContainer/ScrollContainer/ColorButtons.add_child(button)
        


func _on_WorldGenButton_pressed():
    $Popups/WorldGenProperties.show()
    $Popups.node_to_front($Popups/WorldGenProperties)
    
    
func _on_LandPaintButton_pressed():
    $Popups/LandBiomeColors.show()
    $Popups.node_to_front($Popups/LandBiomeColors)


func _on_OceanPaintButton_pressed():
    $Popups/OceanBiomeColors.show()
    $Popups.node_to_front($Popups/OceanBiomeColors)
