extends Node2D


@onready var player = $Sort/Player

func _ready():
	if ManagerGame.current_location != name and ManagerGame.current_location != '':
		for portal in get_tree().get_nodes_in_group('Portal'):
			if portal.towards == ManagerGame.current_location:
				portal.is_active = false
				player.global_position = portal.global_position
				break
	
	ManagerGame.current_location = name
	
	player.cam.limit_bottom = $BR.global_position.y
	player.cam.limit_top = $TL.global_position.y
	player.cam.limit_left = $TL.global_position.x
	player.cam.limit_right = $BR.global_position.x
