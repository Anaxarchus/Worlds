extends VBoxContainer

signal color_interface_color_changed

export(GradientTexture) var color_map setget set_color_map
var offset_interface = preload("res://GUI/CustomNodes/ColorInterface/OffsetInterface.tscn")

var ready:bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
    ready = true
    set_color_map(color_map)


func generate_offset_interfaces():
    for child in $CenterContainer/OffsetContainer.get_children():
        child.queue_free()
    var offset_count = get_offset_count()-1
    var last = null
    var next = null
    for x in range(offset_count):
        if x+1 == offset_count:
            next = null
        else:
            next = x+2
        var offset = offset_interface.instance()
        offset.index_id = x+1
        offset.title = "Color " + String(offset.index_id)
        offset.offset_color = get_offset_color(x+1)
        
        if last == null:
            offset.set_blend_min(0.0001)
        else:
            var position = get_offset_position(last) + (get_offset_position(x+1) - get_offset_position(last))*.5 + 0.001
            offset.set_blend_min(position)
        
        
        if next == null:
            offset.set_blend_max(1.0)
        else:
            var position = get_offset_position(x+1) + (get_offset_position(next) - get_offset_position(x+1))*.5 - 0.001
            offset.set_blend_max(position)
        
        offset.set_blend_value(offset.blend_min + (offset.blend_max - offset.blend_min)*.5)
        $CenterContainer/OffsetContainer.add_child(offset)
        offset.connect("blend_changed", self, "_on_OffsetInterface_blend_changed")
        offset.connect("color_changed", self, "_on_OffsetInterface_color_changed")
        last = x+1
    


func set_color_map(value:GradientTexture):
    color_map = value
    if ready:
        if value:
            generate_offset_interfaces()
        
            var noise_name = value.resource_path.get_file().split(".")[0]
            $Label.text = noise_name.capitalize()


func get_offset_count() -> int:
    var still_counting:bool = true
    var biome_count:int = 1
    while still_counting:
        if color_map.gradient.get_color(biome_count):
            biome_count += 1
        else:
            still_counting = false
    return biome_count


func get_offset_color(index:int) -> Color:
    return color_map.gradient.get_color(index)


func set_offset_color(index:int, color:Color) -> void:
    color_map.gradient.set_color(index, color)


func get_offset_position(index:int) -> float:
    return color_map.gradient.get_offset(index)


func set_offset_position(index:int, value:float):
    color_map.gradient.set_offset(index, value)


func _on_OffsetInterface_blend_changed(index, value):
    set_offset_position(index, value)


func _on_OffsetInterface_color_changed(index, color):
    set_offset_color(index, color)
    emit_signal("color_interface_color_changed")
