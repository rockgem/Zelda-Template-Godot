extends Node

var current_location = ''


var player_data = {}


func _ready():
	pass


func _notification(what):
	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		save_game()


func save_game():
	pass


func load_game():
	pass
