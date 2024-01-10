extends Node2D

@export var id = ''

@export var wander_area: WanderArea

enum STATE {
	IDLE,
	MOVING,
	ATTACKING,
	CHASING,
	RETREAT
}

var move_speed = 40.0
var monster_data = {}

var state = STATE.IDLE

var towards = Vector2.ZERO
var inital_station_position = Vector2.ZERO

func _ready():
	monster_data = ManagerGame.monsters_data[id]
	
	$Hurtbox.hp = monster_data['hp']
	
	$WanderTimer.start(randf_range(0.5, 2.0))


func _physics_process(delta):
	if state == STATE.MOVING:
		var dif = global_position.direction_to(towards)
		global_position += dif * move_speed * delta
		
		if global_position.distance_to(towards) < 1.0:
			state = STATE.IDLE
	elif state == STATE.CHASING:
		var dif = global_position.direction_to(ManagerGame.global_player_ref.global_position)
		if global_position.distance_to(ManagerGame.global_player_ref.global_position) > 16.0:
			global_position += dif * move_speed * delta
		
		if global_position.distance_to(ManagerGame.global_player_ref.global_position) < 18.0 and $AttackTimer.is_stopped():
			$AttackTimer.start()
		
		if global_position.distance_to(inital_station_position) > 64:
			state = STATE.RETREAT
	elif state == STATE.RETREAT:
		var dif = global_position.direction_to(inital_station_position)
		global_position += dif * move_speed * delta
		
		if global_position.distance_to(inital_station_position) < 1.0:
			state = STATE.IDLE
			
			_on_wander_timer_timeout()


func attack():
	if global_position.distance_to(ManagerGame.global_player_ref.global_position) < 18.0:
		ManagerGame.global_player_ref.receive_damage(1)
		
		$AttackTimer.start()


func _on_hurtbox_hurt():
	$WanderTimer.stop()
	inital_station_position = global_position
	
	state = STATE.CHASING


func _on_hurtbox_zero():
	for drop in monster_data['drops']:
		var rand = randf_range(1, 100)
		
		if rand <= drop[1]:
			var i = load("res://actors/Item.tscn").instantiate()
			i.item_id = drop[0]
			
			ManagerGame.global_world_ref.spawn_obj(i, global_position)
	
	queue_free()


func go_to(g_pos):
	state = STATE.MOVING
	towards = g_pos


func wander():
	if wander_area:
		go_to(wander_area.get_random_point())


func _on_wander_timer_timeout():
	wander()
	
	$WanderTimer.start(randf_range(3, 6))


func _on_attack_timer_timeout():
	attack()
