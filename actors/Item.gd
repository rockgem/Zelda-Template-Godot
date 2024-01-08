extends Node2D


var item_id = ''


func _ready():
	$Sprite2D.texture = load("res://reso/icons/items/%s.tres" % item_id)


func _on_interactable_interacted():
	queue_free()
