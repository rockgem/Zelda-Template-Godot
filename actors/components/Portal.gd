extends Area2D


@export var towards = ''

var is_active = true

func _on_body_entered(body):
	if is_active:
		get_tree().change_scene_to_file("res://scenes/%s.tscn" % towards)


func _on_body_exited(body):
	if is_active == false:
		is_active = true
