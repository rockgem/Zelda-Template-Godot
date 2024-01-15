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
	var max_to_display = 6
	
	for child in $Hearts.get_children():
		if child is TextureRect:
			child.queue_free()
	
	for i in clamp(ManagerGame.player_data['hp'], 0, max_to_display):
		var h = TextureRect.new()
		h.texture = load("res://reso/icons/heart.tres")
		$Hearts/Control.add_sibling(h)
	
	if ManagerGame.player_data['hp'] > max_to_display:
		$Hearts/HealthAmount.show()
	else:
		$Hearts/HealthAmount.hide()
	
	$Hearts/HealthAmount.text = 'x%s' % ManagerGame.player_data['hp']


func _on_bag_pressed():
	var i = load("res://actors/ui/InventoryView.tscn").instantiate()
	pop_to_ui(i)
