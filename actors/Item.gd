extends Node2D


var item_id = ''

var is_active = false

func _ready():
	$Sprite2D.texture = load("res://reso/icons/items/%s.tres" % item_id)
	
	var dur = .2
	var rand_x = randf_range(-14, 14)
	var t = get_tree().create_tween().set_parallel()
	t.tween_property(self, 'global_position:y', global_position.y - 14, dur).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	t.tween_property(self, 'global_position:y', global_position.y + 6, dur).set_delay(dur).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	t.tween_property(self, 'global_position:x', global_position.x - rand_x, .4)
	
	await t.finished
	
	is_active = true


func pickup():
	ManagerGame.put_item_to_inv(item_id)
	
	queue_free()


func _on_interactable_interacted():
	if is_active:
		pickup()
