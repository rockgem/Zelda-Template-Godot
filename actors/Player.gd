extends CharacterBody2D

var move_speed = 80.0

@onready var tree = $AnimationTree
@onready var playback = tree.get("parameters/playback")


func _physics_process(delta):
	velocity.x = Input.get_axis('ui_left', 'ui_right') * move_speed
	velocity.y = Input.get_axis('ui_up', 'ui_down') * move_speed
	
	if velocity != Vector2.ZERO:
		tree.set('parameters/idle/blend_position', velocity)
		tree.set('parameters/walk/blend_position', velocity)
		
		playback.travel('walk')
	else:
		playback.travel('idle')
	
	velocity.normalized()
	
	move_and_slide()
