extends Node

var save_path = 'user://data.save'

# ===========================

var current_location = ''


var player_data = {}


func _ready():
	pass


func _notification(what):
	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		save_game()


func get_data(path) -> Dictionary:
	var data
	
	var f = FileAccess.open(path, FileAccess.READ)
	var j = JSON.new()
	j.parse(f.get_as_text())
	data = j.data
	
	return data


func save_game():
	pass


func load_game():
	pass
