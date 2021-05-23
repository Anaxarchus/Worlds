extends Popup

signal window_selected

enum states {IDLE, PICKED}
var state:int = states.IDLE setget set_state
var mouse_offset:Vector2

export(String) var window_title:String setget set_window_title


# Called when the node enters the scene tree for the first time.
func _ready():
    if window_title.length() > 0:
        set_window_title(window_title)
    self.set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    self.rect_position = get_viewport().get_mouse_position() - mouse_offset


func _input(event):
    if state == states.PICKED:
        if event.is_action_released("select"):
            set_state(states.IDLE)


func set_state(value:int):
    state = value
    if state == states.IDLE:
        set_process(false)
    elif state == states.PICKED:
        set_process(true)
        set_mouse_offset()


func set_mouse_offset():
    var mouse_position = get_viewport().get_mouse_position()
    mouse_offset = mouse_position - self.rect_position


func set_window_title(value:String):
    $Panel/VBoxContainer/WindowGrabber.text = value


func _on_CloseButton_pressed():
    self.hide()


func _on_WindowGrabber_button_down():
    set_state(states.PICKED)
    emit_signal("window_selected")


func _on_DragContainer_gui_input(event):
    if event.is_action_pressed("select"):
        emit_signal("window_selected")
