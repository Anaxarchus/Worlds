extends Node


enum resolutions {LOW=512, MEDIUM=1024, HIGH=2048, VERY_HIGH=4096}

var gradient_gaseous = preload("res://Resources/PlanetTextures/Gaseous/Gradients/GaseousGradientTexture.tres")
var gradient_earth_ocean = preload("res://Resources/PlanetTextures/Earth/Gradients/OceanGradientTexture.tres")

var atmosphere_day_outer:float = 1.1 #0
var atmosphere_day_inner:float = 1.0 #1
var atmosphere_night_outer:float = 0.75 #0
var atmosphere_night_inner:float = 0.5 #1
var atmosphere_interior_brightness:float = 1.2


func get_average_gradient_color(gradient:GradientTexture):
    var average:Vector3
    for x in range(gradient.gradient.get_point_count()-1):
        var point_color = gradient.gradient.get_color(x+1)
        average += Vector3(point_color.r, point_color.g, point_color.b)
    average = average/(gradient.gradient.get_point_count()-1)
    return Color(average.x, average.y, average.z)
    
