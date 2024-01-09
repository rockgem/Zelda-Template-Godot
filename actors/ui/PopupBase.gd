extends Control


func close():
	queue_free()


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		queue_free()
