extends Panel

signal tapped(data)


var item_id = ''
var item_data = {}

func _ready():
	if item_data == {}:
		return
	
	display(item_data)


func display(data):
	if data:
		item_data = data
		
		$HBoxContainer/Icon.texture = load("res://reso/icons/items/%s.tres" % item_data['id'])
		$HBoxContainer/Name.text = item_data['name']
		
		if item_data.has('amount'):
			if item_data['amount'] > 1:
				$HBoxContainer/Icon/Amount.show()
				$HBoxContainer/Icon/Amount.text = 'x%s' % item_data['amount']


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		tapped.emit(item_data)
