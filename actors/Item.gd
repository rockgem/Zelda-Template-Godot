extends Node2D


var item_id = ''


func _ready():
	$Sprite2D.texture = load("res://reso/icons/items/%s.tres" % item_id)


func pickup():
	ManagerGame.put_item_to_inv(item_id)
	
	queue_free()


func _on_interactable_interacted():
	pickup()
