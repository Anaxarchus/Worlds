extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rotating_planet:bool = true
var rotation_speed:float = 0.025 setget set_rotation_speed
onready var mask = get_node("CanvasLayer/ShadowMask")


# Called when the node enters the scene tree for the first time.
func _ready():
    get_parent().set_transparent_background(true)
    Creator.creator_scene = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if rotating_planet:
        $MeshInstance.rotation.y += delta*rotation_speed


func set_rotation_speed(value:float):
    rotation_speed = value*0.0125


func _on_CheckBox_toggled(button_pressed):
    rotating_planet = button_pressed


func _on_SpinBox_value_changed(value):
    set_rotation_speed(value)
