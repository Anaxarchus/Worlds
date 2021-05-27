extends PopupPanel

signal export_sprite(sprite_name, path, style, size)

var file_browser:FileDialog
var size:int = 500
var style:int = 0
var path:String
var sprite_name:String = "PlanetSprite"

var valid_path:bool = false setget set_valid_path


func set_valid_path(value:bool):
    valid_path = value
    if value:
        $VBoxContainer2/HBoxContainer/Export.disabled = false
    else:
        $VBoxContainer2/HBoxContainer/Export.disabled = true


func _on_Size_value_changed(value):
    size = value


func _on_Style_item_selected(index):
    style = index


func _on_FileDialog_confirmed():
    path = file_browser.current_dir
    file_browser.queue_free()
    set_valid_path(true)
    $VBoxContainer2/CenterContainer/VBoxContainer/HBoxContainer3/PathButton.text = file_browser.current_path


func _on_PathButton_pressed():
    file_browser = FileDialog.new()
    get_parent().add_child(file_browser)
    file_browser.mode = file_browser.MODE_SAVE_FILE
    file_browser.access = file_browser.ACCESS_FILESYSTEM
    file_browser.window_title = "Export"
    file_browser.dialog_text = "Export Sprite as .png"
    file_browser.current_file = sprite_name + ".png"
    file_browser.resizable = true
    file_browser.connect("confirmed", self, "_on_FileDialog_confirmed")
    file_browser.rect_size = Vector2(700,500)
    file_browser.popup_centered()


func _on_Export_pressed():
    self.hide()
    if sprite_name == "":
        sprite_name = "PlanetSprite"
    emit_signal("export_sprite", sprite_name, path, style, size)
    print("exporting, name: ", sprite_name, ", path: ", path, ", style: ", style, ", size: ", size )


func _on_Cancel_pressed():
    self.hide()


func _on_Name_text_entered(new_text):
    sprite_name = new_text
