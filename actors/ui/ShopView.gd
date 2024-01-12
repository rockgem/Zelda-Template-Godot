extends Panel


@onready var list = $ScrollContainer/VBoxContainer

var items_data = {}

var current_item_selected = null

func _ready():
	$InfoPanel/Box.hide()
	$InfoPanel/Buttons/Buy.hide()
	
	items_data = ManagerGame.get_data("res://reso/data/items_data.json")
	var shop_items = ManagerGame.get_data("res://reso/data/shop_data.json")
	
	var items = shop_items['items']
	for item in items:
		var data = items_data[item]
		
		var i = load("res://actors/ui/InvSlot.tscn").instantiate()
		i.display(data)
		i.tapped.connect(on_item_tapped)
		
		list.add_child(i)


func update_display():
	$Gold.text = '%s' % ManagerGame.player_data['gold']


func on_item_tapped(data):
	current_item_selected = data
	
	$InfoPanel/Box.show()
	$InfoPanel/Buttons/Buy.show()
	
	$InfoPanel/Box/Icon.texture = load("res://reso/icons/items/%s.tres" % data['id'])
	$InfoPanel/Box/ItemName.text = '%s' % data['name']
	#$InfoPanel/Box/ItemType.text = ''


func _on_buy_pressed():
	if current_item_selected == null:
		return
	
	ManagerGame.put_item_to_inv(current_item_selected['id'])
