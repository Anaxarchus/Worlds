class_name HSlideAndSpin
extends HBoxContainer


signal value_changed(value)

export(String) var title setget set_title
export(float) var value setget set_value
export(float) var max_value setget set_max_value
export(float) var min_value setget set_min_value
export(float) var step setget set_step
export(String) var tool_tip setget set_tool_tip

var ready:bool = false



func _ready():
    set_title(title)
    set_value(value)
    set_min_value(min_value)
    set_max_value(max_value)
    set_step(step)
    set_tool_tip(tool_tip)


func set_tool_tip(val:String):
    tool_tip = val
    $Label.hint_tooltip = val


func set_title(val:String):
    title = val
    $Label.text = val


func set_value(val:float):
    value = val
    $HSlider.value = val
    $SpinBox.value = val


func set_min_value(val:float):
    min_value = val
    $HSlider.min_value = val
    $SpinBox.min_value = val


func set_max_value(val:float):
    max_value = val
    $HSlider.max_value = val
    $SpinBox.max_value = val


func set_step(val:float):
    step = val
    $HSlider.step = val
    $SpinBox.step = val


func _on_HSlider_value_changed(val):
    if not val == value:
        value = val
        $SpinBox.value = val
        emit_signal("value_changed", value)


func _on_SpinBox_value_changed(val):
    if not val == value:
        value = val
        $HSlider.value = val
        emit_signal("value_changed", value)
