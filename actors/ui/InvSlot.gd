extends Panel


var item_id = ''


func _ready():
	$HBoxContainer/Icon.texture = load("res://reso/icons/items/%s.tres" % item_id)
