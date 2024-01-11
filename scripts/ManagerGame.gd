extends Node

signal pop_to_ui(instance, stack)
signal player_movement_activate(b)

var save_path = 'user://data.save'

# ===========================

var current_location = ''


var player_data = {}
var monsters_data = {}
var items_data = {}

var global_player_ref = null
var global_world_ref = null

func _ready():
	monsters_data = get_data("res://reso/data/monsters_data.json")
	items_data = get_data("res://reso/data/items_data.json")


func _notification(what):
	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_game()


func get_data(path) -> Dictionary:
	var data
	
	var f = FileAccess.open(path, FileAccess.READ)
	var j = JSON.new()
	j.parse(f.get_as_text())
	data = j.data
	f.close()
	
	return data


func save_game():
	var f = FileAccess.open(save_path, FileAccess.WRITE)
	f.store_string(JSON.stringify(player_data))
	f.close()


func load_game():
	pass


func put_item_to_inv(item_id, amount = 1):
	var item_data = items_data[item_id].duplicate()
	
	if player_data['inventory'].has(item_id):
		player_data['inventory'][item_id]['amount'] += 1
	else:
		item_data['amount'] = 1
		player_data['inventory'][item_id] = item_data














