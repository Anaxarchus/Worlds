class_name NumberEdit
extends LineEdit


var _string_value:String
var _legal_characters:Array = ["0","1","2","3","4","5","6","7","8","9"]


func _ready():
    self.connect("text_changed", self, "_on_NumberEdit_text_changed")


func set_text(value:String):
    if value.is_valid_integer() and value.length() <= 9:
        text = value
        _string_value = value


func _on_NumberEdit_text_changed(new_text):
    if not self.text.length() > 9:
        var tex = new_text.right(new_text.length()-1)
        if _legal_characters.has(tex):
            _string_value += tex
    self.text = _string_value
    self.caret_position = self.text.length()
