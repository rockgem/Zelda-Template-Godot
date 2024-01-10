extends Node2D


func _on_interactable_interacted():
	var i = load("res://actors/ui/ShopView.tscn").instantiate()
	
	ManagerGame.pop_to_ui.emit(i)
