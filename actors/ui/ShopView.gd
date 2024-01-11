extends Panel


@onready var list = $ScrollContainer/VBoxContainer

var items_data = {}

func _ready():
	items_data = ManagerGame.get_data("res://reso/data/items_data.json")
	var shop_items = ManagerGame.get_data("res://reso/data/shop_data.json")
	
	var items = shop_items['items']
	for item in items:
		var data = items_data[item]
		
		var i = load("res://actors/ui/InvSlot.tscn").instantiate()
		i.display(data)
		i.tapped.connect(on_item_tapped)
		
		list.add_child(i)


func on_item_tapped(data):
	pass
