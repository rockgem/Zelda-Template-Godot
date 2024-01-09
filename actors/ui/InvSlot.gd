extends Panel


var item_id = ''
var item_data = {}

func _ready():
	$HBoxContainer/Icon.texture = load("res://reso/icons/items/%s.tres" % item_id)
	$HBoxContainer/Name.text = item_data['name']
	
	if item_data.has('amount'):
		if item_data['amount'] > 1:
			$HBoxContainer/Icon/Amount.show()
			$HBoxContainer/Icon/Amount.text = 'x%s' % item_data['amount']
