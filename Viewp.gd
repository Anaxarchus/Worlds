extends ViewportContainer


signal export_complete


func create_sprite(new_name:String, path:String):
    #$Viewport.size_override_stretch = true
    var parent = get_parent().get_parent().get_parent()
    var viewp_size = get_viewport().size
    get_viewport().size = (Vector2(600,600))
    parent.hide()
    Creator.creator_scene.mask.show()
    Creator.creator_scene.mask.position = Vector2(300,300)
    #$Viewport.transparent_bg = false
    yield(get_tree(),"idle_frame")
    yield(get_tree(),"idle_frame")
    
    var my_img : Image = Image.new()
    my_img = get_viewport().get_texture().get_data()
    my_img.convert(Image.FORMAT_RGBA8)
    
    var img_size = my_img.get_size()-Vector2(40,40)
    my_img.crop(img_size.x,img_size.y)
    img_size -= Vector2(40,40)
    my_img.flip_y()
    my_img.flip_x()
    my_img.crop(img_size.x,img_size.y)
    my_img.flip_x()
    my_img.resize(500,500)
    
    #my_img.lock()
    #for x in range(500):
    #    for y in range(500):
    #        var pix = my_img.get_pixel(x,y)
    #        if pix == screen_color:
    #            my_img.set_pixel(x,y,Color(0,0,0,0))
    
    #my_img.unlock()
    print('saving image')
    save_sprite(my_img, new_name, path)
    get_viewport().size = viewp_size
    #$Viewport.transparent_bg = true
    yield(get_tree(),"idle_frame")
    yield(get_tree(),"idle_frame")
    emit_signal("export_complete")
    parent.show()
    Creator.creator_scene.mask.hide()


func create_sprite_(new_name:String, path:String):
    $Viewport.size_override_stretch = true
    $Viewport.size = (Vector2(600,600))
    #$Viewport.transparent_bg = false
    yield(get_tree(),"idle_frame")
    yield(get_tree(),"idle_frame")
    
    var my_img : Image = Image.new()
    my_img.convert(Image.FORMAT_RGBA8)
    my_img = $Viewport.get_texture().get_data()
    
    var img_size = my_img.get_size()-Vector2(40,40)
    my_img.crop(img_size.x,img_size.y)
    img_size -= Vector2(40,40)
    my_img.flip_y()
    my_img.flip_x()
    my_img.crop(img_size.x,img_size.y)
    my_img.flip_x()
    my_img.resize(500,500)
    
    #my_img.lock()
    #for x in range(500):
    #    for y in range(500):
    #        var pix = my_img.get_pixel(x,y)
    #        if pix == screen_color:
    #            my_img.set_pixel(x,y,Color(0,0,0,0))
    
    #my_img.unlock()
    print('saving image')
    save_sprite(my_img, new_name, path)
    $Viewport.size_override_stretch = false
    $Viewport.size = self.rect_size
    #$Viewport.transparent_bg = true
    yield(get_tree(),"idle_frame")
    yield(get_tree(),"idle_frame")
    emit_signal("export_complete")


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
    else:
        image.save_png(sprite_path + '/' + new_sprite_name)

