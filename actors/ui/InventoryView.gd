extends Panel

@onready var list = $ScrollContainer/VBoxContainer






func _ready():
	load_items()
	
	$InfoPanel/Box.hide()
	
	for slot in list.get_children():
		slot.tapped.connect(on_tapped)


func load_items():
	var count = 0
	for item in ManagerGame.player_data['inventory']:
		var d = ManagerGame.player_data['inventory'][item]
		list.get_child(count).display(d)
	
	#for item in ManagerGame.player_data['inventory']:
		#var slot = load("res://actors/ui/InvSlot.tscn").instantiate()
		#slot.item_id = item
		#slot.item_data = ManagerGame.player_data['inventory'][item]
		#
		#list.add_child(slot)


func on_tapped(data):
	if data == {}:
		return
	
	$InfoPanel/Box.show()
	
	$InfoPanel/Box/VBoxContainer/ItemName.text = data['name']
	$InfoPanel/Box/Icon.texture = load("res://reso/icons/items/%s.tres" % data['id'])
