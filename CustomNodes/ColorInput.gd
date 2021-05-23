extends HBoxContainer


export (Color) var color_picker_mask_color:Color = Color(0.129412, 0.129412, 0.129412) setget set_color_picker_mask_color
export (String) var color_input_title:String setget set_color_input_title

enum biomes {LAND, OCEAN, CLOUDS}
var biome:int
var index:int
var biome_color:Color setget set_biome_color

var is_ready:bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
    is_ready = true
    set_color_picker_mask_color(color_picker_mask_color)
    set_color_input_title(color_input_title)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func set_color_picker_mask_color(value:Color):
    color_picker_mask_color = value
    if is_ready:
        $TextureRect.self_modulate = value


func set_color_input_title(value:String):
    color_input_title = value
    $Label.text = value


func set_biome_color(value:Color):
    biome_color = value
    $TextureRect/ColorPickerButton.color = value
    if biome == biomes.LAND:
        Creator.set_land_biome(index,value)
    elif biome == biomes.OCEAN:
        Creator.set_ocean_biome(index,value)


func _on_ColorPickerButton_color_changed(color):
    if not color == biome_color:
        set_biome_color(color)
