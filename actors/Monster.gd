extends Node2D



func _on_hurtbox_hurt():
	pass # Replace with function body.


func _on_hurtbox_zero():
	queue_free()
