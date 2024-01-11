extends Panel


@onready var list = $ScrollContainer/VBoxContainer

var items_data = {}

func _ready():
	items_data = ManagerGame.get_data("res://reso/data/shop_data.json")
	
	var items = items_data['items']
	for item in items:
		pass
