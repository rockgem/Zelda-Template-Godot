extends Node2D






func explode():
	$Sprite2D.hide()
	$AnimatedSprite2D.show()
	$AnimatedSprite2D.play('boom')
	
	for body in $Area2D.get_overlapping_areas():
		body.take_damage(1)
	
	await $AnimatedSprite2D.animation_finished
	
	queue_free()


func _on_timer_timeout():
	explode()
