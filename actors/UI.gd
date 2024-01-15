extends Control


func _ready():
	ManagerGame.pop_to_ui.connect(pop_to_ui)
	ManagerGame.hp_changed.connect(update_hp)
	
	update_hp()


func pop_to_ui(instance, stack = false):
	for child in $Popup.get_children():
		child.queue_free()
	
	$Popup.add_child(instance)


func update_hp():
	for child in $Hearts.get_children():
		child.queue_free()
	
	for i in ManagerGame.player_data['hp']:
		var h = TextureRect.new()
		h.texture = load("res://reso/icons/heart.tres")
		$Hearts.add_child(h)


func _on_bag_pressed():
	var i = load("res://actors/ui/InventoryView.tscn").instantiate()
	pop_to_ui(i)
