extends Control


func _ready():
	ManagerGame.pop_to_ui.connect(pop_to_ui)


func pop_to_ui(instance, stack = false):
	for child in $Popup.get_children():
		child.queue_free()
	
	$Popup.add_child(instance)


func _on_bag_pressed():
	var i = load("res://actors/ui/InventoryView.tscn").instantiate()
	pop_to_ui(i)
