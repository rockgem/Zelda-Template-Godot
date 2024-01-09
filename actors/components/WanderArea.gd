extends Area2D
class_name WanderArea

@onready var shape = $CollisionShape2D


func get_random_point() -> Vector2:
	var rect = shape.shape.get_rect()
	var r = Vector2.ZERO
	
	r.x = randf_range(rect.position.x, rect.end.x)
	r.y = randf_range(rect.position.y, rect.end.y)
	
	r.x += global_position.x
	r.y += global_position.y
	
	return r
