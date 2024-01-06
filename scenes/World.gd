extends Node2D


func _ready():
	if ManagerGame.current_location != name and ManagerGame.current_location != '':
		for portal in get_tree().get_nodes_in_group('Portal'):
			if portal.towards == ManagerGame.current_location:
				portal.is_active = false
				$Player.global_position = portal.global_position
				break
	
	ManagerGame.current_location = name
	
	$Player.cam.limit_bottom = $BR.global_position.y
	$Player.cam.limit_top = $TL.global_position.y
	$Player.cam.limit_left = $TL.global_position.x
	$Player.cam.limit_right = $BR.global_position.x
