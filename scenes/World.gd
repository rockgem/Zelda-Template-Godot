extends Node2D


func _ready():
	$Player.cam.limit_bottom = $BR.global_position.y
	$Player.cam.limit_top = $TL.global_position.y
	$Player.cam.limit_left = $TL.global_position.x
	$Player.cam.limit_right = $BR.global_position.x
