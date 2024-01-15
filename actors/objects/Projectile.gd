extends Node2D


var direction
var speed = 230.0

func _physics_process(delta):
	global_position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_area_entered(area):
	area.take_damage(1)
	
	queue_free()
