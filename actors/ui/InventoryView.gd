extends Panel

@onready var list = $ScrollContainer/VBoxContainer






func _ready():
	load_items()


func load_items():
	for item in ManagerGame.player_data['inventory']:
		var slot = load("res://actors/ui/InvSlot.tscn").instantiate()
		slot.item_id = item
		
		list.add_child(slot)
