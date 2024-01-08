extends Node2D

@export var id = ''

var monster_data = {}

func _ready():
	monster_data = ManagerGame.monsters_data[id]


func _on_hurtbox_hurt():
	pass # Replace with function body.


func _on_hurtbox_zero():
	for drop in monster_data['drops']:
		var rand = randf_range(1, 100)
		
		if rand <= drop[1]:
			var i = load("res://actors/Item.tscn").instantiate()
			i.item_id = drop[0]
			
			ManagerGame.global_world_ref.spawn_obj(i, global_position)
	
	queue_free()
