extends CharacterBody2D

var move_speed = 80.0
var dir

@onready var cam = $Camera2D
@onready var tree = $AnimationTree
@onready var playback = tree.get("parameters/playback")
@onready var cast = $Aim/RayCast2D

var can_move = true
var can_attack = true
var can_shoot = true
var is_attacking = false

var hp = 5
var push_force = 8000

func _ready():
	ManagerGame.player_movement_activate.connect(on_player_movement_activate)
	
	ManagerGame.global_player_ref = self
	
	$Hurtbox.hp = hp


func _unhandled_input(event):
	if Input.is_action_just_pressed("attack"):
		attack()
	if Input.is_action_just_pressed("shoot"):
		shoot()


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
		
		dir = global_position.direction_to(global_position + velocity)
	else:
		playback.travel('idle')
	
	velocity.normalized()
	
	if move_and_slide():
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				#col.get_collider().get_parent().global_position += col.get_normal() * -push_force
				col.get_collider().apply_force(col.get_normal() * -push_force)


func death():
	pass


func attack():
	if can_attack == false:
		return
	
	var obj = cast.get_collider()
	if obj:
		obj.take_damage(1)
	
	is_attacking = true
	
	Sfx.play_sound('Slash')
	playback.travel('attack')
	
	can_attack = false


func shoot():
	if can_shoot == false:
		return
	
	$ShootTimer.start()
	can_shoot = false
	
	var projectile = load("res://actors/objects/Projectile.tscn").instantiate()
	projectile.direction = dir
	
	ManagerGame.global_world_ref.spawn_obj(projectile, global_position)


func receive_damage(damage = 1):
	print('player took a hit!')
	$Hurtbox.take_damage(damage)


func on_player_movement_activate(b):
	can_move = b


func _on_animation_tree_animation_finished(anim_name):
	is_attacking = false
	
	if anim_name == 'attack_up' or anim_name == 'attack_down' or anim_name == 'attack_left' or anim_name == 'attack_right':
		can_attack = true


func _on_hurtbox_zero():
	death()


func _on_shoot_timer_timeout():
	can_shoot = true
