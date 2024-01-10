extends CharacterBody2D

var move_speed = 80.0

@onready var cam = $Camera2D
@onready var tree = $AnimationTree
@onready var playback = tree.get("parameters/playback")
@onready var cast = $Aim/RayCast2D

var can_move = true
var is_attacking = false

var hp = 5


func _ready():
	ManagerGame.global_player_ref = self
	
	$Hurtbox.hp = hp


func _unhandled_input(event):
	if Input.is_action_just_pressed("attack"):
		attack()


func _physics_process(delta):
	if is_attacking:
		return
	if can_move == false:
		return
	
	velocity.x = Input.get_axis('ui_left', 'ui_right') * move_speed
	velocity.y = Input.get_axis('ui_up', 'ui_down') * move_speed
	
	if velocity != Vector2.ZERO:
		tree.set('parameters/idle/blend_position', velocity)
		tree.set('parameters/walk/blend_position', velocity)
		tree.set('parameters/attack/blend_position', velocity)
		
		$Aim.rotation = velocity.angle()
		
		playback.travel('walk')
	else:
		playback.travel('idle')
	
	velocity.normalized()
	
	move_and_slide()


func death():
	pass


func attack():
	var obj = cast.get_collider()
	if obj:
		obj.take_damage(1)
	
	is_attacking = true
	
	Sfx.play_sound('Slash')
	playback.travel('attack')


func receive_damage(damage = 1):
	print('player took a hit!')
	$Hurtbox.take_damage(damage)


func _on_animation_tree_animation_finished(anim_name):
	is_attacking = false


func _on_hurtbox_zero():
	death()
