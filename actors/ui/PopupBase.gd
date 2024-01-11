extends Control


func _ready():
	ManagerGame.player_movement_activate.emit(false)


func close():
	ManagerGame.player_movement_activate.emit(true)
	
	queue_free()


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		close()
