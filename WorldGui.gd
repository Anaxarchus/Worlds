extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    $ColorButtons/Noise/Resolution/Resolution.selected = Creator.resolutions.values().find(Creator.get_mask_resolution())
    $ColorButtons/Noise/Seed/Seed.value = Creator.get_mask_seed()
    $ColorButtons/Noise/Octaves/Octaves.value = Creator.get_mask_octaves()
    
    $ColorButtons/Noise/Period/Period/Period.value = Creator.get_mask_period()
    $ColorButtons/Noise/Period/PeriodSlider.value = Creator.get_mask_period()
    
    $ColorButtons/Noise/Persistence/Persistence/Persistence.value = Creator.get_mask_persistence()
    $ColorButtons/Noise/Persistence/PersistenceSlider.value = Creator.get_mask_persistence()
    
    $ColorButtons/Noise/Lacunarity/Lacunarity/Lacunarity.value = Creator.get_mask_lacunarity()
    $ColorButtons/Noise/Lacunarity/LacunaritySlider.value = Creator.get_mask_lacunarity()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Resolution_item_selected(index):
    Creator.set_mask_resolution(Creator.resolutions[Creator.resolutions.keys()[index]])


func _on_Seed_value_changed(value):
    if not value == Creator.get_mask_seed():
        Creator.set_mask_seed(value)


func _on_Octaves_value_changed(value):
    if not value == Creator.get_mask_octaves():
        Creator.set_mask_octaves(value)


func _on_Period_value_changed(value):
    if not value == Creator.get_mask_period():
        Creator.set_mask_period(value)
        $ColorButtons/Noise/Period/PeriodSlider.value = value


func _on_PeriodSlider_value_changed(value):
    if not value == Creator.get_mask_period():
        Creator.set_mask_period(value)
        $ColorButtons/Noise/Period/Period/Period.value = value


func _on_Persistence_value_changed(value):
    if not value == Creator.get_mask_persistence():
        Creator.set_mask_persistence(value)
        $ColorButtons/Noise/Persistence/PersistenceSlider.value = value


func _on_PersistenceSlider_value_changed(value):
    if not value == Creator.get_mask_persistence():
        Creator.set_mask_persistence(value)
        $ColorButtons/Noise/Persistence/Persistence/Persistence.value = value


func _on_Lacunarity_value_changed(value):
    if not value == Creator.get_mask_lacunarity():
        Creator.set_mask_lacunarity(value)
        $ColorButtons/Noise/Lacunarity/LacunaritySlider.value = value


func _on_LacunaritySlider_value_changed(value):
    if not value == Creator.get_mask_lacunarity():
        Creator.set_mask_lacunarity(value)
        $ColorButtons/Noise/Lacunarity/Lacunarity/Lacunarity.value = value
