extends CharacterBody2D

var move_speed = 80.0


func _physics_process(delta):
	velocity.x = Input.get_axis('ui_left', 'ui_right') * move_speed
	velocity.y = Input.get_axis('ui_up', 'ui_down') * move_speed
	
	velocity.normalized()
	
	move_and_slide()
