extends Node2D


func _ready():
	var t = get_tree().create_tween().parallel()
	t.tween_property(self, 'global_position:y', global_position.y - 16, .4).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	t.tween_property(self, 'modulate', Color.TRANSPARENT, .2).set_delay(.3)
	
	await t.finished
	
	queue_free()
