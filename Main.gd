extends Control


var color_button = preload("res://CustomNodes/ColorInput.tscn")
var file_browser:FileDialog


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
        $HBoxContainer/Menu/TabContainer/Planet/TabContainer/Land/ColorButtons/Colors.add_child(button)
    
    for x in range(Creator.get_ocean_biome_count()-1):
        x += 1
        var button = color_button.instance()
        button.set_color_input_title("Ocean_" + String(x))
        button.biome = button.biomes.OCEAN
        button.index = x
        button.biome_color = Creator.get_ocean_biome(x)
        $HBoxContainer/Menu/TabContainer/Planet/TabContainer/Ocean/ColorButtons/Colors.add_child(button)\


func _on_Settings_pressed():
    $Popups/Settings.popup_centered()
    $Popups.node_to_front($Popups/Settings)


func _on_Quit_pressed():
    get_tree().quit()


func _on_SpriteExport_pressed():
    file_browser = FileDialog.new()
    add_child(file_browser)
    file_browser.mode = file_browser.MODE_SAVE_FILE
    file_browser.access = file_browser.ACCESS_FILESYSTEM
    file_browser.window_title = "Export"
    file_browser.dialog_text = "Export Sprite as .png"
    file_browser.current_file = "PlanetSprite.png"
    file_browser.resizable = true
    file_browser.connect("confirmed", self, "_on_FileDialog_confirmed")
    file_browser.rect_size = Vector2(700,500)
    file_browser.popup_centered()


func _on_FileDialog_confirmed():
    var path = file_browser.current_dir
    var file = file_browser.current_file
    if file == '':
        file = "PlanetSprite"
    elif "." in file:
        file = file.split(".")[0]
    file_browser.queue_free()
    $HBoxContainer/Creator/ViewportContainer.create_sprite(file, path)


func _on_ViewportContainer_export_complete():
    pass
    #$ColorRect.show()


func _on_LightRotationY_value_changed(value):
    $HBoxContainer/Creator/ViewportContainer/Viewport/Spatial/DirectionalLight.rotation.y = deg2rad(value)


func _on_LightRotationX_value_changed(value):
    $HBoxContainer/Creator/ViewportContainer/Viewport/Spatial/DirectionalLight.rotation.x = deg2rad(value)


func _on_SunBrightness_value_changed(value):
    $HBoxContainer/Creator/ViewportContainer/Viewport/Spatial/DirectionalLight.light_energy = value


func _on_FullScreen_toggled(button_pressed):
    if button_pressed:
        OS.window_fullscreen = true
    else:
        OS.window_fullscreen = false
