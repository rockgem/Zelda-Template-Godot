extends Node2D


var item_id = ''

var is_active = false

func _ready():
	$Sprite2D.texture = load("res://reso/icons/items/%s.tres" % item_id)
	
	await get_tree().create_timer(1.0)
	
	is_active = true


func pickup():
	ManagerGame.put_item_to_inv(item_id)
	
	queue_free()


func _on_interactable_interacted():
	if is_active:
		pickup()
