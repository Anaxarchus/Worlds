extends Node

enum export_styles {DEFAULT, ENDLESS_SKY}

onready var mask = $ShadowMask


func create_sprite(new_name:String, path:String, export_style:int, export_size:int):
    #$Viewport.size_override_stretch = true
    var viewp_size = get_viewport().size
    get_viewport().size = (Vector2(export_size*1.2,export_size*1.2))
    $GUI.hide()
    if export_style == export_styles.ENDLESS_SKY:
        mask.show()
        mask.position = get_viewport().size*.5
    #$Viewport.transparent_bg = false
    yield(get_tree(),"idle_frame")
    yield(get_tree(),"idle_frame")
    
    var my_img : Image = Image.new()
    my_img = get_viewport().get_texture().get_data()
    my_img.convert(Image.FORMAT_RGBA8)
    
    var margin = get_margin(my_img)*.5
    var img_size = my_img.get_size()-Vector2(margin,margin)
    my_img.crop(img_size.x,img_size.y)
    img_size -= Vector2(margin,margin)
    my_img.flip_y()
    my_img.flip_x()
    my_img.crop(img_size.x,img_size.y)
    my_img.flip_x()
    my_img.resize(export_size,export_size)
    
    print('saving image')
    save_sprite(my_img, new_name, path)
    get_viewport().size = viewp_size
    yield(get_tree(),"idle_frame")
    yield(get_tree(),"idle_frame")
    $GUI.show()
    mask.hide()


func get_margin(image:Image) -> int:
    
    image.lock()
    var image_size = image.get_size()
    var x = image_size.x*.5
    var y = image_size.y-1
    for c in range(image_size.y):
        print("checking pixel(",x,", ",y,"): color(",image.get_pixel(x,y),")")
        if not image.get_pixel(x,y).a < 0.1:
            y -= 1
        else:
            break
    image.unlock()
    
    return image_size.y - y


func save_sprite(image:Image, image_name:String, path:String):
    var d = Directory.new()
    var sprite_path = path
    var new_sprite_name = image_name + '.png'
    var err = d.open(sprite_path)
    print(sprite_path)
    print(err)
    if err != OK:
        err = d.open(path)
        print(err)
        if err == OK:
            d.make_dir('Sprites')
            image.save_png(sprite_path + '/' + new_sprite_name)
            #image.save_png(sprite_path)
    else:
        image.save_png(sprite_path + '/' + new_sprite_name)
        #image.save_png(sprite_path)


func _on_GUI_export_sprite(sprite_name:String, save_path:String, style:int, size:int):
    create_sprite(sprite_name, save_path, style, size)
