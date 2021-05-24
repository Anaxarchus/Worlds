extends VBoxContainer


signal color_changed(index, color)
signal blend_changed(index, value)

var title:String setget set_title
var index_id:int

var blend_min:float setget set_blend_min
var blend_max:float setget set_blend_max
var blend_value:float setget set_blend_value

var offset_color:Color setget set_color



func set_title(value:String):
    title = value
    $Title.text = value


func set_blend_min(value:float):
    blend_min = value
    $HBoxContainer2/HSlider.min_value = value


func set_blend_max(value:float):
    blend_max = value
    $HBoxContainer2/HSlider.max_value = value


func set_blend_value(value:float):
    blend_value = value
    $HBoxContainer2/HSlider.value = value


func set_color(color:Color):
    $HBoxContainer/ColorPickerButton.color = color


func _on_ColorPickerButton_color_changed(color):
    emit_signal("color_changed", index_id, color)


func _on_HSlider_value_changed(value):
    emit_signal("blend_changed", index_id, value)
