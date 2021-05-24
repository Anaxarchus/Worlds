extends VBoxContainer



export(NoiseTexture) var noise setget set_noise
onready var rng:RandomNumberGenerator = RandomNumberGenerator.new()
var ready:bool = false


func _ready():
    ready = true
    set_noise(noise)


func random_seed() -> int:
    return rng.randi_range(0,999_999_999)


func set_noise(value:NoiseTexture):
    if ready:
        if value:
            noise = value
            
            var noise_name = value.resource_path.get_file().split(".")[0]
            $Label.text = noise_name.capitalize()
            $TextureRect.texture = noise
            $Octaves.value = noise.noise.octaves
            $Period.value = noise.noise.period
            $Persistence.value = noise.noise.persistence
            $Lacunarity.value = noise.noise.lacunarity
            $Resolution/Resolution.selected = Creator.resolutions.values().find(noise.width)
            _on_Random_pressed()
        
    else:
        noise = value


func _on_Random_pressed():
    $Seed/NumberEdit.text = String(random_seed())
    noise.noise.seed = int($Seed/NumberEdit.text)


func _on_NumberEdit_text_entered(new_text):
    noise.noise.seed = int(new_text)


func _on_Octaves_value_changed(value:float):
    noise.noise.octaves = int(value)


func _on_Period_value_changed(value:float):
    noise.noise.period = value


func _on_Persistence_value_changed(value:float):
    noise.noise.persistence = value


func _on_Lacunarity_value_changed(value:float):
    noise.noise.lacunarity = value


func _on_Resolution_item_selected(index):
    noise.width = Creator.resolutions[Creator.resolutions.keys()[index]]
    noise.height = Creator.resolutions[Creator.resolutions.keys()[index]]
