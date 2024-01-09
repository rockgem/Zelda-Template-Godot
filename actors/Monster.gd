extends Node2D

@export var id = ''

@export var wander_area: WanderArea

var move_speed = 60.0
var monster_data = {}

var is_moving = false
var is_attacking = false

var towards = Vector2.ZERO

func _ready():
	monster_data = ManagerGame.monsters_data[id]
	
	$WanderTimer.start(randf_range(0.5, 2.0))


func _physics_process(delta):
	return
	if is_moving:
		var dif = global_position.direction_to(towards)
		global_position += dif * move_speed * delta
		
		if global_position.distance_to(towards) < 1.0:
			is_moving = false


func _on_hurtbox_hurt():
	return


func _on_hurtbox_zero():
	for drop in monster_data['drops']:
		var rand = randf_range(1, 100)
		
		if rand <= drop[1]:
			var i = load("res://actors/Item.tscn").instantiate()
			i.item_id = drop[0]
			
			ManagerGame.global_world_ref.spawn_obj(i, global_position)
	
	queue_free()


func go_to(g_pos):
	towards = g_pos
	
	is_moving = true


func wander():
	if wander_area:
		go_to(wander_area.get_random_point())


func _on_wander_timer_timeout():
	wander()
	
	$WanderTimer.start(randf_range(3, 6))
