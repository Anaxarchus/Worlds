extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func node_to_front(node:Popup):
    if get_children().has(node):
        self.move_child(node,get_child_count()-1)


func _on_WorldGenProperties_window_selected():
    node_to_front($WorldGenProperties)


func _on_BiomeColors_window_selected():
    node_to_front($BiomeColors)
