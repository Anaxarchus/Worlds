extends Spatial


enum planet_types {EMPTY, EARTH_LIKE, GASEOUS}


var rotating_planet:bool = true
var rotation_speed:float = 0.025 setget set_rotation_speed

var material_empty = preload("res://Resources/Materials/Empty.tres")
var material_earth_like = preload("res://Resources/Materials/EarthLike.material")
var material_gaseous = preload("res://Resources/Materials/Gaseous.material")

onready var node_mask = $CanvasLayer/ShadowMask
onready var node_atmos = $PlanetAthmosphere
onready var node_world_env = $WorldEnvironment

var atmosphere:bool = true setget set_atmosphere


# Called when the node enters the scene tree for the first time.
func _ready():
    get_parent().set_transparent_background(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if rotating_planet:
        $MeshInstance.rotation.y += delta*rotation_speed


func set_rotation_speed(value:float):
    rotation_speed = value*0.0125


func set_atmosphere(value:bool):
    if value:
        node_atmos.show()
        node_world_env.environment.fog_enabled = true
    else:
        node_atmos.hide()
        node_world_env.environment.fog_enabled = false


func set_atmosphere_color(value:Color):
    var day_1 = value
    var day_0 = value * 1.1
    var night_1 = value * .5
    var night_0 = value * .75
    node_atmos.set_shader_param("u_day_color1", day_1)
    node_atmos.set_shader_param("u_day_color0", day_0)
    node_atmos.set_shader_param("u_night_color0", night_0)
    
    node_world_env.environment.fog_color = value*1.25


func _on_CheckBox_toggled(button_pressed):
    rotating_planet = button_pressed


func _on_SpinBox_value_changed(value):
    set_rotation_speed(value)


func _on_GUI_planet_type_changed(value):
    $CanvasLayer/GUI.clear_menus()
    if value == planet_types.EMPTY:
        $MeshInstance.set_surface_material(0,material_empty)
        $MeshInstance.rotation.z = 0
        set_atmosphere(false)
    elif value == planet_types.EARTH_LIKE:
        $MeshInstance.set_surface_material(0,material_earth_like)
        $MeshInstance.rotation.z = 0
        $CanvasLayer/GUI.configure_for_earth_like()
        set_atmosphere(true)
    elif value == planet_types.GASEOUS:
        $MeshInstance.set_surface_material(0,material_gaseous)
        $MeshInstance.rotation.z = deg2rad(-45)
        $CanvasLayer/GUI.configure_for_gas()
        set_atmosphere(true)


func _on_GUI_atmosphere_color_changed(color):
    set_atmosphere_color(color)
