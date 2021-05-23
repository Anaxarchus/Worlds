extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    $ScrollContainer/VBoxContainer/VBoxContainer/HBoxContainer/Brightness.value = Creator.get_env_brightness()
    $ScrollContainer/VBoxContainer/VBoxContainer2/HBoxContainer2/Contrast.value = Creator.get_env_contrast()
    $ScrollContainer/VBoxContainer/VBoxContainer3/HBoxContainer3/Saturation.value = Creator.get_env_saturation()
    $ScrollContainer/VBoxContainer/VBoxContainer4/HBoxContainer4/Exposure.value = Creator.get_env_exposure()
    $ScrollContainer/VBoxContainer/VBoxContainer5/HBoxContainer5/White.value = Creator.get_env_white()
    
    $ScrollContainer/VBoxContainer/VBoxContainer/BrightnessSlider.value = Creator.get_env_brightness()
    $ScrollContainer/VBoxContainer/VBoxContainer2/ContrastSlider.value = Creator.get_env_contrast()
    $ScrollContainer/VBoxContainer/VBoxContainer3/SaturationSlider.value = Creator.get_env_saturation()
    $ScrollContainer/VBoxContainer/VBoxContainer4/ExposureSlider.value = Creator.get_env_exposure()
    $ScrollContainer/VBoxContainer/VBoxContainer5/WhiteSlider.value = Creator.get_env_white()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Brightness_value_changed(value):
    if not Creator.get_env_brightness() == value:
        Creator.set_env_brightness(value)
        $ScrollContainer/VBoxContainer/VBoxContainer/BrightnessSlider.value = value


func _on_Contrast_value_changed(value):
    if not Creator.get_env_contrast() == value:
        Creator.set_env_contrast(value)
        $ScrollContainer/VBoxContainer/VBoxContainer2/ContrastSlider.value = value


func _on_Saturation_value_changed(value):
    if not Creator.get_env_saturation() == value:
        Creator.set_env_saturation(value)
        $ScrollContainer/VBoxContainer/VBoxContainer3/SaturationSlider.value = value


func _on_Exposure_value_changed(value):
    if not Creator.get_env_exposure() == value:
        Creator.set_env_exposure(value)
        $ScrollContainer/VBoxContainer/VBoxContainer4/ExposureSlider.value = value


func _on_White_value_changed(value):
    if not Creator.get_env_white() == value:
        Creator.set_env_white(value)
        $ScrollContainer/VBoxContainer/VBoxContainer5/WhiteSlider.value = value


func _on_BrightnessSlider_value_changed(value):
    if not Creator.get_env_brightness() == value:
        Creator.set_env_brightness(value)
        $ScrollContainer/VBoxContainer/VBoxContainer/HBoxContainer/Brightness.value = value


func _on_ContrastSlider_value_changed(value):
    if not Creator.get_env_contrast() == value:
        Creator.set_env_contrast(value)
        $ScrollContainer/VBoxContainer/VBoxContainer2/HBoxContainer2/Contrast.value = value


func _on_SaturationSlider_value_changed(value):
    if not Creator.get_env_saturation() == value:
        Creator.set_env_saturation(value)
        $ScrollContainer/VBoxContainer/VBoxContainer3/HBoxContainer3/Saturation.value = value


func _on_ExposureSlider_value_changed(value):
    if not Creator.get_env_exposure() == value:
        Creator.set_env_exposure(value)
        $ScrollContainer/VBoxContainer/VBoxContainer4/HBoxContainer4/Exposure.value = value


func _on_WhiteSlider_value_changed(value):
    if not Creator.get_env_white() == value:
        Creator.set_env_white(value)
        $ScrollContainer/VBoxContainer/VBoxContainer5/HBoxContainer5/White.value = value
